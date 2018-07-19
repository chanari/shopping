<%-- 
    Document   : cart
    Created on : May 30, 2018, 6:42:51 PM
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
      <link rel="shortcut icon" href="${pageContext.request.contextPath}//resources/images/favicon.png">
      <title>Welcome to FlatShop</title>
      <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
      <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
      <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css" type="text/css" media="screen"/>
      <link href="${pageContext.request.contextPath}/resources/css/sequence-looptheme.css" rel="stylesheet" media="all"/>
      <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
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
        <div class="container shopping-cart">
          <div class="row">
            <div class="col-md-12">
              <h3 class="title">
                Shopping Cart
              </h3>
              <c:if test="${empty lstO}">
                  <h3 class="title">
                Have no Product in your Cart !!!
              </h3>
              </c:if>
                
              <div class="clearfix">
              </div>
                <c:if test="${not empty lstO}">
                    <form action="update">
                        
                    
              <table class="shop-table">
                <thead>
                  <tr>
                    <th>
                      Image
                    </th>
                    <th>
                      Product name
                    </th>
                    <th>
                      Size
                    </th>
                    <th>
                      Quantity
                    </th>
                    <th>
                      Price
                    </th>
                    <th>
                      Delete
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="o" items="${lstO}" >
                      <tr>
                    <td>
                      <img src="${pageContext.request.contextPath}/${o.productEntity.image}" alt="">
                    </td>
                    <td>
                      <div class="shop-details">
                        <div class="productname">
                          ${o.productEntity.productname}
                        </div>
                      </div>
                    </td>
                    <td>
                      <select name="size">
                          <c:choose>
                                <c:when test="${o.size == 'S'}">
                                    <option value="${o.size}" selected="true">${o.size}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="S">S</option>
                                </c:otherwise>
                          </c:choose>
                                    <c:choose>
                                <c:when test="${o.size == 'M'}">
                                    <option value="${o.size}" selected="true">${o.size}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="M">M</option>
                                </c:otherwise>
                          </c:choose>
                                    <c:choose>
                                <c:when test="${o.size == 'L'}">
                                    <option value="${o.size}" selected="true">${o.size}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="L">L</option>
                                </c:otherwise>
                          </c:choose>
                      </select>
                    </td>
                    <td>
                        <select name="quantity">
                            <c:choose>
                                <c:when test="${o.quantity eq 1}">
                                    <option value="${o.quantity}" selected="true">${o.quantity}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="1">1</option>
                                </c:otherwise>
                          </c:choose>
                                    <c:choose>
                                <c:when test="${o.quantity eq 2}">
                                    <option value="${o.quantity}" selected="true">${o.quantity}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="2">2</option>
                                </c:otherwise>
                          </c:choose>
                                    <c:choose>
                                <c:when test="${o.quantity eq 3}">
                                    <option value="${o.quantity}" selected="true">${o.quantity}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="3">3</option>
                                </c:otherwise>
                          </c:choose>
                                    <c:choose>
                                <c:when test="${o.quantity eq 4}">
                                    <option value="${o.quantity}" selected="true">${o.quantity}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="4">4</option>
                                </c:otherwise>
                          </c:choose>
                                    <c:choose>
                                <c:when test="${o.quantity eq 5}">
                                    <option value="${o.quantity}" selected="true">${o.quantity}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="5">5</option>
                                </c:otherwise>
                          </c:choose>
                        </select>
                    </td>
                    <td>
                      <h5>
                        <strong class="red">
                          $${o.productEntity.price - o.productEntity.price*(o.productEntity.discount/100)}
                        </strong>
                      </h5>
                    </td>
                    <td>
                        <a href="<c:url value="/del/${o.productEntity.id}"/>">
                        <img src="${pageContext.request.contextPath}/resources/images/remove.png" alt="">
                      </a>
                    </td>
                  </tr>
                  </c:forEach>
                  
                </tbody>
                 <tfoot>
                <td colspan="6">
                      <button class=" pull-right">
                        Update Shopping Cart
                      </button>
                    </td>
              </tfoot>
              </table>
                        </form>
              <table>
                            <tfoot>
                  <tr>
                    <td colspan="6">
                        
                        <button class="pull-left" onclick="location.href = '${pageContext.request.contextPath}/home'">
                                Continue Shopping
                        </button>
                    </td>
                  </tr>
                </tfoot>
               </table>
              <div class="clearfix">
              </div>
              <div class="row">
                <div class="col-md-4 col-sm-6">
                  
                </div>
                <div class="col-md-4 col-sm-6">
                  
                </div>
                <div class="col-md-4 col-sm-6">
                  <div class="shippingbox">
                    
                    <div class="grandtotal">
                      <h5>
                        GRAND TOTAL 
                      </h5>
                      <span>
                        $${sum}
                        
                      </span>
                    </div>
                    <button onclick="location.href = '${pageContext.request.contextPath}/checkout1'">
                      Process To Checkout
                    </button>
                      
                  </div>
                </div>
                      
              </div>
            </div>
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
                        <div class="footer-logo"><a href="#"><img src="resources//images/logo.png" alt=""></a></div>
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
                      </c:if>
    </div>
    <script type="text/javascript" src="resources/js/jquery-1.10.2.min.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.sequence-min.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	  <script defer src="${pageContext.request.contextPath}/resources/js/jquery.flexslider.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/script.min.js" ></script>
  </body>
</html>
