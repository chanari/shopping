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
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Objects;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author AnhLe
 */
@Controller
public class UserController {
    
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private OrrrderService orrrderService;
    @Autowired
    private OrderDetailService orderDetailService;
    
    @RequestMapping(value = {"/", "/home"})
    public String homePage(Model model) {
        model.addAttribute("lstP", productService.getAllProducts());
        List<ProductEntity> lstF = new ArrayList<>();
        for (ProductEntity allProduct : productService.getAllProducts()) {
            if (allProduct.getFeatured() >0) {
                lstF.add(allProduct);
            }
        }
        model.addAttribute("lstF", lstF);
        return "home2";
    }
    @RequestMapping(value = "/loginError")
    public String error(Model model) {
        model.addAttribute("mess", "Wrong Email or Password !!!");
        return "redirect:/login";
    }
    @RequestMapping(value = {"register"})
    public String registerPage(Model model) {
        model.addAttribute("lstP", productService.getAllProducts());
        model.addAttribute("userEntity", new UserEntity());
        return "register";
    }
    @RequestMapping(value = {"/login"})
    public String login(Model model) {
        return "login2";
    }
    @RequestMapping(value = {"/details/{id}"})
    public String detailPage(Model model, @PathVariable(value = "id") Long id) {
        ProductEntity pro = productService.getProduct(id);
        model.addAttribute("lstP", productService.getAllProducts());
        model.addAttribute("pro", pro);
        return "details";
    }
    @RequestMapping(value = {"/men"})
    public String menPage(Model model, HttpServletRequest request) {
        PagedListHolder pagedListHolder = new PagedListHolder(productService.getGender("men"));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);
        model.addAttribute("pagedListHolder", pagedListHolder);
        return "men";
    }
    @RequestMapping(value = {"/women"})
    public String womenPage(Model model, HttpServletRequest request) {
        PagedListHolder pagedListHolder = new PagedListHolder(productService.getGender("women"));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);
        model.addAttribute("pagedListHolder", pagedListHolder);
        return "women";
    }
    @RequestMapping(value = {"/kids"})
    public String kidsPage(Model model) {
        model.addAttribute("lstP", productService.getAllProducts());
        return "kids";
    }
    @RequestMapping(value = {"/brand-envato"})
    public String brandsPage(Model model) {
        model.addAttribute("lstP", productService.getBrands("envato"));
        
        return "brand-page";
    }
    @RequestMapping(value = {"/brand-themeforest"})
    public String brands2Page(Model model) {
        model.addAttribute("lstP", productService.getBrands("themeforest"));
        return "brand-page";
    }
    @RequestMapping(value = {"/brand-photodune"})
    public String brands3Page(Model model) {
        model.addAttribute("lstP", productService.getBrands("photodune"));
        return "brand-page";
    }
    @RequestMapping(value = {"/brand-activeden"})
    public String brands4Page(Model model) {
        model.addAttribute("lstP", productService.getBrands("activeden"));
        return "brand-page";
    }
    @RequestMapping(value = {"/tags/{id}"})
    public String TagsPage(Model model, @PathVariable(value = "id") Long id) {
        model.addAttribute("lstP", productService.getTags(id));
        return "brand-page";
    }
    @RequestMapping(value = {"/add-new"})
    public String register(Model model, @ModelAttribute(value = "userEntity") UserEntity user, HttpServletRequest request) {
        List<UserEntity> lstS = userService.getAll();
        String note = request.getParameter("note");
        String repass = request.getParameter("repass");
        if (!repass.equals(user.getPassword())) {
            model.addAttribute("mess", "Your password not match !!!");
            model.addAttribute("userEntity", user);
            return "register";
        }
        if (note.isEmpty()) {
            for (UserEntity userEntity : lstS) {
                if (userEntity.getEmail().equalsIgnoreCase(user.getEmail())) {
                    model.addAttribute("mess", "Your email is Existed !!!" + note);
                    return "register";
                }
            }
        }
        if (!user.getEmail().isEmpty()) {
            user.setEnabled(true);
            user.setRoleid(1);
            userService.addNew(user);
        }
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(user.getEmail());
        if (note.isEmpty()) {
            email.setSubject("Your registration was successful !");
            email.setText("Dear "+user.getFirstname()+" ,\n" + "\n" + "Welcome to FlatShop !");
        } else {
            email.setSubject("Your changed was successful !");
            email.setText("Dear "+user.getFirstname()+" ,\n" + "\n" + "You have just updated your informaion, Thank you !");
        }
        
        mailSender.send(email);
        
        return "redirect:/home";
    }
    @RequestMapping(value = {"/user-infor"})
    public String userInfo(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity userEntity = (UserEntity) authentication.getPrincipal();
        List<OrrrderEntity> getLst = orrrderService.find(userEntity.getId());
        List<OrderDetailEntity> getD = new ArrayList<>();
        for (OrrrderEntity orrrderEntity : getLst) {
            List<OrderDetailEntity> get = (orderDetailService.find(orrrderEntity.getId()));
            getD.addAll(get);
        }
        model.addAttribute("userEntity", userEntity);
        model.addAttribute("lstO", getLst);
        model.addAttribute("lstD", getD);
        return "user-page";
    }
    @RequestMapping(value = {"/edit"})
    public String editUser(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity userEntity = (UserEntity) authentication.getPrincipal();
        model.addAttribute("userEntity", userEntity);
        model.addAttribute("notice", "edit");
        return "test";
    }
    @RequestMapping(value = {"/search"})
    public String searchProduct (Model model, @ModelAttribute(value = "search") String search) {
        model.addAttribute("lstS", productService.search(search));
        return "home2";
    }
    @RequestMapping(value = {"/cart"})
    public String viewCart(Model model, HttpSession session) {
        model.addAttribute("sum", session.getAttribute("sum"));
        model.addAttribute("lstO", (List<OrderDetailEntity>) session.getAttribute("lstPro"));
        return "shoppingcart";
    }
    @RequestMapping(value = "/del/{id}")
    public String delCart(Model model, @PathVariable(value = "id") Long id, HttpSession session) {
        List<OrderDetailEntity> lstPro = (List<OrderDetailEntity>) session.getAttribute("lstPro");
        for (OrderDetailEntity productEntity : lstPro) {
            if (Objects.equals(productEntity.getProductEntity().getId(), id)) {
                lstPro.remove(productEntity);
                break;
            }
        }
        if(lstPro.size()>0){
            session.setAttribute("lstPro", lstPro);
        }else{
            session.removeAttribute("lstPro");
        }
        return "redirect:/cart";
    }
    @RequestMapping(value = "/checkout")
    public String checkout(Model model, HttpSession session, Principal user) {
        if (user == null) {
            model.addAttribute("messre", "You need to Register first !");
            return "redirect:/register";
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity userEntity = (UserEntity) authentication.getPrincipal();
        OrrrderEntity oe = new OrrrderEntity();
        oe.setUserEntity(userEntity);
        Calendar calendar = Calendar.getInstance();
        java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());
        oe.setOrderDate(startDate);
        orrrderService.add(oe);
        List<OrderDetailEntity> lstP = (List<OrderDetailEntity>) session.getAttribute("lstPro");
        for (OrderDetailEntity orderDetailEntity : lstP) {
            double pr = orderDetailEntity.getProductEntity().getPrice() - orderDetailEntity.getProductEntity().getPrice() * orderDetailEntity.getProductEntity().getDiscount() / 100;
            orderDetailEntity.setPrice(pr);
            orderDetailEntity.setTotal(orderDetailEntity.getQuantity() * pr);
            orderDetailEntity.setOrdersEntity(oe);
            orderDetailService.addNew(orderDetailEntity);
            pr = 0;
        }
        final String username = "iviettechtest@gmail.com";
        final String password = "testemail@2018";

        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 587);

        Session session1 = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {
            MimeMessage message = new MimeMessage(session1);
            message.setFrom(new InternetAddress(username));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEntity.getEmail()));
            message.setSubject("Thank you for buying products from our service !");
            Multipart multipart = new MimeMultipart("mixed");
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText("Your recent order ! \n\n Product name \t\t\t\t\t\t\t\t\t\t Price \t\t Quantity \t Total");
            multipart.addBodyPart(textPart);
            double i = 0;
            for (OrderDetailEntity orderDetailEntity : lstP) {
                String a = orderDetailEntity.getProductEntity().getProductname();
                double b = orderDetailEntity.getProductEntity().getPrice() - orderDetailEntity.getProductEntity().getPrice() * orderDetailEntity.getProductEntity().getDiscount() / 100;
                int c = orderDetailEntity.getQuantity();
                double d = orderDetailEntity.getQuantity() * b;
                i = i + d;
                MimeBodyPart textBody = new MimeBodyPart();
                textBody.setText(a +"\t\t     " +"        $"+b + "\t\t" + c +"\t\t"+"$"+d);
                multipart.addBodyPart(textBody);
            }
            MimeBodyPart sum = new MimeBodyPart();
            sum.setText("\n\nGrand Total : " + i);
            MimeBodyPart end = new MimeBodyPart();
            end.setText("\n\nYour items will be delivered as soon as possible");
            multipart.addBodyPart(sum);
            multipart.addBodyPart(end);
            message.setContent(multipart);
            Transport.send(message);
        } catch (MessagingException ex) {
        }
        session.removeAttribute("lstPro");
        return "redirect:/home";
    }
    @RequestMapping(value = "/pricem")
    public String price(Model model, @ModelAttribute(value = "min") double p1, @ModelAttribute(value = "max") double p2, HttpServletRequest request) {
        PagedListHolder pagedListHolder = new PagedListHolder(productService.getPrice(p1, p2));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);
        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("price", "price");
        return "men";
    }
    @RequestMapping(value = "/pricew")
    public String priceW(Model model, @ModelAttribute(value = "min") double p1, @ModelAttribute(value = "max") double p2, HttpServletRequest request) {
        PagedListHolder pagedListHolder = new PagedListHolder(productService.getPrice(p1, p2));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);
        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("price", "price");
        return "women";
    }
    @RequestMapping(value = "/pricek")
    public String priceK(Model model, @ModelAttribute(value = "min") double p1, @ModelAttribute(value = "max") double p2, HttpServletRequest request) {
        List<ProductEntity> lst = productService.getPrice(p1, p2);
        List<ProductEntity> lstP = new ArrayList<>();
        for (ProductEntity productEntity : lst) {
            if (productEntity.getGender().equalsIgnoreCase("kids")) {
                lstP.add(productEntity);
            }
        }
        model.addAttribute("lstP", lstP);
        return "kids";
    }
    @RequestMapping(value = "/order/{id}")
    public String addOrder(Model model, @PathVariable(value = "id") Long id, HttpSession session, HttpServletRequest request) {
        ProductEntity productEntity = productService.getProduct(id);
        OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
        orderDetailEntity.setProductEntity(productEntity);
        String a = request.getParameter("size");
        String b = request.getParameter("qty");
        if (a != null && b !=null) {
            orderDetailEntity.setSize(request.getParameter("size"));
            orderDetailEntity.setQuantity(Integer.parseInt(request.getParameter("qty")));
        } else {
            orderDetailEntity.setSize("S");
            orderDetailEntity.setQuantity(1);
        }
        
        List<OrderDetailEntity> lstP = (List<OrderDetailEntity>) session.getAttribute("lstPro");
        if (lstP != null && lstP.size() > 0) {
            lstP.add(orderDetailEntity);
        } else {
            lstP = new ArrayList<>();
            lstP.add(orderDetailEntity);
        }
        session.setAttribute("lstPro", lstP);
        model.addAttribute("lstO", session.getAttribute("lstPro"));
        double sum = 0;
        for (OrderDetailEntity productEntity111 : lstP) {
            sum = sum + productEntity111.getProductEntity().getPrice() - productEntity111.getProductEntity().getPrice() * productEntity111.getProductEntity().getDiscount() / 100;
        }
        session.setAttribute("sum", sum);
        return "redirect:/cart";
    }
    @RequestMapping(value = "/update")
    public String updateOrder(HttpServletRequest request, HttpSession session) {
        String[] size = request.getParameterValues("size");
        String[] quantity = request.getParameterValues("quantity");
        List<OrderDetailEntity> lstP = (List<OrderDetailEntity>) session.getAttribute("lstPro");
        for (int i = 0; i < lstP.size(); i++) {
            lstP.get(i).setSize(size[i]);
        }
        for (int i = 0; i < lstP.size(); i++) {
            lstP.get(i).setQuantity(Integer.parseInt(quantity[i]));
        }
        double sum = 0;
        for (OrderDetailEntity productEntity111 : lstP) {
            double pr = productEntity111.getProductEntity().getPrice() - productEntity111.getProductEntity().getPrice() * productEntity111.getProductEntity().getDiscount() / 100;
            sum = sum + (pr*productEntity111.getQuantity());
            pr = 0;
        }
        session.setAttribute("sum", sum);
        session.setAttribute("lstPro", lstP);
        return "redirect:/cart";
    }
    @RequestMapping(value = "/checkout1")
    public String checkout1(Model model, Principal user) {
        if (user == null) {
            model.addAttribute("messre", "You need to Register first !");
            return "req";
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity userEntity = (UserEntity) authentication.getPrincipal();
        model.addAttribute("userEntity", userEntity);
        model.addAttribute("ac", "ac");
        return "user-page";
    }
    @RequestMapping(value = "/add-edit")
    public String addEdit(Model model, @ModelAttribute(value = "userEntity") UserEntity userEntity) {
        if (userEntity.getId().intValue() > 0) {
            userEntity.setEnabled(true);
            userEntity.setRoleid(1);
            userService.addNew(userEntity);
        } 
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(userEntity.getEmail());
        email.setSubject("Your changed was Updated !");
        email.setText("Dear "+userEntity.getFirstname()+" ,\n" + "\n" + "You have just updated your informaion, Thank you !");
        mailSender.send(email);
        return "redirect:/home";
    }
    @RequestMapping(value = {"/summer"})
    public String summerPage(Model model, HttpServletRequest request) {
        List<ProductEntity> lstP = productService.getAllProducts();
        List<ProductEntity> lst = new ArrayList<>();
        for (ProductEntity productEntity : lstP) {
            if (productEntity.getId().intValue()%2==0) {
                lst.add(productEntity);
            }
        }
        PagedListHolder pagedListHolder = new PagedListHolder(lst);
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);
        model.addAttribute("pagedListHolder", pagedListHolder);
        return "summer";
    }
    @RequestMapping(value = {"/winter"})
    public String winterPage(Model model, HttpServletRequest request) {
        List<ProductEntity> lstP = productService.getAllProducts();
        List<ProductEntity> lst = new ArrayList<>();
        for (ProductEntity productEntity : lstP) {
            if (productEntity.getId().intValue()%2!=0) {
                lst.add(productEntity);
            }
        }
        PagedListHolder pagedListHolder = new PagedListHolder(lst);
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);
        model.addAttribute("pagedListHolder", pagedListHolder);
        return "winter";
    }
    @RequestMapping(value = {"/forgot"})
    public String forgot(Model model) {
        model.addAttribute("fg", "fg");
        return "login2";
    }
    @RequestMapping(value = {"/sendpass"}, method = RequestMethod.GET)
    public String forgotPass(Model model, HttpServletRequest request) {
        String mail = request.getParameter("fgemail");
        UserEntity userEntity = userService.findByEmail(mail);
        if (userEntity != null) {
           SimpleMailMessage email = new SimpleMailMessage();
            email.setTo(userEntity.getEmail());
            email.setSubject("Your Password");
            email.setText("Here is your old password: "+userEntity.getPassword()+"\nPlease change it when you log in again !");
            mailSender.send(email);
            model.addAttribute("mail", "We've send to your email the password, Please check !");
            return "login2";
        }
        else {
            model.addAttribute("mail", "Your email is non-existent !");
            return "login2";
        }

    }
}
