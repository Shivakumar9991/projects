package com.xworkz.app.controller;

import com.xworkz.app.dto.MediSalesDto;
import com.xworkz.app.dto.ProductDto;
import com.xworkz.app.service.MediSalesService;
import jdk.internal.dynalink.linker.LinkerServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/")
public class PdfController {
    @Autowired
    private MediSalesService mediSalesService;

    @GetMapping("generatePdf")
    public  String getPdf(HttpServletRequest servletRequest){
        List<ProductDto> productDtoList= (List<ProductDto>) servletRequest.getSession().getAttribute("sessionProductDto");
        Object finalAmount= servletRequest.getSession().getAttribute("finalAmt");
        MediSalesDto mediSalesDto= (MediSalesDto) servletRequest.getSession().getAttribute("sessionDto");

        mediSalesService.pdfGenerate(productDtoList,mediSalesDto,finalAmount);
        return "Pdf generated";
    }

}
