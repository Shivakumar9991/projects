package com.xworkz.app.service;

import com.xworkz.app.dto.MediSalesDto;
import com.xworkz.app.dto.ProductDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MediSalesService {
    boolean validateAndSave(MediSalesDto mediSalesDto);
    MediSalesDto validateAndSignIn(String email, String password);
    MediSalesDto validateAndGetEntityByEmail(String email);
    MediSalesDto validateAndGetEntityByNumber(Long  number);

    boolean validateAndUpdatePasswordByEmail(String email, String password, String confirmPassword);

    MediSalesDto updateProfile(MultipartFile multipartFile, MediSalesDto mediSalesDto, MediSalesDto sessionDto);

    String checkEmail(String email);

    String checkRegisteredMobile(Long contact);

    boolean validateAndAddProduct(ProductDto productDto, MediSalesDto mediSalesDto);

    List<ProductDto> validateAndGetAllProducts();

    MediSalesDto getUserByCustomerName(String contactPerson);

    ProductDto getDistributorDtoByProductName(String productName);

    List<MediSalesDto> validateAndGetAllCustomer();

    Double getStockByProduct(String productName);

    boolean sendEmail(String subject, String body, String email);

    void pdfGenerate(List<ProductDto> productDtoList,MediSalesDto mediSalesDto, Object finalAmount);

    String validateOtp(String otp, String registeredEmail);

    String sendOtp(String email);
}
