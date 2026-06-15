<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Account Registration</title>
</head>
<body>
    <%
    String userParam = request.getParameter("username");
    String passParam = request.getParameter("password");
    String firstParam = request.getParameter("firstname");
    String lastParam = request.getParameter("lastname");

    if (userParam == null || passParam == null) {
        out.print("<p style='color:red;'>Missing parameters. Form submission incomplete.</p>");
    } else {
        String dbURL = "jdbc:mysql://localhost:3308/CSA3023";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbURL, "root", "")) {
                String insSQL = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
                try (PreparedStatement pstmt = conn.prepareStatement(insSQL)) {
                    pstmt.setString(1, userParam);
                    pstmt.setString(2, passParam);
                    pstmt.setString(3, firstParam);
                    pstmt.setString(4, lastParam);
                    
                    int rows = pstmt.executeUpdate();
                    if (rows > 0) {
                        out.print("<h3>Registration successful for account profile: " + userParam + "</h3>");
                        out.print("<p><a href='login.jsp'>Proceed to Account Login Page</a></p>");
                    }
                }
            }
        } catch (Exception e) {
            out.print("<h3 style='color:red;'>Database Registration Error: " + e.getMessage() + "</h3>");
            out.print("<p><a href='insertUser.html'>Try Again</a></p>");
        }
    }
    %>
</body>
</html>