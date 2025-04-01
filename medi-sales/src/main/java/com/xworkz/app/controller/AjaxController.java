package com.xworkz.app.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xworkz.app.dto.MediSalesDto;
import com.xworkz.app.dto.ProductDto;
import com.xworkz.app.entity.ProductEntity;
import com.xworkz.app.service.MediSalesService;
import jdk.internal.dynalink.linker.LinkerServices;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/api")
public class AjaxController {

    @Autowired
   private MediSalesService mediSalesService;

    @GetMapping("checkEmail/{registeredEmail}")
    public String checkEmail(@PathVariable String registeredEmail){
     log.info("Check Email Exists:{}");
     return  mediSalesService.checkEmail(registeredEmail);
    }

    @GetMapping("checkRegisteredMobile/{registeredMobile}")
    public  String checkRegisteredMobile(@PathVariable Long registeredMobile){
        log.info("Check Registered Mobile Exists :{}");
        return mediSalesService.checkRegisteredMobile(registeredMobile);
    }
    @GetMapping("sendOtp/{email}")
    public String sendOtp(@PathVariable String email , Model model){
        return mediSalesService.sendOtp(email);
    }
    @GetMapping("getProducts")
    public List<String> getProducts(Model model){
        List<ProductDto> distributors=mediSalesService.validateAndGetAllProducts();
        return distributors.stream().map(ProductDto::getProductName).collect(Collectors.toList());
    }
    @GetMapping("getCustomer")
    public List<String> getCustomerName(){
        List<MediSalesDto> mediSalesDtos=mediSalesService.validateAndGetAllCustomer();
        return mediSalesDtos.stream().map(MediSalesDto::getPersonContact).collect(Collectors.toList());

    }
    @GetMapping("getStockByProduct")
    public  Double getStocks(@RequestParam  String productName){
        return mediSalesService.getStockByProduct(productName);
    }

}
