package com.xworkz.app.entity;

import lombok.Data;
import javax.persistence.*;
import java.time.LocalDate;
@Data
@Entity
@Table(name = "medi_sales_info")
@NamedQueries({@NamedQuery(name = "findEntityByEmailAndPassword",query = "select entity from MediSalesEntity entity where entity.registeredEmail=:email " +
        "and entity.password=:password"),
        @NamedQuery(name = "getAllCustomers",query = " from MediSalesEntity"),
        @NamedQuery(name = "updatePasswordByEmail",query = "update MediSalesEntity entity set entity.password=:password ,entity.confirmPassword=:confirmPassword where entity.registeredEmail=:email"),
        @NamedQuery(name = "save",query = "select count(a) from MediSalesEntity a where a.registeredEmail=:checkRegisteredEmail"),
        @NamedQuery(name = "getEntityByEmail",query = "select entity from MediSalesEntity entity where entity.registeredEmail=:email"),
        @NamedQuery(name = "getEntityByNumber",query = "select entity from MediSalesEntity entity where entity.registeredMobile=:mobile")

})
public class MediSalesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "company_name")
    private String companyName;
    @Column(name = "person_contact")
    private String personContact;
    @Column(name = "business_type")
    private String businessType;
    @Column(name = "registered_mobile")
    private Long registeredMobile;
    @Column(name = "registered_email")
    private String registeredEmail;
    @Column(name = "address1")
    private String address1;
    @Column(name = "address2")
    private String address2;
    @Column(name = "pincode")
    private int pinCode;
    @Column(name = "referral")
    private String referral;
    @Column(name = "passwordd")
    private String password;
    @Column(name = "confirm_password")
    private String confirmPassword;
    @Column(name = "created_by")
    private String createdBy;
    @Column(name = "created_date")
    private LocalDate createdDate;
    @Column(name = "updated_by")
    private String updatedBy;
    @Column(name = "updated_date")
    private LocalDate updateDate;
    @Column(name = "no_of_attempts")
    private Integer noOfAttempts;
    @Column(name = "otp")
    private String otp;
    @Column(name = "profile_photo")
    private String profilePhoto;
    @Column(name = "file_type")
    private String fileType;
}
