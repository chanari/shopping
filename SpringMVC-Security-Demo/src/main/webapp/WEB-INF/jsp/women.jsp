<%-- 
    Document   : men
    Created on : Jun 7, 2018, 9:59:38 AM
    Author     : Qu
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tg" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resources/resources/images/favicon.png">
    <title>
      Welcome to FlatShop
    </title>
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/flexslider.css" type="text/css" media="screen"/>
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="wrapper">
      <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-md-2 col-sm-2">
                     <div class="logo"><a href="${pageContext.request.contextPath}"><img src="resources/images/logo.png" alt="FlatShop"></a></div>
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
                              <li><a href="<c:url value="/men"/>">men</a></li>
                              <li><a href="<c:url value="/women"/>">women</a></li>
                              <li><a href="<c:url value="/kids"/>">kids</a></li>
                              <li class="dropdown">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fashion</a>
                                 <div class="dropdown-menu mega-menu">
                                    <div class="row">
                                       <div class="col-md-6 col-sm-6">
                                          <ul class="mega-menu-links">
                                              <li><a href="<c:url value="summer"/>">For Summer</a></li>
                                             <li><a href="<c:url value="winter"/>">For Winter</a></li>
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
                                                  <li><a href="<c:url value="manage-users" />">Manage Users</a></li>
                                                  <li><a href="<c:url value="manage-products" />">Manage Products</a></li>
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
            <div class="col-md-3">
              <div class="category leftbar">
                <h3 class="title">
                  Categories
                </h3>
                <ul>
                  <li>
                      <a href="<c:url value="/men"/>">
                      Men
                    </a>
                  </li>
                  <li>
                    <a href="<c:url value="/women"/>">
                      Women
                    </a>
                  </li>
                  <li>
                    <a href="<c:url value="/kids"/>">
                      Kids
                    </a>
                  </li>
                </ul>
              </div>
              <div class="price-filter leftbar">
                <h3 class="title">
                  Price
                </h3>
                  <form class="pricing" action="pricem">
                  <label>
                    $ 
                    <input type="number" name="min">
                  </label>
                  <span class="separate">
                    - 
                  </span>
                  <label>
                    $ 
                    <input type="number" name="max">
                  </label>
                  <input type="submit" value="Go">
                </form>
              </div>
              
              <div class="product-tag leftbar">
                <h3 class="title">
                  Products 
                  <strong>
                    Tags
                  </strong>
                </h3>
                <ul>
                  
                      <li>
                          <a href="<c:url value="tags/1"/>">SDress for Girl</a>
                      </li>
                      <li>
                          <a href="<c:url value="tags/2"/>">Corner</a>
                      </li>
                      <li>
                          <a href="<c:url value="tags/3"/>">Window</a>
                      </li>
                </ul>
              </div>
              
              
              
            </div>
            <div class="col-md-9">
              <div class="banner">
                <div class="bannerslide" id="bannerslide">
                  <ul class="slides">
                    <li>
                      <a href="#">
                        <img src="resources/images/banner-01.jpg" alt=""/>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <img src="resources/images/banner-02.jpg" alt                       </a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="clearfix">
              </div>
              <div class="products-list">
                <div class="toolbar">
                  <div class="sorter">
                    <div class="view-mode">
                      
                    </div>
                </div>
                  <c:if test="${empty price}">
                      <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
            <c:url value="/women" var="pagedLink">
                <c:param name="p" value="~" />
            </c:url>
                  </c:if>
                <ul class="products-listItem">
                  <c:forEach var="p" items="${pagedListHolder.pageList}">
                      <li class="products">
                    <div class="thumbnail">
                      <a href="${pageContext.request.contextPath}/details/${p.id}"><img src="${p.image}" alt="Product Name"></a>
                    </div>
                    <div class="product-list-description">
                      <div class="productname">
                        <a href="${pageContext.request.contextPath}/details/${p.id}">${p.productname}</a>
                      </div>
                      <p>
                        ${p.description}
                      </p>
                      <div class="list_bottom">
                        <div class="price">
                          <span class="new_price">
                            ${p.price - (p.discount/100)*p.price}
                            <sup>
                              $
                            </sup>
                          </span>
                            <c:if test="${p.discount > 2}" >
                          <span class="old_price">
                            ${p.price}
                            <sup>
                              $
                            </sup>
                          </span>
                        </c:if>
                        </div>
                        <div class="button_group">
                          <button class="button add-cart" onclick="location.href = '${pageContext.request.contextPath}/order/${p.id}'" >Add To Cart</button>
                        </div>
                      </div>
                    </div>
                  </li>
                  </c:forEach>
                </ul>
                
              </div><c:if test="${empty price}">
                  <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" /></c:if>
            </div>
          </div>
          <div class="clearfix">
          </div>
          <div class="our-brand">
                  <h3 class="title"><strong>Our </strong> Brands</h3>
                  <ul id="braldLogo">
                     <li>
                        <ul class="brand_item">
                           <li>
                               <a href="<c:url value="/brand-envato"/>">
                                 <div class="brand-logo"><img src="resources/images/envato.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="<c:url value="/brand-themeforest"/>">
                                 <div class="brand-logo"><img src="resources/images/themeforest.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="<c:url value="/brand-photodune"/>">
                                 <div class="brand-logo"><img src="resources/images/photodune.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="<c:url value="/brand-activeden"/>">
                                 <div class="brand-logo"><img src="resources/images/activeden.png" alt=""></div>
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
                    <img src="resources/images/logo.png" alt="">
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
        <script type="text/javascript" src="resources/js/jquery-1.10.2.min.js">
        </script>
        <script type="text/javascript" src="resources/js/bootstrap.min.js">
        </script>
        <script defer src="resources/js/jquery.flexslider.js">
        </script>
        <script type="text/javascript" src="resources/js/jquery.carouFredSel-6.2.1-packed.js">
        </script>
        <script type="text/javascript" src='resources/js/jquery.elevatezoom.js'>
        </script>
        <script type="text/javascript" src="resources/js/script.min.js" >
        </script>
    </body>
</html>
