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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author AnhLe
 */
@Entity
@Table(name = "user")
public class UserEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "email", nullable = false, length = 255)
    private String email;
    
    @Column(name = "firstname", nullable = false, length = 255)
    private String firstname;
    
    @Column(name = "lastname", nullable = false, length = 255)
    private String lastname;

    @Column(name = "address", nullable = false, length = 255)
    private String address;

    @Column(name = "password", nullable = false, length = 255)
    private String password;
    
    @Column(name = "phone", nullable = false, length = 255)
    private String phone;

    private boolean enabled;

    @Column(name = "roleid", nullable = false, length = 255)
    private int roleid;
    
    @OneToMany(mappedBy = "id", fetch = FetchType.EAGER)
    private List<OrrrderEntity> ordersEntitys;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public List<OrrrderEntity> getOrdersEntitys() {
        return ordersEntitys;
    }

    public void setOrdersEntitys(List<OrrrderEntity> ordersEntitys) {
        this.ordersEntitys = ordersEntitys;
    }

    

}
