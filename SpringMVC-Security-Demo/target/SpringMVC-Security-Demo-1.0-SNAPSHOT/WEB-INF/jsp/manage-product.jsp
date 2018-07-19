<%-- 
    Document   : viewDetail
    Created on : Apr 30, 2018, 9:52:24 AM
    Author     : Qu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Page</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <style>
            table, th, td {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
              <div class="navbar-header">
                  <a class="navbar-brand" href="<c:url value="/home"/>">Go back HomePage</a>
              </div>
              <ul class="nav navbar-nav">
                <li><a href="<c:url value="/admin-page"/>">Admin Page</a></li>
                <li><a href="<c:url value="/manage-products"/>">Manage Products</a></li>
                <li><a href="<c:url value="/manage-users"/>">Manage Users</a></li>
              </ul>
            </div>
        </nav>
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <h1 style="text-align: center">Product List</h1>
            </div>
            <form action="searchp" class="form-inline">
                <label>Search by Product name : </label>
                <input type="text" name="search" placeholder="Enter product name"class="form-control"/>
                <input type="submit" value="" hidden="true"/>
            </form>
            <div style="width: 100%; float: bottom; margin-bottom: 10px">
                <button type="button" class="btn btn-default" onclick="location.href='<c:url value="/add-pro"/>'">Add new Product</button>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th hidden>ID</th>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Color</th>
                            <th>Description</th>
                            <th>Gender</th>
                            <th>Size</th>
                            <th>Discount</th>
                            <th>Category</th>
                            <th>Featured</th>
                            <th>Brand</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach var="p" items="${lstP}">
                            <tr>
                                <td hidden>${p.id}</td>
                                <td><img src="${p.image}" height="110" width="75"/></td>
                                <td>${p.productname}</td>
                                <td>${p.price}</td>
                                <td>${p.color}</td>
                                <td>${p.description}</td>
                                <td>${p.gender}</td>
                                <td>${p.size}</td>
                                <td>${p.discount}</td>
                                <td>${p.categoryId.id}</td>
                                <td>${p.featured}</td>
                                <td>${p.brand}</td>
                                <td>
                                    <button class="btn-warning" onclick="location.href = '${pageContext.request.contextPath}/edit-pro/${p.id}'" style="margin-bottom: 10px">
                                        Edit
                                    </button>
                                        <br> <br>
                                    <button class="btn-danger" onclick="location.href = '${pageContext.request.contextPath}/delete/${p.id}'">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
