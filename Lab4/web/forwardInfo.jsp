<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forwarded Information</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <%
        String name = request.getParameter("uname");
        String email = request.getParameter("email");
        String nationality = request.getParameter("nationality");
        String background = request.getParameter("background");
    %>

    <div class="container">
        <h1>Using jsp:forward to display user info</h1>
        
        <div class="card">
            <h2 class="form-title">Forwarded Info</h2>
            
            <div class="result-group">
                <p><strong>Name:</strong> <%= name %></p>
            </div>
            
            <div class="result-group">
                <p><strong>Email:</strong> <%= email %></p>
            </div>
            
            <div class="result-group">
                <p><strong>Nationality:</strong> <%= nationality %></p>
            </div>
            
            <div class="result-group">
                <p><strong>Background:</strong> <%= background %></p>
            </div>
            
            <div class="button-group">
                <button onclick="history.back()" class="btn btn-back">Back</button>
            </div>
        </div>
    </div>
</body>
</html>