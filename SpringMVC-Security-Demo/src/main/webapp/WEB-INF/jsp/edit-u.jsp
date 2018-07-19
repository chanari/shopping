<%-- 
    Document   : edit-u
    Created on : Jun 27, 2018, 8:41:11 AM
    Author     : Q.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container">
            <h1 style="text-align: center">Change User Information</h1>
            <f:form action="${pageContext.request.contextPath}/editu" commandName="userEntity">
                <f:input path="id" hidden="true"/><br>
                <div class="form-group">
                    <f:label path="roleid">ROLE</f:label>
                    <f:radiobutton path="roleid" value="1" /> User
                    <f:radiobutton path="roleid" value="2"/> Admin
                </div>
                <div class="form-group">
                    <f:label path="enabled">Enable</f:label>
                    <f:radiobutton path="enabled" value="true" /> True
                    <f:radiobutton path="enabled" value="false"/> False
                </div>
                <div class="form-group">
                    <f:label path="firstname">Firstname</f:label>
                    <f:input type="text" path="firstname" cssClass="form-control"  placeholder="Enter Firsname" required="required" minlength="3" maxlength="50"/>
                </div>
                <div class="form-group">
                    <f:label path="lastname">Lastname</f:label>
                    <f:input type="text" path="lastname" cssClass="form-control"  placeholder="Enter Lastname" required="required" minlength="3" maxlength="50"/>
                </div>
                <div class="form-group">
                    <f:label path="email">Email</f:label>
                    <f:input type="email" path="email" cssClass="form-control"  placeholder="Enter Email" required="required"/>
                </div>
                <div class="form-group">
                    <f:label path="phone">Phone number</f:label>
                    <f:input path="phone" type="tel" cssClass="form-control"  placeholder="Enter Phone number" required="required" pattern="(?=.*[0-9]).{10,11}" title="It's should be from 0-9"/>
                </div>
                <div class="form-group">
                    <f:label path="address">Address</f:label>
                    <f:input path="address" cssClass="form-control"  placeholder="Enter Address" required="required" minlength="3" maxlength="99"/>
                </div>
                <div class="form-group">
                    <f:label path="password">Password</f:label>
                    <f:input path="password" cssClass="form-control"  placeholder="Enter Password" required="required" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}" title="Must contain at least Uppercasen, a number and more 8 character"/>
                </div>
                <input type="submit" class="btn btn-primary" value="Submit" style="margin-bottom: 10px"/>
            </f:form>
                <div>
                    <button type="button" class="btn btn-default" onclick="location.href='<c:url value="/tableu"/>'">Back</button>
                </div>
        </div>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
