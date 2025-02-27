package com.xworkz.app.service;

import com.xworkz.app.Constants.ProfilePhotoPath;
import com.xworkz.app.dto.UserDto;
import com.xworkz.app.entity.UserRegistrationEntity;
import com.xworkz.app.repository.UserRegistrationRepoImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.Random;

import static com.xworkz.app.Constants.ProfilePhotoPath.FROM_NAME;

@Slf4j
@Service
public class UserRegistrationServiceImpl implements  UserRegistrationService{
    @Autowired
    private UserRegistrationRepoImpl userRegistrationRepo ;
    @Autowired
    private PasswordEncoder passwordEncoder;

   @Override
    public boolean validateAndSave( UserDto userDto) {
       System.out.println("validate and save started");
       UserRegistrationEntity userRegistrationEntity = new UserRegistrationEntity();
       userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
       boolean isAdded=false;
        if(userDto.getFirstName()!=null) {
            BeanUtils.copyProperties(userDto, userRegistrationEntity);
            userRegistrationEntity.setAttempts(0);
            userRegistrationEntity.setCreatedBy(userDto.getFirstName());
            userRegistrationEntity.setCreatedDate(LocalDate.now());
            isAdded=userRegistrationRepo.save(userRegistrationEntity);
            System.out.println(isAdded);
            sendEmail("Registration","Thank you for registering",userDto.getEmail());
            return isAdded;

        }
       System.out.println("validate and save ended");
        return isAdded;
    }

    @Override
    public UserDto validateAndGetEntityByEmail(String email) {
      UserDto userDto = new UserDto();
      UserRegistrationEntity entity=userRegistrationRepo.getEntityByEmail(email);
      if(entity!=null){
          BeanUtils.copyProperties(entity,userDto);
          return userDto;
      }
      return null;
    }

    @Override
    public boolean validateAndUpdatePasswordByEmail(String email,String password,String confirmPassword) {
       boolean isUpdated=false;
       String pass =passwordEncoder.encode(password);
        return userRegistrationRepo.updatePasswordByEmail(email,pass,confirmPassword);
    }

    @Override
    public boolean emailExit(String email)   {
        return userRegistrationRepo.getEntityByEmail(email) !=null;
    }
    @Autowired
    private JavaMailSender javaMailSender;
    @Override
    public boolean sendEmail(String subject, String body, String email) {
        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
            mimeMessageHelper.setFrom(ProfilePhotoPath.FROM_EMAIL.getPath(),FROM_NAME.getPath());
            mimeMessageHelper.addTo(email);
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(body);
        };
        javaMailSender.send(preparator);
        return true;
}

    @Override
    public UserDto updateProfile(MultipartFile multipartFile, UserDto userDto, UserDto sessionDto) {
       if(multipartFile.isEmpty()){
           log.info("File is empty");
       }else {
           try {
               byte[] bytes=multipartFile.getBytes();
               Path path=Paths.get(ProfilePhotoPath.PROFILE_PHOTO_PATH.getPath()+multipartFile.getOriginalFilename());
               Files.write(path,bytes);
           } catch (IOException e) {
               log.error("{}",e.getMessage());
           }
       }

        System.out.println("validate and update started");
        UserRegistrationEntity userRegistrationEntity = new UserRegistrationEntity();
            BeanUtils.copyProperties(userDto, userRegistrationEntity);
            userRegistrationEntity.setUpdatedBy(sessionDto.getFirstName());
            userRegistrationEntity.setUpdatedDate(LocalDate.now());
            userRegistrationEntity.setCreatedBy(sessionDto.getEmail());
            userRegistrationEntity.setCreatedDate(LocalDate.now());
            userRegistrationEntity.setProfilePhoto(multipartFile.getOriginalFilename());
            userRegistrationEntity.setFileType(multipartFile.getContentType());
            System.out.println(userRegistrationEntity);
            UserRegistrationEntity entity=userRegistrationRepo.updateProfile(userRegistrationEntity);
            log.info("{}",entity);
            UserDto dto=new UserDto();
            BeanUtils.copyProperties(entity,dto);
            return dto;

    }

    @Override
    public String checkEmail(String email) {
        boolean emailExist =userRegistrationRepo.checkEmail(email);
        if(emailExist){
            return "Email already exists...";
        }
        return "Email Doesn't Exists";
    }

    @Override
    public String checkContact(Long contact) {
        boolean contactExist =userRegistrationRepo.checkContact(contact);
        if(contactExist){
            return "Number already exists...";
        }
        return "Number Doesn't Exists";
    }

    @Override
    public UserDto validateAndLogin(String email, String password) {
        UserDto userDto = new UserDto();
        UserRegistrationEntity entity = userRegistrationRepo.getEntityByEmail(email);
        if (entity!=null && entity.getEmail()!= null && entity.getPassword()!=null &&
                entity.getEmail().equalsIgnoreCase(email)&&
                passwordEncoder.matches(password, entity.getPassword())) {
            BeanUtils.copyProperties(entity, userDto);
            return userDto;
        } else {
            UserRegistrationEntity entity1 = userRegistrationRepo.getEntityByEmail(email);
            log.info("Attempt entity:{}",entity1);
            entity1.setAttempts(entity1.getAttempts()+1);
            userRegistrationRepo.updateProfile(entity1);
            log.info("No of attempts: {}",entity1.getAttempts());

           UserDto userDto1=new UserDto();
            userDto1.setAttempts(entity1.getAttempts());
            log.info("User dto:{}",userDto1.getAttempts());
            return  userDto1;
        }

    }

    @Override
    public String sendOtp(String email) {
        UserRegistrationEntity entity=userRegistrationRepo.getEntityByEmail(email);
        log.info("{}",email);
        if(entity.getEmail()!=null){
            Random random=new Random();
            Integer otp=random.nextInt(9999);
            log.info("otp:{}",otp);
            sendEmail("otp Verification","your otp is : "+otp,email);
            entity.setOtp(otp.toString());
           userRegistrationRepo.updateProfile(entity);
           return  otp.toString();
        }else
            return "otp not sent";
    }

    @Override
    public String validateOtp(String otp, String email) {
        UserRegistrationEntity entity=userRegistrationRepo.getEntityByEmail(email);
        log.info("validate otp method:{}"+entity);
        if(entity.getOtp().equals(otp)){
            return "valid otp";
        }
        return "otp not valid";
    }


}
