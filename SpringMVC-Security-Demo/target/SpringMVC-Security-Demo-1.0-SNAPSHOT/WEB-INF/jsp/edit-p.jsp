<%-- 
    Document   : edit-p
    Created on : Jun 27, 2018, 8:41:20 AM
    Author     : Q.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container">
            <c:if test="${not empty notice}">
                <div class="alert alert-success">
                    <strong>Success !</strong> Save .
                </div>
            </c:if>
            <h1 style="text-align: center">Change Product Information</h1>
            <f:form action="${pageContext.request.contextPath}/editp" commandName="productEntity" enctype="multipart/form-data">
                <f:input path="id" hidden="true"/><br>
                <div  class="form-group">
                    <input type="file" name="file" />
                </div>
                <c:if test="${empty add}">
                    <div  class="form-group">
                        <img src="${pageContext.request.contextPath}/${productEntity.image}" width="75" height="100" />
                    </div>
                </c:if>
                <div class="form-group" hidden="true">
                    <f:label path="image" hidden="true">Image</f:label>
                    <f:input type="text" path="image" cssClass="form-control"  placeholder="Enter Image Link" hidden="true"/>
                </div>
                <div class="form-group">
                    <f:label path="productname">Product name</f:label>
                    <f:input type="text" path="productname" cssClass="form-control"  placeholder="Enter Product name" required="required" minlength="3" maxlength="50"/>
                </div>
                <div class="form-group">
                    <f:label path="price">Price</f:label>
                    <f:input type="number" path="price" cssClass="form-control"  placeholder="Enter Price" required="required" />
                </div>
                <div class="form-group">
                    <f:label path="color">Color</f:label>
                    <f:input type="text" path="color" cssClass="form-control"  placeholder="Enter Color" required="required" minlength="3" maxlength="10"/>
                </div>
                <div class="form-group">
                    <f:label path="description">Description</f:label>
                    <f:input path="description" cssClass="form-control"  placeholder="Enter description" required="required" minlength="3" maxlength="99"/>
                </div>
                <div class="form-group">
                    <f:label path="gender">Gender</f:label>
                    <f:radiobutton path="gender" value="men" /> Men
                    <f:radiobutton path="gender" value="women"/> Women
                </div>
                <div class="form-group">
                    <f:label path="size">Size</f:label>
                    <f:select path="size">
                        <f:option value="S">S</f:option>
                        <f:option value="M">M</f:option>
                        <f:option value="L">L</f:option>
                    </f:select>
                </div>
                <div class="form-group">
                    <f:label path="discount">Discount</f:label>
                    <f:input path="discount" cssClass="form-control" type="number" required="required"/>
                </div>
                <div class="form-group">
                    <f:label path="brand">Brand</f:label>
                    <f:select path="brand" required="required" >
                        <f:option value="activeden">Activeden</f:option>
                        <f:option value="photodune">Photodune</f:option>
                        <f:option value="themeforest">Themeforest</f:option>
                        <f:option value="envato">Envato</f:option>
                    </f:select>
                </div>
                <div class="form-group">
                    <f:label path="featured">Featured</f:label>
                    <f:select path="featured" required="required" >
                        <f:option value="1">True</f:option>
                        <f:option value="0">False</f:option>
                    </f:select>
                </div>
                <div class="form-group">
                    <f:label path="categoryId.id">Category ID</f:label>
                    <f:select path="categoryId.id" required="required" >
                        <f:option value="1">SDress for Girl</f:option>
                        <f:option value="2">Corner</f:option>
                        <f:option value="3">Window</f:option>
                    </f:select>
                </div>
                    <input type="submit" class="btn btn-primary" value="Submit" style="margin-bottom: 10px"/>
            </f:form>
                <div>
                    <button type="button" class="btn btn-default" onclick="location.href='<c:url value="/tablep"/>'">Back</button>
                </div>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
