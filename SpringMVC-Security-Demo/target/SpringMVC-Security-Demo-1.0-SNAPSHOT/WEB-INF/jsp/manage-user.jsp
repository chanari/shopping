<%-- 
    Document   : viewDetail
    Created on : Apr 30, 2018, 9:52:24 AM
    Author     : Qu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
            <c:if test="${not empty notice}">
                <div class="alert alert-success">
                    <strong>Success !</strong> Save .
                </div>
            </c:if>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <h1 style="text-align: center">User List</h1>
            </div>
            <form action="searchu" class="form-inline" style="margin-bottom: 10px">
                <label>Search by Email : </label>
                <input type="text" name="searchu" placeholder="Enter Email" class="form-control"/>
                <input type="submit" value="" hidden="true"/>
            </form>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th hidden>ID</th>
                            <th>Email</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Address</th>
                            <th>Password</th>
                            <th>Phone</th>
                            <th>Enable</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach var="p" items="${lstU}">
                            
                            <tr>
                                <td hidden>${p.id}</td>
                                <td>${p.email}</td>
                                <td>${p.firstname}</td>
                                <td>${p.lastname}</td>
                                <td>${p.address}</td>
                                <td>${p.password}</td>
                                <td>${p.phone}</td>
                                <td>${p.enabled}</td>
                                <td>
                                    <button class="btn-warning" onclick="location.href = '${pageContext.request.contextPath}/edit-user/${p.id}'">
                                        Edit
                                    </button>
                                        <br> <br>
                                        <c:if test="${p.enabled eq true}">
                                            <button class="btn-danger" onclick="location.href = '${pageContext.request.contextPath}/deactive/${p.id}'">
                                                Deactivate
                                            </button>
                                        </c:if>
                                        <c:if test="${p.enabled eq false}">
                                            <button class="btn-success" onclick="location.href = '${pageContext.request.contextPath}/active/${p.id}'">
                                                Activate
                                            </button>
                                        </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
