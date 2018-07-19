/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.repository;

import com.mycompany.springmvc.security.demo.entity.OrrrderEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Qu
 */
@Repository
public interface OrrrderRepository extends CrudRepository<OrrrderEntity, Long> {
    public List<OrrrderEntity> findTop3ByOrderByIdDesc();
    @Query("Select p from OrrrderEntity p where p.userEntity.id = ?1 ")
    public List<OrrrderEntity> find(Long id);
    @Query("Select p from OrrrderEntity p where p.userEntity.email = ?1 ")
    public List<OrrrderEntity> findOrder(String id);
}
