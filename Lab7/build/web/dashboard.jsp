<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-img {
            width: 160px;
            height: 160px;
            object-fit: cover;
            border: 5px solid #198754; 
        }
    </style>
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow-lg border-0 rounded-4 p-4 p-md-5 text-center" style="max-width: 600px; width: 100%;">
        <div class="card-body">
            
            <% if(user.getBase64Image() != null && !user.getBase64Image().isEmpty()) { %>
                <img src="data:image/jpeg;base64, <%= user.getBase64Image() %>" alt="Profile Picture" 
                     class="profile-img rounded-circle shadow-sm mb-4" />
            <% } else { %>
                <div class="bg-secondary text-white rounded-circle d-inline-flex align-items-center 
                     justify-content-center mb-4" style="width:160px; height:160px;">No Image</div>
            <% } %>

            <h2 class="fw-bold text-dark mb-2">Welcome, <%= user.getFullname() %>!</h2>
            <p class="text-muted fs-5 mb-4">Matric Number: <strong class="text-secondary">
                    <%= user.getMatricNo() %></strong></p>
            
            <div class="d-flex flex-column gap-2">
                <a href="subject/viewSubject.jsp" class="btn btn-success py-2 fw-semibold shadow-sm w-100">
                    Manage My Subjects</a>
                
                <div class="d-flex justify-content-center gap-2 mt-1">
                    <a href="UserServlet?action=logout" class="btn btn-dark px-4 py-2 fw-semibold w-50">Logout</a>
                    <a href="UserServlet?action=delete" 
                       onclick="return confirm('WARNING: Are you sure you want to delete your account permanently?');" 
                       class="btn btn-danger px-4 py-2 fw-semibold w-50">Delete Account</a>
                </div>
            </div>
            
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>