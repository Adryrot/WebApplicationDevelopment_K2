<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login Interface</title>
</head>
<body>
    <h2>System Secure Portal Access</h2>
    
    <% 
    String msg = request.getParameter("msg");
    if(msg != null) { 
    %>
        <p style="color:red; font-weight:bold;"><%= msg %></p>
    <% 
    } 
    %>

    <form action="doLogin.jsp" method="POST">
        <table border="0">
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username" required /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required /></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" value="Authenticate Login Credentials" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>