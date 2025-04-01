package com.xworkz.app.repo;

import com.xworkz.app.dto.MediSalesDto;
import com.xworkz.app.dto.ProductDto;
import com.xworkz.app.entity.MediSalesEntity;
import com.xworkz.app.entity.ProductEntity;

import java.util.List;

public interface MediSalesRepo {

    boolean save(MediSalesEntity entity);
    MediSalesEntity findEntityByEmailAndPassword(String email , String password);
    MediSalesEntity updateProfile(MediSalesEntity mediSalesEntity);
    MediSalesEntity getEntityByEmail(String email);
    MediSalesEntity getEntityByNumber(Long contact);
    boolean updatePasswordByEmail(String email, String password, String confirmPassword);

    boolean checkEMail(String email);

    boolean addProduct(ProductEntity productEntity);

    List<ProductEntity> addAllProducts();
    List<MediSalesEntity> getAllCustomers();
    Double getStocksByProduct(String productName);
    ProductEntity getDistributorDtoByProductName(String productName);
    MediSalesEntity getUserByCustomerName(String contactPerson);
}
