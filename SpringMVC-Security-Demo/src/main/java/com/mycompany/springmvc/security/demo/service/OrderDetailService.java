/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.service;

import com.mycompany.springmvc.security.demo.entity.OrderDetailEntity;
import com.mycompany.springmvc.security.demo.entity.OrrrderEntity;
import com.mycompany.springmvc.security.demo.repository.OrderDetailRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Qu
 */
@Service
public class OrderDetailService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    
    public OrderDetailEntity addNew(OrderDetailEntity orderDetailEntity) {
        OrderDetailEntity ode = orderDetailRepository.save(orderDetailEntity);
        return ode;
    }
    public double sum() {
        List<OrderDetailEntity> lstO = (List<OrderDetailEntity>) orderDetailRepository.findAll();
        double sum = 0;
        for (OrderDetailEntity orderDetailEntity : lstO) {
            sum = sum + orderDetailEntity.getTotal();
        } return sum;
    }
    public List<OrderDetailEntity> find(Long text) {
        List<OrderDetailEntity> lstD = orderDetailRepository.findByOrderId(text);
        return lstD;
    }
}
