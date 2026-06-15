<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.URLEncoder"%>
<%
    String userIn = request.getParameter("username");
    String passIn = request.getParameter("password");

    String dbURL = "jdbc:mysql://localhost:3308/CSA3023";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        try (Connection conn = DriverManager.getConnection(dbURL, "root", "")) {
            String selSQL = "SELECT firstname, lastname FROM userprofile "
            + "WHERE username = ? AND password = ?";
            
            try (PreparedStatement pstmt = conn.prepareStatement(selSQL)) {
                pstmt.setString(1, userIn);
                pstmt.setString(2, passIn);
                
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        session.setAttribute("user", userIn);
                        session.setAttribute("fname", rs.getString("firstname"));
                        session.setAttribute("lname", rs.getString("lastname"));
                        response.sendRedirect("main.jsp");
                    } else {
                        response.sendRedirect("login.jsp?msg=" + URLEncoder.encode
                        ("Invalid username or password..!", "UTF-8"));
                    }
                }
            }
        }
    } catch (Exception e) {
        response.sendRedirect("login.jsp?msg=" + URLEncoder.encode
        ("Critical DB System Failure: " + e.getMessage(), "UTF-8"));
    }
%>