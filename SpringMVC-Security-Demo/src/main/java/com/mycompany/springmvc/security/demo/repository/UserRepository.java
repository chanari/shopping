/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.repository;

import com.mycompany.springmvc.security.demo.entity.UserEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author AnhLe
 */
@Repository
public interface UserRepository extends CrudRepository<UserEntity, Long> {

    public UserEntity findByEmailAndPassword(String email, String password);
    public UserEntity findByEmailContaining(String email);
    @Query("Select p from UserEntity p where p.email like ?1 ")
    public UserEntity findByEmail(String email);
    @Query("Select p from UserEntity p where p.email like ?1 ")
    public List<UserEntity> findByProductname(String text);
    public List<UserEntity> findTop3ByOrderByIdDesc();
}
