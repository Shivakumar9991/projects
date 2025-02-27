package com.xworkz.app.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "registration_form")
@NamedQueries({@NamedQuery(name = "getEntityByEmail",query = "select entity from UserRegistrationEntity entity where entity.email=:email"),
              @NamedQuery(name = "updatePasswordByEmail",query = "update UserRegistrationEntity entity set entity.password=:password ,entity.confirmPassword=:confirmPassword where entity.email=:email"),
              @NamedQuery(name = "save",query = "select count(a) from UserRegistrationEntity a where a.email=:emailCheck"),
        @NamedQuery(name = "checkNumber",query = "select count(a) from UserRegistrationEntity a where a.contact=:checkContact")
})
public class UserRegistrationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "dob")
    private String dob;
    @Column(name = "contact")
    private long contact;
    @Column(name = "alternative_contact")
    private long alternativeContact;
    @Column(name = "email")
    private String email;
    @Column(name = "alter_email ")
    private String alterEmail;
    @Column(name = "user_password")
    private  String password;
    @Column(name = "confirm_password")
    private String confirmPassword;
    @Column(name = "place")
    private String place;
    @Column(name = "state")
    private String state;
    @Column(name = "district")
    private String district;
    @Column(name = "created_by")
    private String createdBy;
    @Column(name = "created_date")
    private LocalDate createdDate;
    @Column(name = "updated_by")
    private String updatedBy;
    @Column(name = "updated_date")
    private  LocalDate updatedDate;
    @Column(name = "profile_photo")
    private String profilePhoto;
    @Column(name = "file_type")
    private String fileType;
    @Column(name = "otp")
    private String otp;
    @Column(name = "attempts")
    private Integer attempts;


}
