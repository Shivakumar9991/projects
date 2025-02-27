package com.xworkz.app.service;

import com.xworkz.app.dto.UserDto;
import org.springframework.web.multipart.MultipartFile;

public interface UserRegistrationService {
    boolean validateAndSave(UserDto userDto);
    UserDto validateAndGetEntityByEmail(String email);
    boolean validateAndUpdatePasswordByEmail(String email ,String password,String confirmPassword);

    boolean emailExit(String email);
    boolean sendEmail(String subject, String body,String email);
    UserDto updateProfile(MultipartFile multipartFile,UserDto userDto, UserDto sessionDto);

    String checkEmail(String email);

    String checkContact(Long contact);

    UserDto validateAndLogin(String email, String password);

    String sendOtp(String email);

    String validateOtp(String otp, String email);
}
