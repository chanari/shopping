/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.springmvc.security.demo.controller;

import com.mycompany.springmvc.security.demo.entity.OrderDetailEntity;
import com.mycompany.springmvc.security.demo.entity.OrrrderEntity;
import com.mycompany.springmvc.security.demo.entity.ProductEntity;
import com.mycompany.springmvc.security.demo.entity.UserEntity;
import com.mycompany.springmvc.security.demo.service.OrderDetailService;
import com.mycompany.springmvc.security.demo.service.OrrrderService;
import com.mycompany.springmvc.security.demo.service.ProductService;
import com.mycompany.springmvc.security.demo.service.UserService;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author AnhLe
 */
@Controller
public class AdminController {

    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private OrrrderService orrrderService;
    
    @RequestMapping("/admin-page")
    public String showUserAdmin(Model model, HttpSession session) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity userEntity = (UserEntity) authentication.getPrincipal();
        model.addAttribute("first", userEntity.getFirstname());
        model.addAttribute("countu", userService.count());
        model.addAttribute("countp", productService.count());
        model.addAttribute("sum", orderDetailService.sum());
        model.addAttribute("top", userService.top3());
        model.addAttribute("top3", orrrderService.top3());
        List<OrrrderEntity> lst = orrrderService.top3();
        double j1=0,j2=0,j3=0;
        for (int i = 0; i < 2; i++) {
            List<OrderDetailEntity> lstD = orderDetailService.find(lst.get(0).getId());
            for (OrderDetailEntity orderDetailEntity : lstD) {
                j1 = j1 + orderDetailEntity.getTotal();
            } session.setAttribute("t1", j1);
        }
        for (int i = 0; i < 2; i++) {
            List<OrderDetailEntity> lstD = orderDetailService.find(lst.get(1).getId());
            for (OrderDetailEntity orderDetailEntity : lstD) {
                j2 = j2 + orderDetailEntity.getTotal();
            } session.setAttribute("t2", j2);
        }
        for (int i = 0; i < 2; i++) {
            List<OrderDetailEntity> lstD = orderDetailService.find(lst.get(2).getId());
            for (OrderDetailEntity orderDetailEntity : lstD) {
                j3 = j3 + orderDetailEntity.getTotal();
            } session.setAttribute("t3", j3);
        }
        List<Double> ll = new ArrayList<>();
        ll.add(j1);
        ll.add(j2);
        ll.add(j3);
        model.addAttribute("tt", ll);
        session.setAttribute("user", userEntity.getFirstname());
        return "admin2";
    }
    @RequestMapping("/manage-users")
    public String manageUser(Model model) {
        List<UserEntity> lstU = userService.getAll();
        List<UserEntity> lstUU = new ArrayList<>();
        for (UserEntity userEntity : lstU) {
            if (userEntity.getRoleid() < 2) {
                lstUU.add(userEntity);
            }
        }
        model.addAttribute("lstU", lstUU);
        return "manage-user";
    }
    @RequestMapping("/manage-products")
    public String manageProduct(Model model) {
        model.addAttribute("lstP", productService.getAllProducts());
        return "manage-product";
    }
    @RequestMapping("/delete/{id}")
    public String delP(Model model, @PathVariable(value = "id") Long id) {
        productService.deleteProduct(id);
        return "redirect:/tablep";
    }
    @RequestMapping("/deactive/{id}")
    public String deactiveUser(Model model, @PathVariable(value = "id") Long id) {
        UserEntity u = userService.findById(id);
        u.setEnabled(false);
        userService.addNew(u);
        return "redirect:/tableu";
    }
    @RequestMapping("/active/{id}")
    public String activeUser(Model model, @PathVariable(value = "id") Long id) {
        UserEntity u = userService.findById(id);
        u.setEnabled(true);
        userService.addNew(u);
        return "redirect:/tableu";
    }
    @RequestMapping("/edit-user/{id}")
    public String editUser(Model model, @PathVariable(value = "id") Long id) {
        UserEntity userEntity = userService.findById(id);
        model.addAttribute("userEntity", userEntity);
        return "edit-u";
    }
    @RequestMapping("/editu")
    public String saveUser(Model model, @ModelAttribute(value = "userEntity") UserEntity user) {
        userService.save(user);
        model.addAttribute("notice", "Successful !");
        model.addAttribute("lstU", userService.getAll());
        return "tableu";
    }
    @RequestMapping("/edit-pro/{id}")
    public String editPro(Model model, @PathVariable(value = "id") Long id) {
        ProductEntity productEntity = productService.getProduct(id);
        model.addAttribute("productEntity", productEntity);
        return "edit-p";
    }
    @RequestMapping("/editp")
    public String savePro(Model model, @ModelAttribute(value = "productEntity") ProductEntity productEntity, HttpServletRequest request, @RequestParam("file") MultipartFile file, HttpSession session) {
        String name = "resources/images/";
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");

                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src/main/webapp/resources/images/";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // sau khi upload file xong lấy file name ra để insert vào database
                name ="resources/images/"+file.getOriginalFilename();
                productEntity.setImage(name);
                productService.save(productEntity);
                return "redirect:/tablep";

            } catch (Exception e) {
                return "You failed to upload " + " => " + e.getMessage();
            }
        } else {
            productService.save(productEntity);
            return "redirect:/tablep";
        }
        
    }
    @RequestMapping(value = {"/searchp"})
    public String searchPro (Model model, @ModelAttribute(value = "search") String search, HttpSession session) {
        model.addAttribute("lstP", productService.search(search));
        model.addAttribute("first", session.getAttribute("user"));
        return "tablep";
    }
    @RequestMapping(value = {"/searchu"})
    public String searchUser (Model model, @ModelAttribute(value = "searchu") String search, HttpSession session) {
        model.addAttribute("lstU", userService.search(search));
        model.addAttribute("first", session.getAttribute("user"));
        return "tableu";
    }
    @RequestMapping(value = "/add-pro")
    public String addProduct(Model model) {
        model.addAttribute("productEntity", new ProductEntity());
        model.addAttribute("add", "add");
        return "edit-p";
    }
    @RequestMapping(value = "/tablep")
    public String newTablep(Model model, HttpSession session) {
        model.addAttribute("lstP", productService.getAllProducts());
        model.addAttribute("first", session.getAttribute("user"));
        return "tablep";
    }
    @RequestMapping(value = "/tableu")
    public String newTableu(Model model, HttpSession session) {
        List<UserEntity> lstU = userService.getAll();
        model.addAttribute("lstU", lstU);
        model.addAttribute("first", session.getAttribute("user"));
        return "tableu";
    }
    @RequestMapping(value = "/tableo")
    public String orderTable(Model model, HttpSession session) {
        List<OrrrderEntity> lst = (List<OrrrderEntity>) session.getAttribute("lstUU");
        List<OrrrderEntity> lsto = orrrderService.all();
        List<Double> lsd = new ArrayList<>();
        for (OrrrderEntity orrrderEntity : lsto) {
            double i = 0;
            List<OrderDetailEntity> lstD = orderDetailService.find(orrrderEntity.getId());
            for (OrderDetailEntity orderDetailEntity : lstD) {
                i = i + orderDetailEntity.getTotal();
            } 
            lsd.add(i);
        }
        model.addAttribute("first", session.getAttribute("user"));
        if (lst != null && lst.size() > 0) {
            model.addAttribute("lstU", lst);
            session.removeAttribute("lstUU");
        } else {
            model.addAttribute("lstU", orrrderService.all());
        }
        
        model.addAttribute("lst", lsd);
        return "tableo";
    }
    @RequestMapping(value = "/find-order/{id}")
    public String findOrder(Model model, HttpSession session, @PathVariable(value = "id") Long id) {
        session.setAttribute("lstUU", orrrderService.find(id));
        model.addAttribute("first", session.getAttribute("user"));
        return "redirect:/tableo";
    }
    @RequestMapping(value = {"/searcho"})
    public String searchOrder (Model model, HttpServletRequest request, HttpSession session) {
        //List<OrrrderEntity> lst = (List<OrrrderEntity>) session.getAttribute("lstUU");
        String search = request.getParameter("searcho");
        List<OrrrderEntity> lsto = orrrderService.findOrder(search);
//        List<Double> lsd = new ArrayList<>();
//        for (OrrrderEntity orrrderEntity : lsto) {
//            double i = 0;
//            List<OrderDetailEntity> lstD = orderDetailService.find(orrrderEntity.getId());
//            for (OrderDetailEntity orderDetailEntity : lstD) {
//                i = i + orderDetailEntity.getTotal();
//            } 
//            lsd.add(i);
//        }
//        if (lst != null && lst.size() > 0) {
//            model.addAttribute("lstU", lsto);
//            session.removeAttribute("lstUU");
//        } else {
//            model.addAttribute("lstU", orrrderService.findOrder(search));
//        }
//        
        model.addAttribute("lstU", lsto);
        model.addAttribute("first", session.getAttribute("user"));
        return "tableu";
    }
}
