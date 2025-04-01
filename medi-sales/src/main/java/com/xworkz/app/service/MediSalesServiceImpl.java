package com.xworkz.app.service;

import com.itextpdf.html2pdf.HtmlConverter;
import com.xworkz.app.constants.Message;
import com.xworkz.app.constants.ProfilePhotoPath;
import com.xworkz.app.dto.MediSalesDto;
import com.xworkz.app.dto.ProductDto;
import com.xworkz.app.entity.MediSalesEntity;
import com.xworkz.app.entity.ProductEntity;
import com.xworkz.app.repo.MediSalesRepoImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static com.xworkz.app.constants.ProfilePhotoPath.FROM_NAME;
import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

@Slf4j
@Service
public class MediSalesServiceImpl implements MediSalesService {

    @Autowired
    private MediSalesRepoImpl mediSalesRepo;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean validateAndSave(MediSalesDto mediSalesDto) {
        log.info(Message.VALIDATE_AND_LOGIN.getMessage());
        boolean isAdded = false;
        MediSalesEntity entity = new MediSalesEntity();
        if (mediSalesDto != null && mediSalesDto.getCompanyName() != null && mediSalesDto.getPersonContact() != null) {
            BeanUtils.copyProperties(mediSalesDto, entity);
            entity.setNoOfAttempts(0);
            entity.setPassword(passwordEncoder.encode(entity.getPassword()));
            entity.setCreatedBy(mediSalesDto.getRegisteredEmail());
            entity.setCreatedDate(LocalDate.now());
            log.info("Email sent successfully :{}", entity);
             sendEmail("Registration","Thank You For Registering",mediSalesDto.getRegisteredEmail());
            isAdded = mediSalesRepo.save(entity);
        }

        return isAdded;
    }

    @Override
    public MediSalesDto validateAndSignIn(String email, String password) {
        System.out.println("Login Service Started");
        MediSalesDto mediSalesDto = new MediSalesDto();
        MediSalesEntity entity = mediSalesRepo.getEntityByEmail(email);
        if (entity != null && entity.getRegisteredEmail() != null && entity.getPassword() != null &&
                entity.getRegisteredEmail().equalsIgnoreCase(email) &&
                passwordEncoder.matches(password, entity.getPassword())
        ) {
            BeanUtils.copyProperties(entity, mediSalesDto);
            System.out.println(entity.getPassword());
            System.out.println("Login Service Ended1");
            return mediSalesDto;
        } else {
            MediSalesEntity entity1 = mediSalesRepo.getEntityByEmail(email);
            log.info("Attempt entity:{}", entity1);
            entity1.setNoOfAttempts(entity1.getNoOfAttempts() + 1);
            mediSalesRepo.updateProfile(entity1);
            log.info("No of attempts: {}", entity1.getNoOfAttempts());

            MediSalesDto mediSalesDto1 = new MediSalesDto();
            mediSalesDto1.setNoOfAttempts(mediSalesDto1.getNoOfAttempts());
            log.info("Medi sale dto:{}", mediSalesDto1.getNoOfAttempts());
            System.out.println("Login Service Ended2");
            return mediSalesDto1;
        }
    }

    @Override
    public MediSalesDto validateAndGetEntityByEmail(String email) {
        MediSalesDto mediSalesDto = new MediSalesDto();
        MediSalesEntity entity = mediSalesRepo.getEntityByEmail(email);
        if (entity != null) {
            BeanUtils.copyProperties(entity, mediSalesDto);
            return mediSalesDto;
        }
        return null;
    }

    @Override
    public MediSalesDto validateAndGetEntityByNumber(Long number) {
        MediSalesDto mediSalesDto = new MediSalesDto();
        MediSalesEntity entity = mediSalesRepo.getEntityByNumber(number);
        if (entity != null) {
            BeanUtils.copyProperties(entity, mediSalesDto);
            return mediSalesDto;
        }

        return null;
    }

    @Override
    public boolean validateAndUpdatePasswordByEmail(String email, String password, String confirmPassword) {
        boolean isUpdated = false;
        String pass = passwordEncoder.encode(password);
        return mediSalesRepo.updatePasswordByEmail(email, pass, confirmPassword);
    }

    @Override
    public MediSalesDto updateProfile(MultipartFile multipartFile, MediSalesDto mediSalesDto, MediSalesDto sessionDto) {
        if (multipartFile.isEmpty()) {
            log.info("File Is Empty");
        } else {
            try {
                byte[] bytes = multipartFile.getBytes();
                Path path = Paths.get(ProfilePhotoPath.PROFILE_PHOTO_PATH.getPath() + multipartFile.getOriginalFilename());
                Files.write(path, bytes);
            } catch (IOException e) {
                log.info("{}", e.getMessage());
            }
        }
        MediSalesEntity mediSalesEntity = new MediSalesEntity();
        BeanUtils.copyProperties(mediSalesDto, mediSalesEntity);
        mediSalesEntity.setUpdatedBy(sessionDto.getRegisteredEmail());
        mediSalesEntity.setUpdateDate(LocalDate.now());
        mediSalesEntity.setCreatedBy(sessionDto.getCreatedBy());
        mediSalesEntity.setCreatedDate(LocalDate.now());
        mediSalesEntity.setProfilePhoto(multipartFile.getOriginalFilename());
        mediSalesEntity.setFileType(multipartFile.getContentType());
        System.out.println(mediSalesEntity);
        MediSalesEntity entity = mediSalesRepo.updateProfile(mediSalesEntity);
        log.info("{}", entity);
        MediSalesDto mediSalesDto1 = new MediSalesDto();
        BeanUtils.copyProperties(entity, mediSalesDto1);


        return mediSalesDto1;
    }

    @Override
    public String checkEmail(String email) {
        MediSalesEntity entity = mediSalesRepo.getEntityByEmail(email);
        if (entity != null) {
            return "Email already exists...";
        }
        return "Email Doesn't Exists";
    }

    @Override
    public String checkRegisteredMobile(Long contact) {
        MediSalesEntity entity = mediSalesRepo.getEntityByNumber(contact);
        if (entity != null) {
            return "Contact Already Exists...";
        }
        return "Contact Doesn't Exists";
    }

    @Override
    public boolean validateAndAddProduct(ProductDto productDto, MediSalesDto mediSalesDto) {
        boolean isAdded = false;
        if (productDto.getProductName() != null) {
            ProductEntity productEntity = new ProductEntity();
            Date currentDate = new Date();
            SimpleDateFormat dayFormat = new SimpleDateFormat("dd");
            String day = dayFormat.format(currentDate);
            SimpleDateFormat minuteFormat = new SimpleDateFormat("mm");
            String minute = minuteFormat.format(currentDate);
            SimpleDateFormat secondFormat = new SimpleDateFormat("ss");
            String second = secondFormat.format(currentDate);
            String hsnCode = day + minute + second;

            char productInitial = productDto.getProductName().charAt(0);
            char companyInitial = productDto.getProductCompany().charAt(0);
            Random random = new Random();
            int randomNum = 100 + random.nextInt(800);
            String batchNo = "" + productInitial + companyInitial + randomNum;
            productDto.setHsn(hsnCode);
            productDto.setBatchNumber(batchNo);
            log.info("mediSalesDto is {}", mediSalesDto);
            productDto.setCreatedDate(LocalDate.now());

            productDto.setDiscountAmount(productDto.getRate() * productDto.getQuantity() * (productDto.getDiscount() / 100));
            productDto.setGstAmount(productDto.getDiscountAmount() * (productDto.getGst() / 100));
            productDto.setTotalAmount(productDto.getRate() * productDto.getQuantity() - productDto.getDiscountAmount() + productDto.getGstAmount());
            productDto.setCreatedBy(mediSalesDto.getRegisteredEmail());


            BeanUtils.copyProperties(productDto, productEntity);
            isAdded = mediSalesRepo.addProduct(productEntity);
            log.info("Add Product service...{}", isAdded);
            return isAdded;
        }

        return isAdded;
    }

    @Override
    public List<ProductDto> validateAndGetAllProducts() {
        List<ProductEntity> entities = mediSalesRepo.addAllProducts();
        List<ProductDto> dtos = new ArrayList<>();
        for (ProductEntity dto : entities) {
            ProductDto productDto = new ProductDto();
            BeanUtils.copyProperties(dto, productDto);
            dtos.add(productDto);
        }
        return dtos;
    }

    @Override
    public MediSalesDto getUserByCustomerName(String contactPerson) {
        MediSalesDto mediSalesDto = new MediSalesDto();
        MediSalesEntity mediSalesEntity = mediSalesRepo.getUserByCustomerName(contactPerson);
        BeanUtils.copyProperties(mediSalesEntity, mediSalesDto);
        return mediSalesDto;
    }

    @Override
    public ProductDto getDistributorDtoByProductName(String productName) {
        ProductDto productDto = new ProductDto();
        ProductEntity productEntity = mediSalesRepo.getDistributorDtoByProductName(productName);
        BeanUtils.copyProperties(productEntity, productDto);
        return productDto;
    }

    @Override
    public List<MediSalesDto> validateAndGetAllCustomer() {
        List<MediSalesEntity> entities = mediSalesRepo.getAllCustomers();
        List<MediSalesDto> dtos = new ArrayList<>();
        for (MediSalesEntity entity : entities) {
            MediSalesDto mediSalesDto = new MediSalesDto();
            BeanUtils.copyProperties(entity, mediSalesDto);
            dtos.add(mediSalesDto);
        }
        return dtos;
    }

    @Override
    public Double getStockByProduct(String productName) {
        return mediSalesRepo.getStocksByProduct(productName);
    }

    @Autowired
    private JavaMailSender javaMailSender;

    @Override
    public boolean sendEmail(String subject, String body, String email) {
        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
            mimeMessageHelper.setFrom(ProfilePhotoPath.FROM_EMAIL.getPath(), FROM_NAME.getPath());
            mimeMessageHelper.addTo(email);
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(body);
        };
        javaMailSender.send(preparator);
        return true;

    }

    @Autowired
    private TemplateEngine templateEngine;
    @Override
    public void pdfGenerate(List<ProductDto> productDtoList,MediSalesDto mediSalesDto, Object finalAmount) {
        Context context = new Context();
        context.setVariable("user",mediSalesDto);
        context.setVariable("invoiceItems",productDtoList);
        context.setVariable("final",finalAmount);
        String htmlData = templateEngine.process("SalesBill",context);
        log.info("Html data : {}",htmlData);
        File file = new File("C:\\template\\"+"SalesBill.pdf");
        Path path = Paths.get(file.getPath());
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(new File(file.getPath()));
            HtmlConverter.convertToPdf(htmlData,fileOutputStream);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String sendOtp(String email) {
        MediSalesEntity entity=mediSalesRepo.getEntityByEmail(email);
        log.info("{}",email);
        if(entity.getRegisteredEmail()!=null){
            Random random=new Random();
            Integer otp=random.nextInt(9999);
            log.info("otp:{}",otp);
            sendEmail("otp Verification","your otp is : "+otp,email);
            entity.setOtp(otp.toString());
            mediSalesRepo.updateProfile(entity);
            return  otp.toString();
        }else
            return "otp not sent";
    }

    @Override
    public String validateOtp(String otp, String registeredEmail) {
        MediSalesEntity entity=mediSalesRepo.getEntityByEmail(registeredEmail);
        log.info("validate otp method:{}"+entity);
        if(entity.getOtp().equals(otp)){
            return "valid otp";
        }
        return "otp not valid";
    }
}