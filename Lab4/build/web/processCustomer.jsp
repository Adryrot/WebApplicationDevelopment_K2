<%-- 
    Document   : processCustomer
    Created on : 21 Apr 2026, 2:13:13 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Discount Result</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <%
        String cust_no = request.getParameter("customerCode");
        String cust_type = request.getParameter("customerType");
        int quantity = 0;
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (Exception e) { quantity = 0; }

        final double price = 10.0;
        double total = 0;
        String message = "";
        String displayType = cust_type.equals("1") ? "Normal Customer" : "Privilege Customer";

        if (cust_type.equals("1") && quantity > 100) {
            message = "You're entitled to 10% discount";
            total = (quantity * price) * 0.90;
        } else if (cust_type.equals("2") && quantity > 100) {
            message = "You're entitled to 25% discount";
            total = (quantity * price) * 0.75;
        } else {
            message = "You're not entitled to any discount";
            total = quantity * price;
        }
    %>

    <div class="container">
        <h1>Customer Discount Result</h1>
        <div class="card">
            <h2 class="form-title">Transaction Summary</h2>
            
            <div class="result-group">
                <label>Customer Code:</label>
                <p><%= cust_no %></p>
            </div>

            <div class="result-group">
                <label>Quantity:</label>
                <p><%= quantity %></p>
            </div>

            <div class="result-group">
                <label>Customer Type:</label>
                <p><%= displayType %></p>
            </div>

            <div class="result-group">
                <label>Status:</label>
                <p><%= message %></p>
            </div>

            <div class="result-group">
                <label>Total Amount:</label>
                <p>RM <%= String.format("%.2f", total) %></p>
            </div>

            <div class="button-group">
                <button onclick="history.back()" class="btn btn-back">Back</button>
            </div>
        </div>
    </div>
</body>
</html>