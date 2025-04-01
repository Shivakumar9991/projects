package com.xworkz.app.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
@Data
@Entity
@Table(name = "distributor_details")
@NamedQuery(name = "addAllProducts",query = " from ProductEntity")

@NamedQuery(name = "getStocksByProduct",query = "SELECT d.quantity FROM ProductEntity d WHERE d.productName = :product_Name")

public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "product_company")
    private String productCompany;
    @Column(name = "product_name")
    private String productName;
    @Column(name = "hsn")
    private String hsn;
    @Column(name = "mrp")
    private double mrp;
    @Column(name = "pack")
    private String pack;
    @Column(name = "batch_no")
    private String batchNumber;
    @Column(name = "mfg_date")
    private String mfgDate;
    @Column(name = "exp_date")
    private  String expDate;
    @Column(name = "quantity")
    private Double quantity;
    @Column(name = "discount")
    private Double discount;
    @Column(name = "gst")
    private Double gst;
    @Column(name = "gst_amount")
    private Double gstAmount;
    @Column(name = "discount_amount")
    private Double discountAmount;
    @Column(name = "total_amount")
    private Double totalAmount;
    @Column(name = "rate")
    private Double rate;
    @Column(name = "created_by")
    private String createdBy;
    @Column(name = "created_date")
    private LocalDate createdDate;
    @Column(name = "updated_by")
    private String updatedBy;
    @Column(name = "updated_date")
    private LocalDate updatedDate;
}
