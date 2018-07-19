/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Qu
 */
@Entity
@Table(name = "product")
public class ProductEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "productname", nullable = false, length = 255)
    private String productname;
    
    @Column(name = "price", nullable = false, length = 255)
    private double price;
    
    @Column(name = "discount", nullable = false, length = 255)
    private int discount;
    
    @Column(name = "brand", nullable = false, length = 255)
    private String brand;
    
    @Column(name = "color", nullable = false, length = 255)
    private String color;
    
    @Column(name = "image", nullable = false, length = 255)
    private String image;
    
    @Column(name = "description", nullable = false, length = 255)
    private String description;
    
    @Column(name = "gender", nullable = false, length = 255)
    private String gender;
    
    @Column(name = "featured", nullable = false, length = 255)
    private int featured;
    
    @Column(name = "size", nullable = false, length = 255)
    private String size;

    public int getFeatured() {
        return featured;
    }

    public void setFeatured(int featured) {
        this.featured = featured;
    }
    
    @OneToMany(mappedBy = "id", fetch = FetchType.EAGER)
    private List<OrderDetailEntity> orderDetailEntitys;
    @ManyToOne
    @JoinColumn(name = "categoryId")
    private CategoryEntity categoryId;

    public ProductEntity() {
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

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<OrderDetailEntity> getOrderDetailEntitys() {
        return orderDetailEntitys;
    }

    public void setOrderDetailEntitys(List<OrderDetailEntity> orderDetailEntitys) {
        this.orderDetailEntitys = orderDetailEntitys;
    }

    public CategoryEntity getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(CategoryEntity categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
    
}
