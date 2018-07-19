/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.repository;

import com.mycompany.springmvc.security.demo.entity.OrderDetailEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Qu
 */
@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Long> {
    @Query("Select p from OrderDetailEntity p where p.ordersEntity.id = ?1 ")
    public List<OrderDetailEntity> findByOrderId(Long id);
}
