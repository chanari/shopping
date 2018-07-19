/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.service;

import com.mycompany.springmvc.security.demo.entity.UserEntity;
import com.mycompany.springmvc.security.demo.repository.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhLe
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public UserEntity findByEmailAndPassword(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password);
    }
    public UserEntity findByEmailContaining(String email) {
        return userRepository.findByEmailContaining(email);
    }
    
    public UserEntity findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    public UserEntity addNew(UserEntity userEntity){
        UserEntity u = userRepository.save(userEntity);
        return u;
    }
    public List<UserEntity> getAll() {
        List<UserEntity> lstS = (List<UserEntity>) userRepository.findAll();
        return lstS;
    }
    public UserEntity findById(Long id) {
        UserEntity u = userRepository.findOne(id);
        return u;
    }
    public UserEntity save(UserEntity id) {
        UserEntity u = userRepository.save(id);
        return u;
    }
    public List<UserEntity> search(String mail) {
        List<UserEntity> lstS = (List<UserEntity>) userRepository.findByProductname("%"+mail+"%");
        return lstS;
    }
    public Long count(){
        return userRepository.count();
    }
    public List<UserEntity> top3(){
        List<UserEntity> lstS = userRepository.findTop3ByOrderByIdDesc();
        return lstS;
    }
}
