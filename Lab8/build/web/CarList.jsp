<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Shop Price Catalog</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="container">
    <h2 class="text-center my-4">Car Inventory Catalog Directory System</h2>
    <div class="mb-3"><a href="${pageContext.request.contextPath}/cars/new" class="btn btn-success">Add New Car Listing</a></div>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>Car ID</th>
                <th>Brand Factory</th>
                <th>Model Series Name</th>
                <th>Cylinder Capacity</th>
                <th>Market Retail Price ($)</th>
                <th>Operational Options</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="car" items="${listCars}">
                <tr>
                    <td>${car.carId}</td>
                    <td>${car.brand}</td>
                    <td>${car.model}</td>
                    <td>${car.cylinder} Valves</td>
                    <td>$ ${car.price}</td>
                    <td>
                        <a href="edit?id=${car.carId}" class="btn btn-sm btn-warning">Modify</a>
                        <a href="delete?id=${car.carId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?');">Remove</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>