<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Data Form Setup</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="container col-md-6 mt-5">
    <div class="card">
        <div class="card-body">
            <h2><c:out value="${car != null ? 'Edit Current Car Record Data' : 'Add New Car Inventory Entity'}" /></h2>
            <form action="${car != null ? 'update' : 'insert'}" method="post">
                <c:if test="${car != null}">
                    <input type="hidden" name="carId" value="${car.carId}" />
                </c:if>
                <div class="form-group">
                    <label>Brand Name</label>
                    <input type="text" name="brand" class="form-control" value="${car.brand}" required />
                </div>
                <div class="form-group">
                    <label>Model Version</label>
                    <input type="text" name="model" class="form-control" value="${car.model}" required />
                </div>
                <div class="form-group">
                    <label>Cylinder Displacement Value</label>
                    <input type="number" name="cylinder" class="form-control" value="${car.cylinder}" required />
                </div>
                <div class="form-group">
                    <label>Base Price Cost ($)</label>
                    <input type="number" step="0.01" name="price" class="form-control" value="${car.price}" required />
                </div>
                <button type="submit" class="btn btn-primary">Save Car Entry</button>
                <a href="list" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</body>
</html>