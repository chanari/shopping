<%-- 
    Document   : register
    Created on : Jun 7, 2018, 11:11:23 AM
    Author     : Qu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
      <meta name="description" content="">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="shortcut icon" href="resources/resources/images/favicon.png">
      <title>Welcome to FlatShop</title>
      <link href="resources/css/bootstrap.css" rel="stylesheet">
      <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
      <link href="resources/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="resources/css/flexslider.css" type="text/css" media="screen"/>
      <link href="resources/css/sequence-looptheme.css" rel="stylesheet" media="all"/>
      <link href="resources/css/style.css" rel="stylesheet">
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
              <div class="checkout-page">
                <ol class="checkout-steps">
                    
                        
                  <li class="steps active">
                    <a href="" class="step-title">
                      <c:if test="${empty notice}">
                          register
                      </c:if>
                          <c:if test="${not empty notice}">
                          edit your information
                      </c:if>
                    </a>
                    <div class="step-description">
                        <f:form action="${pageContext.request.contextPath}/add-new" method="post" commandName="userEntity">
                        <div class="row">
                          <div class="col-md-6 col-sm-6">
                            <div class="your-details">
                                <c:if test="${not empty notice}">
                                    
                                <h5>
                                  Your Persional Details
                                </h5>
                                </c:if>
                              <c:if test="${not empty mess}">
                                  <h5>
                                ${mess}
                              </h5>
                              </c:if>
                                <div class="form-row">
                                    <f:input path="id" hidden="true"/>
                                        <input type="text" name="note" value="${notice}" hidden="true"/>
                                </div>
                              <div class="form-row">
                                  
                                  <f:label cssClass="lebel-abs" path="firstname">
                                  First Name 
                                  <strong class="red">
                                    *
                                  </strong>
                                </f:label>
                                  <f:input cssClass="input namefild" type="text" path="firstname" required="required" minlength="3" maxlength="100" />
                              </div>
                              <div class="form-row">
                                <f:label cssClass="lebel-abs" path="lastname">
                                  Last Name 
                                  <strong class="red">
                                    *
                                  </strong>
                                </f:label>
                                  <f:input cssClass="input namefild" type="text" path="lastname" required="required" minlength="3" maxlength="100" />
                              </div>
                              <c:if test="${empty notice}">
                              <div class="form-row">
                                <f:label cssClass="lebel-abs" path="email">
                                  Email
                                  <strong class="red">
                                    *
                                  </strong>
                                </f:label>
                                  <f:input cssClass="input namefild" type="email" path="email" required="required" />
                              </div>
                              </c:if>
                              <div class="form-row">
                                <f:label cssClass="lebel-abs" path="phone">
                                  Phone
                                  <strong class="red">
                                    *
                                  </strong>
                                </f:label>
                                  <f:input cssClass="input namefild" type="text" pattern="(?=.*[0-9]).{10,11}" title="It's should be from 0-9" path="phone" required="required" />
                              </div>
                                <div class="form-row">
                                <f:label cssClass="lebel-abs" path="address">
                                  Address
                                  <strong class="red">
                                    *
                                  </strong>
                                </f:label>
                                  <f:input cssClass="input namefild" type="text" path="address" required="required" minlength="3" maxlength="100" />
                              </div>
                              <div class="pass-wrap">
                                <div class="form-row">
                                  <f:label cssClass="lebel-abs" path="password">
                                  Your Password 
                                  <strong class="red">
                                    *
                                  </strong>
                                </f:label>
                                  <f:input cssClass="input cpass" type="password" path="password" required="required" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}" title="Must contain at least Uppercasen, a number and more 8 character"/>
                                </div>
                                  <c:if test="${empty notice}">
                                <div class="form-row">
                                  <label class="lebel-abs" >
                                  Re-type Password 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                  <input class="input cpass" type="password" name="repass" required="required" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}" />
                                </div>
                              </div>
                                    </c:if>
                                <c:if test="${empty notice}">
                              <button>
                                  Register
                              </button>
                              </c:if>
                                <c:if test="${not empty notice}">
                              <button>
                                  Submit
                              </button>
                              </c:if>
                                  <c:if test="${empty notice}">
                                <h5>
                                        Have an Account? <a href="<c:url value="/login"/>">Loggin now</a>
                                        
                              </h5>
                                  </c:if>
                            </div>
                          </div>
                          
                        </div>
                            </f:form>
                    </div>
                  </li>
                  
                  
                </ol>
              </div>
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
                        <div class="footer-logo"><a href="#"><img src="resources/images/logo.png" alt=""></a></div>
                     </div>
                     <div class="col-md-3 col-sm-6">
                        <h4 class="title">Contact <strong>Info</strong></h4>
                        <p>No. 08, Nguyen Trai, Hanoi , Vietnam</p>
                        <p>Call Us : (084) 1900 1008</p>
                        <p>Email : michael@leebros.us</p>
                     </div>
                     <div class="col-md-3 col-sm-6">
                        <h4 class="title">Customer<strong> Support</strong></h4>
                        <ul class="support">
                           <li><a href="#">FAQ</a></li>
                           <li><a href="#">Payment Option</a></li>
                           <li><a href="#">Booking Tips</a></li>
                           <li><a href="#">Infomation</a></li>
                        </ul>
                     </div>
                     <div class="col-md-3">
                        <h4 class="title">Get Our <strong>Newsletter </strong></h4>
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
                        <p>Copyright © 2012. Designed by <a href="#">Michael Lee</a>. All rights reseved</p>
                     </div>
                     <div class="col-md-6">
                        <ul class="social-icon">
                           <li><a href="#" class="linkedin"></a></li>
                           <li><a href="#" class="google-plus"></a></li>
                           <li><a href="#" class="twitter"></a></li>
                           <li><a href="#" class="facebook"></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
    </div>
    <!-- Bootstrap core JavaScript==================================================-->
    <script type="text/javascript" src="resources/js/jquery-1.10.2.min.js"></script>
	  <script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
	  <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="resources/js/jquery.sequence-min.js"></script>
	  <script type="text/javascript" src="resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	  <script defer src="resources/js/jquery.flexslider.js"></script>
	  <script type="text/javascript" src="resources/js/script.min.js" ></script>
  </body>
</html>
