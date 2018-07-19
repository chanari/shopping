/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.repository;

import com.mycompany.springmvc.security.demo.entity.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Qu
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Long> {
    public List<ProductEntity> findByBrand(String brand);
    @Query("Select p from ProductEntity p where p.productname like ?1 ")
    public List<ProductEntity> findByProductname(String text);
    @Query("Select p from ProductEntity p where p.categoryId.id = ?1 ")
    public List<ProductEntity> findByCategoryId(Long id);
    @Query("Select p from ProductEntity p where p.price between ?1 and ?2 ")
    public List<ProductEntity> findByPrice(double p1, double p2);
    @Query("Select p from ProductEntity p where p.gender like ?1 ")
    public List<ProductEntity> getGender(String text);
}
