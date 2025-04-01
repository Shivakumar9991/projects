package com.xworkz.app.repo;

import com.xworkz.app.dto.ProductDto;
import com.xworkz.app.entity.MediSalesEntity;
import com.xworkz.app.entity.ProductEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

@Slf4j
@Repository
public class MediSalesRepoImpl implements MediSalesRepo{

    @Autowired
    EntityManagerFactory entityManagerFactory;
    @Override
    public boolean save(MediSalesEntity mediSalesEntity) {
       EntityManager entityManager =entityManagerFactory.createEntityManager();
       entityManager.getTransaction().begin();
       entityManager.persist(mediSalesEntity);
       entityManager.getTransaction().commit();
        return true ;
    }

    @Override
    public MediSalesEntity findEntityByEmailAndPassword(String email, String password) {
        System.out.println("Login repository started");
        MediSalesEntity mediSalesEntity = null;
        try {
            if (email!=null) {
                EntityManager entityManager = entityManagerFactory.createEntityManager();
                Query query = entityManager.createNamedQuery("findEntityByEmailAndPassword");
                query.setParameter("email", email);
                query.setParameter("password", password);
                mediSalesEntity = (MediSalesEntity) query.getSingleResult();
                System.out.println(mediSalesEntity);
                System.out.println("Login repository ended1");
                return mediSalesEntity;
            }
        }catch (Exception e){
            log.info("Error During GetEntityByEMail And Password :{}",e.getMessage());
        }
        System.out.println("Login repository ended2");
       return new MediSalesEntity();
    }

    @Override
    public MediSalesEntity updateProfile(MediSalesEntity mediSalesEntity) {
      log.info("{}",mediSalesEntity);
       EntityManager entityManager= entityManagerFactory.createEntityManager();
       entityManager.getTransaction().begin();
       MediSalesEntity entity=entityManager.merge(mediSalesEntity);
       entityManager.getTransaction().commit();
       return  entity;
    }
    @Override
    public MediSalesEntity getEntityByEmail(String email) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        Query query=entityManager.createNamedQuery("getEntityByEmail");
        query.setParameter("email",email);
        return (MediSalesEntity) query.getSingleResult();

    }

    @Override
    public MediSalesEntity getEntityByNumber(Long contact) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        Query query=entityManager.createNamedQuery("getEntityByNumber");
        query.setParameter("mobile",contact);
        return (MediSalesEntity) query.getSingleResult();

    }

    @Override
    public boolean updatePasswordByEmail(String email, String password, String confirmPassword) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Query query=entityManager.createNamedQuery("updatePasswordByEmail");
        query.setParameter("email",email);
        query.setParameter("password",password);
        query.setParameter("confirmPassword",confirmPassword);
        query.executeUpdate();
        entityManager.getTransaction().commit();
        return  true;
    }

    @Override
    public boolean checkEMail(String email) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        Query query=entityManager.createNamedQuery("save");
        query.setParameter("checkRegisteredEmail",email);
        Long count= (Long) query.getSingleResult();
        return count>0;
    }
    @Override
    public boolean addProduct(ProductEntity productEntity) {
       EntityManager entityManager= entityManagerFactory.createEntityManager();
       entityManager.getTransaction().begin();
       entityManager.persist(productEntity);
       entityManager.getTransaction().commit();
       log.info("add product :{}",entityManager);
       return true;
    }

    @Override
    public List<ProductEntity> addAllProducts() {
       return entityManagerFactory.createEntityManager().
               createNamedQuery("addAllProducts").getResultList();
    }

    @Override
    public List<MediSalesEntity > getAllCustomers() {
        return entityManagerFactory.createEntityManager().createNamedQuery("getAllCustomers").getResultList();
    }

    @Override
    public Double getStocksByProduct(String productName) {
        return (Double) entityManagerFactory.createEntityManager().createNamedQuery("getStocksByProduct").
                setParameter("product_Name",productName).getSingleResult();
    }

    public MediSalesEntity getUserByCustomerName(String contactPerson) {

        return (MediSalesEntity) entityManagerFactory.createEntityManager().
                createQuery("select u FROM MediSalesEntity u WHERE u.personContact = :contact_Person").
                setParameter("contact_Person",contactPerson).getSingleResult();

    }

    public ProductEntity getDistributorDtoByProductName(String productName) {

        return (ProductEntity) entityManagerFactory.createEntityManager().
                createQuery("select d from ProductEntity d where d.productName = : product_name").
                setParameter("product_name",productName).getSingleResult();


    }
}
