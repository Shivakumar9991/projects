package com.xworkz.app.repository;

import com.xworkz.app.dto.UserDto;
import com.xworkz.app.entity.UserRegistrationEntity;
import org.springframework.ui.Model;

import java.util.List;

public interface UserRegistrationRepo {
    boolean save(UserRegistrationEntity userRegistration);
    UserRegistrationEntity getEntityByEmail(String email);
    boolean updatePasswordByEmail(String email,String password,String confirmPassword );

    UserRegistrationEntity updateProfile(UserRegistrationEntity userRegistration);
    boolean checkEmail(String email);

    boolean checkContact(Long contact);
}
