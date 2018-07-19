/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.service;

import com.mycompany.springmvc.security.demo.entity.ProductEntity;
import com.mycompany.springmvc.security.demo.repository.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Qu
 */
@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    
    public List<ProductEntity> getAllProducts() {
        List<ProductEntity> lstPro = (List<ProductEntity>) productRepository.findAll();
        return lstPro; 
    }
    
    public ProductEntity getProduct(Long id) {
        return productRepository.findOne(id);
    }
    
    public List<ProductEntity> getBrands(String brand) {
        List<ProductEntity> lstB = (List<ProductEntity>) productRepository.findByBrand(brand);
        return lstB; 
    }
    
    public List<ProductEntity> search(String text) {
        List<ProductEntity> lstB = (List<ProductEntity>) productRepository.findByProductname("%" + text + "%");
        return lstB;
    }
    public List<ProductEntity> getTags(Long brand) {
        List<ProductEntity> lstB = (List<ProductEntity>) productRepository.findByCategoryId(brand);
        return lstB; 
    }
    public List<ProductEntity> getPrice(double p1, double p2) {
        List<ProductEntity> lstB = (List<ProductEntity>) productRepository.findByPrice(p1, p2);
        return lstB;
    }
    public void deleteProduct(Long id) {
        productRepository.delete(id);
    }
    public ProductEntity save(ProductEntity id) {
        return productRepository.save(id);
    }
    public Long count() {
        return productRepository.count();
    }
    public List<ProductEntity> getGender(String brand) {
        List<ProductEntity> lstB = (List<ProductEntity>) productRepository.getGender(brand);
        return lstB; 
    }
}
