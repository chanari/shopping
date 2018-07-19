/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Qu
 */
@Entity
@Table(name = "order_detail")
public class OrderDetailEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "price", nullable = false, length = 255)
    private double price;
    
    @Column(name = "quantity", nullable = false, length = 255)
    private int quantity = 1;
    
    @Column(name = "total", nullable = false, length = 255)
    private double total;
    
    @Column(name = "size", nullable = false, length = 255)
    private String size;
    
    @ManyToOne
    @JoinColumn(name = "proId")
    private ProductEntity productEntity;
    
    @ManyToOne
    @JoinColumn(name = "orderId")
    private OrrrderEntity ordersEntity;

    public OrderDetailEntity() {
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }

    public OrrrderEntity getOrdersEntity() {
        return ordersEntity;
    }

    public void setOrdersEntity(OrrrderEntity ordersEntity) {
        this.ordersEntity = ordersEntity;
    }

    
}
