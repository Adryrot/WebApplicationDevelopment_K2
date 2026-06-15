<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Account Hub Panel Dashboard</title>
</head>
<body>
    <%
    String user = (String) session.getAttribute("user");
    String fname = (String) session.getAttribute("fname");
    String lname = (String) session.getAttribute("lname");

    if (user == null) {
        response.sendRedirect("login.jsp?msg=Access denied. Please authenticate first.");
    } else {
    %>
        <h1>Welcome Back to the Portal Network Dashboard Interface Hub</h1>
        <fieldset style="width: 400px; padding:20px; border: 2px solid gold;">
            <legend><strong>Authenticated User Profile Tokens</strong></legend>
            <p><strong>System Identification Username:</strong> <%= user %></p>
            <p><strong>First Name Display Alias:</strong> <%= fname %></p>
            <p><strong>Last Name Structural Alias:</strong> <%= lname %></p>
        </fieldset>
        <br>
        <p><a href="login.jsp">Click Here to Safely Log Out of Session Profile Workspace Instance</a></p>
    <% 
    } 
    %>
</body>
</html>