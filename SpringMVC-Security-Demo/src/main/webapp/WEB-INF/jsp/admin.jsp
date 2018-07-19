<%-- 
    Document   : admin
    Created on : May 30, 2018, 4:47:57 PM
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
    <link rel="shortcut icon" href="resources/images/favicon.png">
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
                                              <li><a href="<c:url value="men"/>">For Men</a></li>
                                             <li><a href="<c:url value="women"/>">For Women</a></li>
                                             <li><a href="<c:url value="kids"/>">For Kids</a></li>
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
        <div class="container shopping-cart">
          <div class="row">
            <div class="col-md-3">
              <div class="category leftbar">
                <h3 class="title">
                  Menu
                </h3>
                <ul>
                  <li>
                      <a href="<c:url value="admin-page"/>">
                      Admin Page
                    </a>
                  </li>
                  <li>
                    <a href="<c:url value="manage-users"/>">
                      Manager Users
                    </a>
                  </li>
                  <li>
                    <a href="<c:url value="manage-products"/>">
                      Manager Products
                    </a>
                  </li>
                </ul>
              </div>
                      
            </div>
                      
            <div class="col-md-9">
              
              <div class="clearfix">
              </div>
              <div class="products-list">
                <div class="toolbar">
                  <div class="sorter">
                    <div class="view-mode">
                    </div>
                </div>
              </div>
            </div>
          </div>
          <div class="clearfix">
          </div>
          
        </div>
      </div>
      <div class="clearfix">
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
