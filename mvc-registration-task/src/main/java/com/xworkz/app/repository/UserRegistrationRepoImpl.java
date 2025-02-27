package com.xworkz.app.repository;


import com.xworkz.app.entity.UserRegistrationEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;


@Slf4j
@Repository
public class UserRegistrationRepoImpl implements UserRegistrationRepo {
    @Autowired
    EntityManagerFactory entityManagerFactory;
    @Override
    public boolean save(UserRegistrationEntity userRegistration) {
        System.out.println("save method started");
        EntityManager entityManager =entityManagerFactory.createEntityManager();
        Query query=entityManager.createNamedQuery("save");
        query.setParameter("emailCheck",userRegistration.getEmail());
        long count=(Long) query.getSingleResult();
        if(count>0){
            System.out.println("Email Is Already Registered");
            return false;
        }
        entityManager.getTransaction().begin();
        entityManager.persist(userRegistration);
        entityManager.getTransaction().commit();
        entityManager.close();
        System.out.println("save method ended");
        return true;
    }

    @Override
    public UserRegistrationEntity getEntityByEmail(String email) {
        System.out.println("get entity by email started");
        try {
            if(email!=null) {
                EntityManager entityManager = entityManagerFactory.createEntityManager();
                Query query = entityManager.createNamedQuery("getEntityByEmail",UserRegistrationEntity.class);
                query.setParameter("email", email);
                return (UserRegistrationEntity) query.getSingleResult();
            }
        } catch (Exception e) {
          log.info("{}",e.getMessage());

        }
        return null;
    }

    @Override
    public boolean updatePasswordByEmail(String email,String password,String confirmPassword) {
        EntityManager entityManager =entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Query query = entityManager. createNamedQuery("updatePasswordByEmail");
        query.setParameter("email",email);
        query.setParameter("password",password);
        query.setParameter("confirmPassword",confirmPassword);
        query.executeUpdate();
        entityManager.getTransaction().commit();
        return true;
    }

    @Override
    public UserRegistrationEntity updateProfile(UserRegistrationEntity userRegistration) {
        log.info("{}",userRegistration);
        EntityManager entityManager =entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
       UserRegistrationEntity entity= entityManager.merge(userRegistration);
        entityManager.getTransaction().commit();
        return entity ;
    }

    @Override
    public boolean checkEmail(String email) {
       EntityManager entityManager= entityManagerFactory.createEntityManager();
       Query query=entityManager.createNamedQuery("save");
       query.setParameter("emailCheck",email);
      Long count= (Long) query.getSingleResult();
      return count>0;
    }

     @Override
    public boolean checkContact(Long contact) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        Query query=entityManager.createNamedQuery("checkNumber");
        query.setParameter("checkContact",contact);
        Long count= (Long) query.getSingleResult();
        return count>0;
    }

}
