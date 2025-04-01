package com.xworkz.app.controller;

import com.xworkz.app.dto.MediSalesDto;
import com.xworkz.app.entity.MediSalesEntity;
import com.xworkz.app.repo.MediSalesRepo;
import com.xworkz.app.service.MediSalesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.StringReader;

@Slf4j
@Controller
public class MediSalesController {
    @Autowired
    MediSalesService mediSalesService;

    @GetMapping("index")
    public String index(){
        return "index";
    }
    @GetMapping("logIn")
    public String logIn(){
        return "logIn";
    }
    @GetMapping("registration")
    public String registration(){
        return "registration";
    }
    @GetMapping("dashboard")
    public String dashboard(){
        return "dashboard";
    }

    @GetMapping("response")
    public  String response(){
        return "response";
    }
    @GetMapping("forgetPassword")
    public String forgetPassword(){
        return "forgetPassword";
    }
    @PostMapping("registration")
    public  String save(@Valid MediSalesDto mediSalesDto , BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes){

        log.info("Save Method Started");
        if(bindingResult.hasErrors()){
            log.info("UserDto has validation error");
            bindingResult.getFieldErrors().forEach(fieldError -> {
                if(fieldError instanceof FieldError) {
                    FieldError fieldError1=(FieldError) fieldError;
                    log.info("{} Error Message :: {}",fieldError1.getField(), fieldError1.getDefaultMessage());
                    model.addAttribute(fieldError1.getField()+"Error",fieldError1.getDefaultMessage());
                    if (fieldError.getField().equalsIgnoreCase("Company Name")) {
                        model.addAttribute("CompanyNameError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Person Contact")) {
                        model.addAttribute("PersonContactError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Business Type")) {
                        model.addAttribute("BusinessTypeError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Registered Mobile")) {
                        model.addAttribute("RegisteredMobileError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Registered Email")) {
                        model.addAttribute("RegisteredEmailError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Address1")) {
                        model.addAttribute("Address1Error", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Address2")) {
                        model.addAttribute("Address2Error", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Pin Code")) {
                        model.addAttribute("PinCodeError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Referral")) {
                        model.addAttribute("ReferralError", fieldError.getDefaultMessage());
                    }

                    if (fieldError.getField().equalsIgnoreCase("Password")) {
                        model.addAttribute("PasswordError", fieldError.getDefaultMessage());
                    }

                    if (fieldError.getField().equalsIgnoreCase("Confirm Password")) {
                        model.addAttribute("ConfirmPasswordError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Profile Photo")) {
                        model.addAttribute("ProfilePhotoError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("File Type")) {
                        model.addAttribute("FileTypeError", fieldError.getDefaultMessage());
                    }

                }
            });
            return "registration";
        }

        if(mediSalesService.validateAndSave( mediSalesDto)){
            model.addAttribute("name",mediSalesDto.getCompanyName());
            log.info("Data saved successfully");
            return "response";
        }else {
            redirectAttributes.addAttribute("emailError","Email Already Exists");
        }
        return "registration";
    }

   @PostMapping("logIn")
    public String signIn(@RequestParam String email, String password, Model model,HttpSession session){
       System.out.println("Login Controller Started");
        MediSalesDto mediSalesDto=mediSalesService.validateAndSignIn(email,password);
        log.info("Email is:{}",email);
        log.info("Password is:{}",password);
        session.setAttribute("sessionDto",mediSalesDto);
        if(mediSalesDto.getRegisteredEmail()!=null){
            log.info("User Sign is Successfully Completed");
            model.addAttribute("dto",mediSalesDto);
            model.addAttribute("email",mediSalesDto.getRegisteredEmail());
            System.out.println("Login Controller Ended1");
            return "dashboard";

        }else{
            model.addAttribute("email",email);
            model.addAttribute("EmailNotFound","Email or Password Doesn't Match");
            if(mediSalesDto.getNoOfAttempts()>= 3){
                log.info("Blocking a sign");
                model.addAttribute("EmailNotFound","Your Account Is Blocked");
            }
        }
       System.out.println("Login Controller Ended2");
        return "logIn";
    }

    @GetMapping("fetch")
    public String getEntityByEmail(String email, Model model, HttpSession httpSession){
        MediSalesDto mediSalesDto=mediSalesService.validateAndGetEntityByEmail(email);
        httpSession.setAttribute("mediSales",mediSalesDto);
        model.addAttribute("mediDto",mediSalesDto);
        return "updateProfile";

    }

    @PostMapping("resetPasswordForm")
    public String updatePassword(String email , String password , String confirmPassword,Model model){
        boolean isUpdated=mediSalesService.validateAndUpdatePasswordByEmail(email,password,confirmPassword);
        if(isUpdated){
            model.addAttribute("message","Password Updated Successfully");
            return "forgetPassword";
        }else {

            model.addAttribute("message","Password Not Updated");
            return "forgetPassword";
        }
    }

    @PostMapping("update")
    public String updateEntity(MediSalesDto mediSalesDto, Model model, HttpServletRequest request,@RequestParam("file") MultipartFile multipartFile){
        System.out.println(mediSalesDto);
        log.info("Update Entity Method Started");
        log.info("file: {}",multipartFile.getOriginalFilename());
        log.info("{}",mediSalesDto);
        MediSalesDto sessionDto=(MediSalesDto) request.getSession().getAttribute("newYear");
        log.info("{}",sessionDto);
        MediSalesDto mediSalesDto1 =mediSalesService.updateProfile(multipartFile,mediSalesDto,sessionDto);
        model.addAttribute("dto",mediSalesDto1);
        model.addAttribute("success","Updated Successfully");
        log.info("Update Entity Method Ended");
        return "updateProfile";

    }
    @GetMapping("validateOtp")
    public String validateOtp(@RequestParam String otp,@RequestParam String registeredEmail, Model model){
        mediSalesService.validateOtp(otp,registeredEmail);
        return "forgetPassword";
    }



}
