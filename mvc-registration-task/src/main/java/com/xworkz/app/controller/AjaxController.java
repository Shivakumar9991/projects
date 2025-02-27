package com.xworkz.app.controller;

import com.xworkz.app.service.UserRegistrationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api")
@RestController
@Slf4j
public class AjaxController {

    @Autowired
    private UserRegistrationService service;

    @GetMapping("checkEmail/{email}")
    public String checkEmailExist(@PathVariable String email){
        log.info("check email exist..{}");
        return service.checkEmail(email);
    }
    @GetMapping("checkContact/{contact}")
    public String contactNumber(@PathVariable Long contact){
        log.info("check number exist..{}");
        return service.checkContact(contact);
    }
    @GetMapping("sendOtp/{email}")
    public String sendOtp(@PathVariable String email , Model model){
        return service.sendOtp(email);
    }
}
