package com.xworkz.app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.*;
import java.time.LocalDate;
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MediSalesDto {

    private int id;
    @NotNull(message = "Company Name  Should Not Be Null")
    @Size(min = 4,max = 40,message = "ompany Name should have min 4 and max 40 characters")
    private String companyName;
    @NotNull(message = "Person Contact  Should Not Be Null")
    @Size(min = 4,max = 40,message = "Person Contact should have min 4 and max 40 characters")
    private String personContact;
    @NotNull(message = "Business Type  Should Not Be Null")
    @Size(min = 4,max = 40,message = "Business Type should have min 4 and max 40 characters")
    private String businessType;
    @NotNull(message = "Registered Number  Should Not Be Null")
    private Long registeredMobile;
    @NotNull(message = "Email  Should Not Be Null")
    @Size(min = 4,max = 40,message = "Email should have min 4 and max 40 characters")
    private String registeredEmail;
    @NotNull(message = "Address1  Should Not Be Null")
    @Size(min = 4,max = 40,message = "Address1 should have min 4 and max 40 characters")
    private String address1;
    @NotNull(message = "Address2  Should Not Be Null")
    @Size(min = 4,max = 40,message = "Address2 should have min 4 and max 40 characters")
    private String address2;
    @Min(value = 100000, message = "Pin Code must be at least 6 digits")
    @Max(value = 999999, message = "Pin Code must be at most 6 digits")
    private int pinCode;
    @NotNull(message = "Referral  Should Not Be Null")
    @Size(min = 4,max = 40,message = "Referral  should have min 4 and max 40 characters")
    private String referral;
    @NotNull(message = "Password Should Not Be Null")
    @Size(min = 4,max = 20,message = "Password  should have min 4 and max 20 characters")
    private String password;
    @NotNull(message = "Confirm password Should Not Be Null")
    @Size(min = 3,max = 25,message = "Confirm password should have min 3 and max 25 characters")
    private String confirmPassword;
    private String createdBy;
    private LocalDate createdDate;
    private String updatedBy;
    private LocalDate updateDate;
    private Integer noOfAttempts;
    private String otp;
    private String profilePhoto;
    private String fileType;
}
