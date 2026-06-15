<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <div style="text-align: center; margin-top: 50px;">
        <h1 style="color: red;">An Application Error Occurred</h1>
        <h2>Error Message: <%= exception != null ? exception.getMessage() : "Unknown Exception Error Details" %></h2>
        <p><a href="list">Return back to Employee List Dashboard</a></p>
    </div>
</body>
</html>