<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <a href="#" class="navbar-brand">Employee Management App</a>
            <ul class="navbar-nav">
                <li><a href="${pageContext.request.contextPath}/list" class="nav-link">Employees</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container">
        <h3 class="text-center">List of Employees</h3>
        <hr>
        <div class="text-left mb-3">
            <a href="${pageContext.request.contextPath}/new" class="btn btn-success">Add New Employee</a>
        </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Position</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${listEmployee}">
                    <tr>
                        <td><c:out value="${employee.id}" /></td>
                        <td><c:out value="${employee.name}" /></td>
                        <td><c:out value="${employee.email}" /></td>
                        <td><c:out value="${employee.position}" /></td>
                        <td>
                            <a href="edit?id=<c:out value='${employee.id}' />" class="btn btn-sm btn-primary">Edit</a>
                            <a href="delete?id=<c:out value='${employee.id}' />" 
                               class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>