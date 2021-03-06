<%-- 
    Document   : details
    Created on : May 27, 2018, 8:04:18 PM
    Author     : Qu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resources/images/favicon.png" >
    <title>
      Welcome to FlatShop
    </title>
    <link href="http://localhost:8084/SpringMVC-Security-Demo/resources/css/bootstrap.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
    <link href="http://localhost:8084/SpringMVC-Security-Demo/resources/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://localhost:8084/SpringMVC-Security-Demo/resources/css/flexslider.css" type="text/css" media="screen"/>
    <link href="http://localhost:8084/SpringMVC-Security-Demo/resources/css/style.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
</script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js">
</script>
<![endif]-->
  </head>
  <body>
    <div class="wrapper">
      <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-md-2 col-sm-2">
                     <div class="logo"><a href="${pageContext.request.contextPath}"><img src="http://localhost:8084/SpringMVC-Security-Demo/resources/images/logo.png" alt="FlatShop"></a></div>
                  </div>
                  <div class="col-md-10 col-sm-10">
                     <div class="header_top">
                        <div class="row">
                           <div class="col-md-3">
                              
                           </div>
                           <div class="col-md-6">
                              
                           </div>
                           <div class="col-md-3">
                              <ul class="usermenu">
                                 <li>
                                    <sec:authorize access="!isAuthenticated()">
                                        <a href="<c:url value="/login"/>" class="log">Login</a>
                                    </sec:authorize>
                                 </li>
                                 <li>
                                    <sec:authorize access="!isAuthenticated()">
                                        <a href="<c:url value="/register"/>" class="reg">Register</a>
                                    </sec:authorize>
                                 </li>
                                 <li>
                                    <sec:authorize access="isAuthenticated()">
                                        <a href="<c:url value="/user-infor"/>" class="log">
                                            <sec:authentication property="principal.firstname"/>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/logout" class="reg">Logout</a>
                                    </sec:authorize>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                     <div class="clearfix"></div>
                     <div class="header_bottom">
                        <ul class="option">
                           <li id="search" class="search">
                               <form action="${pageContext.request.contextPath}/search"><input class="search-submit" type="submit" value=""><input class="search-input" placeholder="Enter your search term..." type="text" value="" name="search"></form>
                           </li>
                           <li class="option-cart">
                               <a href="<c:url value="/cart"/>" class="cart-icon">cart</a>
                              
                           </li>
                        </ul>
                        <div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                        <div class="navbar-collapse collapse">
                           <ul class="nav navbar-nav">
                              <li>
                                 <a href="${pageContext.request.contextPath}/home">home</a>
                              </li>
                              <li><a href="<c:url value="${pageContext.request.contextPath}/men"/>">men</a></li>
                              <li><a href="<c:url value="${pageContext.request.contextPath}/women"/>">women</a></li>
                              <li><a href="<c:url value="${pageContext.request.contextPath}/kids"/>">kids</a></li>
                              <li class="dropdown">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fashion</a>
                                 <div class="dropdown-menu mega-menu">
                                    <div class="row">
                                       <div class="col-md-6 col-sm-6">
                                          <ul class="mega-menu-links">
                                              <li><a href="<c:url value="/summer"/>">For Summer</a></li>
                                             <li><a href="<c:url value="/winter"/>">For Winter</a></li>
                                          </ul>
                                       </div>
                                    </div>
                                 </div>
                              </li>
                              
                              <li>
                                  <sec:authorize access="hasRole('ROLE_ADMIN')" >
                                      <li class="active dropdown">
                                          <a class="dropdown-toggle" data-toggle="dropdown">Admin Tools</a>
                                            <div class="dropdown-menu">
                                               <ul class="mega-menu-links">
                                                  <li><a href="<c:url value="admin-page" />">Admin Page</a></li>
                                               </ul>
                                            </div>
                                      </li>
                                  </sec:authorize>
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      <div class="clearfix">
      </div>
      <div class="container_fullwidth">
        <div class="container">
          <div class="row">
            <div class="col-md-9">
              <div class="products-details">
                <div class="preview_image">
                  <div class="preview-small">
                      <img src="http://localhost:8084/SpringMVC-Security-Demo/${pro.image}"  alt="" width="600" height="570">
                  </div>
                  
                </div>
                <div class="products-description">
                  <h5 class="name">
                    Lincoln Corner Unit Products
                  </h5>
                  
                  <p>
                    Availability: 
                    <span class=" light-red">
                      In Stock
                    </span>
                  </p>
                  <p>
                    ${pro.description}
                  </p>
                  <hr class="border">
                  <div class="price">
                          <span class="new_price">
                            ${pro.price - (pro.discount/100)*pro.price}
                            <sup>
                              $
                            </sup>
                          </span>
                            <c:if test="${pro.discount > 2}" >
                          <span class="old_price">
                            ${pro.price}
                            <sup>
                              $
                            </sup>
                          </span>
                        </c:if>
                        </div>
                  <hr class="border">
                  <form action="${pageContext.request.contextPath}/order/${pro.id}">
                  
                  <div class="wided">
                    <div class="qty">
                      Qty &nbsp;&nbsp;: 
                      <select name="qty">
                          <option value="1">
                          1
                        </option>
                        <option value="2">
                          2
                        </option>
                        <option value="3">
                          3
                        </option>
                      </select>
                     
                    </div>
                      <hr class="border">
                      <div class="qty">
                      Size &nbsp;&nbsp;: 
                      <select name="size">
                          <option value="S">
                          S
                        </option>
                        <option value="M">
                          M
                        </option>
                        <option value="L">
                          L
                        </option>
                      </select>
                    </div>
                    <div class="button_group">
                      <button class="button" >
                        Add To Cart
                      </button>
                      
                    </div>
                  </div>
                      </form>
                  <div class="clearfix">
                  </div>
                  <hr class="border">
                  
                </div>
              </div>
              <div class="clearfix">
              </div>
              <div class="tab-box">
                <div id="tabnav">
                  <ul>
                    <li>
                      <a href="#Descraption">
                        DESCRIPTION
                      </a>
                  </ul>
                </div>
                <div class="tab-content-wrap">
                  <div class="tab-content" id="Descraption">
                    ${pro.description}
                  </div>
                  
                  
                  
                </div>
              </div>
              <div class="clearfix">
              </div>
              <div id="productsDetails" class="hot-products">
                <h3 class="title">
                  <strong>
                    Featured
                  </strong>
                  Products
                </h3>
                
                <ul id="hot">
                  
                  <li>
                    <div class="row">
                      <c:forEach var="s" items="${lstP}">
                                     <c:if test="${s.featured > 0}">
                                        <div class="col-md-4 col-sm-4">
                                           <div class="products">
                                               <c:if test="${s.discount > 1}">
                                                   <div class="offer">- %${s.discount}</div>
                                               </c:if>
                                              
                                                   <div class="thumbnail"><a href="${pageContext.request.contextPath}/details/${s.id}"><img src="http://localhost:8084/SpringMVC-Security-Demo/${s.image}" alt="Product Name" width="150" height="220"></a></div>
                                              <div class="productname">${s.productname}</div>
                                              <h4 class="price">$${s.price - (s.discount/100)*s.price}</h4>
                                              <div class="button_group">
                                              <button class="button add-cart" onclick="location.href = '${pageContext.request.contextPath}/order/${s.id}'" >Add To Cart</button>
                                           </div>
                                           </div>
                                        </div>
                                     </c:if>
                             </c:forEach>
                      
                      
                    </div>
                  </li>
                </ul>
              </div>
              <div class="clearfix">
              </div>
            </div>
            <div class="col-md-3">
              
          </div>
          <div class="clearfix">
          </div>
          <div class="our-brand">
            <h3 class="title">
              <strong>
                Our 
              </strong>
              Brands
            </h3>
            
            <ul id="braldLogo">
              
              <li>
                <ul class="brand_item">
                  <li>
                    <a href="<c:url value="/brand-envato"/>">
                      <div class="brand-logo">
                        <img src="http://localhost:8084/SpringMVC-Security-Demo/resources/images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="<c:url value="/brand-themeforest"/>">
                      <div class="brand-logo">
                        <img src="http://localhost:8084/SpringMVC-Security-Demo/resources/images/themeforest.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="<c:url value="/brand-photodune"/>">
                      <div class="brand-logo">
                        <img src="http://localhost:8084/SpringMVC-Security-Demo/resources/images/photodune.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="<c:url value="/brand-activeden"/>">
                      <div class="brand-logo">
                        <img src="http://localhost:8084/SpringMVC-Security-Demo/resources/images/activeden.png" alt="">
                      </div>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="clearfix">
      </div>
      <div class="footer">
        <div class="footer-info">
          <div class="container">
            <div class="row">
              <div class="col-md-3">
                <div class="footer-logo">
                  <a href="#">
                    <img src="http://localhost:8084/SpringMVC-Security-Demo/resources/images/logo.png" alt="">
                  </a>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <h4 class="title">
                  Contact 
                  <strong>
                    Info
                  </strong>
                </h4>
                <p>
                  No. 08, Nguyen Trai, Hanoi , Vietnam
                </p>
                <p>
                  Call Us : (084) 1900 1008
                </p>
                <p>
                  Email : michael@leebros.us
                </p>
              </div>
              <div class="col-md-3 col-sm-6">
                <h4 class="title">
                  Customer
                  <strong>
                    Support
                  </strong>
                </h4>
                <ul class="support">
                  <li>
                    <a href="#">
                      FAQ
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Payment Option
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Booking Tips
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Infomation
                    </a>
                  </li>
                </ul>
              </div>
              <div class="col-md-3">
                <h4 class="title">
                  Get Our 
                  <strong>
                    Newsletter 
                  </strong>
                </h4>
                
                <form class="newsletter">
                  <input type="text" name="" placeholder="Type your email....">
                  <input type="submit" value="SignUp" class="button">
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="copyright-info">
          <div class="container">
            <div class="row">
              <div class="col-md-6">
                <p>
                  Copyright © 2012. Designed by 
                  <a href="#">
                    Michael Lee
                  </a>
                  . All rights reseved
                </p>
              </div>
              <div class="col-md-6">
                <ul class="social-icon">
                  <li>
                    <a href="#" class="linkedin">
                    </a>
                  </li>
                  <li>
                    <a href="#" class="google-plus">
                    </a>
                  </li>
                  <li>
                    <a href="#" class="twitter">
                    </a>
                  </li>
                  <li>
                    <a href="#" class="facebook">
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript==================================================-->
    <script type="text/javascript" src="http://localhost:8084/SpringMVC-Security-Demo/resources/js/jquery-1.10.2.min.js">
    </script>
    <script type="text/javascript" src="http://localhost:8084/SpringMVC-Security-Demo/resources/js/bootstrap.min.js">
    </script>
    <script defer src="http://localhost:8084/SpringMVC-Security-Demo/resources/js/jquery.flexslider.js">
    </script>
    <script type="text/javascript" src="http://localhost:8084/SpringMVC-Security-Demo/resources/js/jquery.carouFredSel-6.2.1-packed.js">
    </script>
    <script type="text/javascript" src='http://localhost:8084/SpringMVC-Security-Demo/resources/js/jquery.elevatezoom.js'>
    </script>
    <script type="text/javascript" src="http://localhost:8084/SpringMVC-Security-Demo/resources/js/script.min.js" >
    </script>
  </body>
</html>
