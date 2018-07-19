/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.security;

import com.mycompany.springmvc.security.demo.entity.UserEntity;
import com.mycompany.springmvc.security.demo.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

/**
 *
 * @author AnhLe
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserService userService;

    @Override
    public Authentication authenticate(Authentication a) throws AuthenticationException {
        String mail = a.getName();
        String password = a.getCredentials().toString();
        UserEntity userEntity = userService.findByEmailAndPassword(mail, password);
        if (userEntity != null && userEntity.isEnabled()) {
            List<GrantedAuthority> authorities = new ArrayList<>();
            String roleName = "ROLE_USER";
            if (userEntity.getRoleid() > 1) {
                roleName = "ROLE_ADMIN";
            }
            authorities.add(new SimpleGrantedAuthority(roleName));
            
            return new UsernamePasswordAuthenticationToken(
                    userEntity, mail, authorities);
        } else {
            return null;
        }
    }
    

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

}
