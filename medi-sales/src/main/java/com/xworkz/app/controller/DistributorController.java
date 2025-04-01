package com.xworkz.app.controller;

import com.xworkz.app.dto.MediSalesDto;
import com.xworkz.app.dto.ProductDto;
import com.xworkz.app.service.MediSalesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class DistributorController {
    @Autowired
    MediSalesService mediSalesService;

    @GetMapping("createStock")
    public  String createStock(){
        return "createStock";
    }
    @GetMapping("getAllProducts")
    private String getAllProducts(){
        return "getAllProducts";
    }
    private  List<ProductDto> attributesList=new ArrayList<>();
    @PostMapping("addProduct")
    public String productSave(@Valid ProductDto productDto, BindingResult bindingResult, Model model, HttpServletRequest request ){
        log.info("Product Save Method Started");
        if(bindingResult.hasErrors()){
            log.info("UserDto has validation error");
            bindingResult.getFieldErrors().forEach(fieldError -> {
                if(fieldError instanceof FieldError) {
                    FieldError fieldError1=(FieldError) fieldError;
                    log.info("{} Error Message :: {}",fieldError1.getField(), fieldError1.getDefaultMessage());
                    model.addAttribute(fieldError1.getField()+"Error",fieldError1.getDefaultMessage());
                    if (fieldError.getField().equalsIgnoreCase("Product Company ")) {
                        model.addAttribute("ProductCompanyError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Company Name")) {
                        model.addAttribute("CompanyNameError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("HSN")) {
                        model.addAttribute("HSNError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("MRP")) {
                        model.addAttribute("MRPError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Pack")) {
                        model.addAttribute("PackError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("BatchNumber")) {
                        model.addAttribute("BatchNumberError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("MfgDate")) {
                        model.addAttribute("MfgDateError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("ExpDate")) {
                        model.addAttribute("ExpDateError", fieldError.getDefaultMessage());
                    }
                    if (fieldError.getField().equalsIgnoreCase("Quantity")) {
                        model.addAttribute("QuantityError", fieldError.getDefaultMessage());
                    }

                    if (fieldError.getField().equalsIgnoreCase("Discount")) {
                        model.addAttribute("DiscountError", fieldError.getDefaultMessage());
                    }

                    if (fieldError.getField().equalsIgnoreCase("Rate")) {
                        model.addAttribute("RateError", fieldError.getDefaultMessage());
                    }
                }
            });
            return "createStock";
        }
       MediSalesDto mediSalesDto= (MediSalesDto) request.getSession().getAttribute("sessionDto");
        if(mediSalesService.validateAndAddProduct( productDto,mediSalesDto)){
            model.addAttribute("productName",mediSalesDto.getCompanyName());
            log.info("Product Data saved successfully");
            return "dashBoard";
        }else {
            model.addAttribute("Product Data","Product Already Exists");
        }
        return "createStock";
    }
    @GetMapping("viewProducts")
    public String getAllProduct(Model model){
        List<ProductDto> mediSalesDtos=mediSalesService.validateAndGetAllProducts();
        model.addAttribute("listOfAllProducts",mediSalesDtos);
        return "getAllProducts";
    }
    @GetMapping("generateBill")
    public String getGenerateBillPage(Model model){
        return "generateBill";
    }

    @PostMapping("getBill")
    public String generateBill(@RequestParam("productName") String productName,
                               @RequestParam("personContact") String personContact,
                               @RequestParam("quantity") double quantity,
                               @RequestParam("gst") double gst,
                               @RequestParam("discount") double discount, Model model, HttpSession session) {
        DecimalFormat decimalFormat=new DecimalFormat("#.##");
        double finalTotal=0.0;
        MediSalesDto mediSalesDto=mediSalesService.getUserByCustomerName(personContact);
        model.addAttribute("contact_person", mediSalesDto.getPersonContact());
        model.addAttribute("address", mediSalesDto.getAddress1());
        for (ProductDto existingProduct : attributesList) {
            if (existingProduct.getProductName().equals(productName)) {
                double discountedPrice = (existingProduct.getRate() * quantity * discount) / 100;
                double gstAmount = (discountedPrice * gst) / 100;
                double totalAmount = existingProduct.getRate() * quantity - discountedPrice + gstAmount;

                existingProduct.setGst(existingProduct.getGst() + gst);
                existingProduct.setDiscount(existingProduct.getDiscount() + discount);
                existingProduct.setQuantity(existingProduct.getQuantity() + quantity);
                existingProduct.setTotalAmount(Double.parseDouble(decimalFormat.format(totalAmount + existingProduct.getTotalAmount())));

                model.addAttribute("dtoList", attributesList);

                for (ProductDto distributorDto : attributesList) {
                    finalTotal += distributorDto.getTotalAmount();
                }

                model.addAttribute("total", decimalFormat.format(finalTotal));
                return "generateBill";
            }
        }
        ProductDto product= mediSalesService.getDistributorDtoByProductName(productName);
        double discountedPrice = (product.getRate() * quantity * discount) / 100;
        double gstAmount = (discountedPrice * gst) / 100;
        double totalAmount = product.getRate() * quantity - discountedPrice + gstAmount;

        product.setTotalAmount(Double.parseDouble(decimalFormat.format(totalAmount)));

        ProductDto dto = new ProductDto();
        BeanUtils.copyProperties(product, dto);
        dto.setGst(gst);
        dto.setDiscount(discount);
        dto.setQuantity(quantity);
        attributesList.add(dto);
        model.addAttribute("dtoList", attributesList);
        session.setAttribute("sessionProductDto", attributesList);

        for (ProductDto distributorDto : attributesList) {
            finalTotal += distributorDto.getTotalAmount();
        }

        model.addAttribute("total", decimalFormat.format(finalTotal));
        session.setAttribute("finalAmt", decimalFormat.format(finalTotal));

        return "generateBill";
    }
}
