package com.xworkz.app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductDto {

    private int id;
    @NotNull(message = "product company should not be null")
    private String productCompany;
    @NotNull(message = "product company should not be null")
    private String productName;
    @NotNull(message = "hsn should not be null")
    private String hsn;
    @NotNull(message = "mrp should not be null")
    private Double mrp;
    private String pack;
    @NotNull(message = "batch number should not be null")
    private String batchNumber;
    @NotNull(message = "mfg date should not be null")
    private String mfgDate;
    @NotNull(message = "exp date should not be null")
    private  String expDate;
    @NotNull(message = "quantity should not be null")
    private Double quantity;
    private Double discount;
    @NotNull(message = "rate should not be null")
    private Double gst;
    private Double gstAmount;
    private Double discountAmount;
    private Double totalAmount;
    private Double rate;
    private String createdBy;
    private LocalDate createdDate;
    private String updatedBy;
    private LocalDate updatedDate;


}
