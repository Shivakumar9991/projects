package com.xworkz.app.controller;

import com.xworkz.app.Constants.ProfilePhotoPath;
import com.xworkz.app.dto.UserDto;
import com.xworkz.app.entity.UserRegistrationEntity;
import com.xworkz.app.service.UserRegistrationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Slf4j
@Controller

public class UserRegistrationController {
    @Autowired
    UserRegistrationService service;
    @GetMapping("dashboard")
    public String dashboard(){
        return "dashboard";
    }
    @GetMapping("forgetPassword")
    public  String forgetPassword(){
        return "forgetPassword";
    }
    @GetMapping("index")
    public String index(){
        return "index";
    }
    @GetMapping("registration")
    public String registration(){
        return "registration";
    }
    @GetMapping("response")
    public String response() {
        return "response";
    }
    @GetMapping("signIn")
    public String signIn(){
       return "signIn";
    }

    @GetMapping("updateProfile")
    public String updateProfile(){
        return "updateProfile";
    }
    @PostMapping("user")
    public  String save(@Valid  UserDto userDto , BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes){

        log.info("Save Method Started");
        if(bindingResult.hasErrors()){
            log.info("UserDto has validation error");
            bindingResult.getFieldErrors().forEach(fieldError -> {
                if(fieldError instanceof FieldError) {
                    FieldError fieldError1=(FieldError) fieldError;
                    log.info("{} Error Message :: {}",fieldError1.getField(), fieldError1.getDefaultMessage());
                    model.addAttribute(fieldError1.getField()+"Error",fieldError1.getDefaultMessage());
                    if (fieldError.getField().equalsIgnoreCase("FirstName")) {
                        model.addAttribute("FirstNameError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("LastName")) {
                        model.addAttribute("LastNameError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Email")) {
                        model.addAttribute("EmailError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Alter Email")) {
                        model.addAttribute("AlterEmailError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Password")) {
                        model.addAttribute("PasswordError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("ConfirmPassword")) {
                        model.addAttribute("ConfirmPasswordError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Contact")) {
                        model.addAttribute("ContactError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("AlternativeContact")) {
                        model.addAttribute("AlternativeContactError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Place")) {
                        model.addAttribute("PlaceError", fieldError.getDefaultMessage());
                    }

                    if (fieldError.getField().equalsIgnoreCase("District")) {
                        model.addAttribute("DistrictError", fieldError.getDefaultMessage());
                    }

                    if (fieldError.getField().equalsIgnoreCase("State")) {
                        model.addAttribute("StateError", fieldError.getDefaultMessage());
                    }
                }
            });
            return "registration";
        }

        if(service.validateAndSave(userDto)){
            model.addAttribute("name",userDto.getFirstName());
            log.info("Data saved successfully");
            return "response";
        }else {
              redirectAttributes.addAttribute("emailError","Email Already Exist");
        }
        return "response";

    }

    @PostMapping("signin")
    public String signIn( String email,String password , Model model){
        System.out.println("sign in started");
        log.info("Email is {}",email);
        log.info("Password is {}",password);
        UserDto userDto=service.validateAndLogin(email,password);
        if(userDto.getEmail()!=null){
            log.info("user sign in successfully completed ");
            model.addAttribute("dto",userDto);
            model.addAttribute("email",userDto.getEmail());
            return "dashboard";
        }else {
            model.addAttribute("email",email);
            model.addAttribute("EmailNotFound", "Email or Password Doesn't Match");
            if (userDto.getAttempts() >= 3) {
                log.info("Blocking A sign");
                model.addAttribute("EmailNotFound", "Your Account Is Blocked");
            }
            return "signIn";
        }
    }
    @PostMapping("resetPasswordForm")
    public String updatePassword(String email,String password,String confirmPassword,Model model){
      boolean isUpdated=service.validateAndUpdatePasswordByEmail(email,password,confirmPassword);
      if(isUpdated){
          model.addAttribute("message","Password Updated Successfully");
          return "forgetPassword";
      }
      else {
          model.addAttribute("message","password not updated");
          return "forgetPassword";
      }
    }
    @GetMapping("fetch")
    public  String getEntity( @RequestParam String email , Model model, HttpSession session){
      /* UserDto userDto = new UserDto();
       log.info("email is {}",email);
        UserRegistrationEntity entity = service.validateAndGetEntityByEmail(email);
        BeanUtils.copyProperties(entity,userDto);
        System.out.println(userDto);
        model.addAttribute("dto",userDto);*/
        UserDto userDto=service.validateAndGetEntityByEmail(email);
        session.setAttribute("newYear",userDto);
        model.addAttribute("dto",userDto);
       return "updateProfile";

    }

    @PostMapping("update")
    public String updateEntity(UserDto userDto , Model model, HttpServletRequest request, @RequestParam("file")MultipartFile multipartFile){

        System.out.println(userDto);
        log.info("Update Entity Method Started");
        log.info("file: {}",multipartFile.getOriginalFilename());
        log.info("{}",userDto);
        UserDto sessionDto=(UserDto) request.getSession().getAttribute("newYear");
        log.info("{}",sessionDto);
        UserDto userDto1 =service.updateProfile(multipartFile,userDto,sessionDto);
        model.addAttribute("dto",userDto1);
        model.addAttribute("success","Updated Successfully");
        log.info("Update Entity Method Ended");
        return "updateProfile";
    }
    @GetMapping("view/{imageName}")
      public  void  getImage(@PathVariable String imageName, HttpServletResponse response) throws IOException {
        Path path=Paths.get(ProfilePhotoPath.PROFILE_PHOTO_PATH.getPath()+imageName);
             log.info("{}",path);
        Files.copy(path,response.getOutputStream());
        response.getOutputStream().flush();

      }
      @GetMapping("validateOtp")
      public String validateOtp(@RequestParam String otp,@RequestParam String email, Model model){
        service.validateOtp(otp,email);
        return "forgetPassword";
      }


}
