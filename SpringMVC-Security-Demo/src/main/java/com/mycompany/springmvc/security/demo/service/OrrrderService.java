/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.service;

import com.mycompany.springmvc.security.demo.entity.OrrrderEntity;
import com.mycompany.springmvc.security.demo.repository.OrrrderRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Qu
 */
@Service
public class OrrrderService {
    @Autowired
    private OrrrderRepository orrrderRepository;
    
    public OrrrderEntity add(OrrrderEntity orrrderEntity) {
        OrrrderEntity oe = orrrderRepository.save(orrrderEntity);
        return oe;
    }
    public List<OrrrderEntity> top3(){
        List<OrrrderEntity> lstO = orrrderRepository.findTop3ByOrderByIdDesc();
        return lstO;
    }
    public List<OrrrderEntity> all(){
        List<OrrrderEntity> lstO = (List<OrrrderEntity>) orrrderRepository.findAll();
        return lstO;
    }
    public List<OrrrderEntity> find(Long id){
        List<OrrrderEntity> lstO = (List<OrrrderEntity>) orrrderRepository.find(id);
        return lstO;
    }
    public List<OrrrderEntity> findOrder(String id){
        List<OrrrderEntity> lstO = (List<OrrrderEntity>) orrrderRepository.findOrder(id);
        return lstO;
    }
}
