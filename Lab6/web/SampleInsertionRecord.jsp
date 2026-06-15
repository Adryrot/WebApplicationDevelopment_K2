<%-- 
    Document   : SampleInsertionRecord
    Created on : 17 May 2026, 5:44:40 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lab 6 - Task 1</title>
</head>
<body>
    <h1>Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP's page.</h1>
    
    <%
    int result = 0;
    Connection myConnection = null;
    PreparedStatement myPS = null;

    try {
        // Step 1: Load JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        out.println("Step 1: MySQL driver loaded...!<br>");

        // Step 2: Establish the connection
        String myURL = "jdbc:mysql://localhost:3308/CSA3023";
        myConnection = DriverManager.getConnection(myURL, "root", "");
        out.println("Step 2: Database is connected...!<br>");

        // Step 3: Create a PreparedStatement object
        String sInsertQry = "INSERT INTO FirstTable (NAME) VALUES(?)";
        myPS = myConnection.prepareStatement(sInsertQry);
        out.println("Step 3: Prepared Statements created...!<br>");

        // Step 4: Perform insertion of record
        out.println("Step 4: Perform insertion of record...!<br>");
        String name = "Welcome to access MySQL database with JSP.....!";
        myPS.setString(1, name);
        
        result = myPS.executeUpdate();
        
        if (result > 0) {
            out.println("Step 5: Close database connection...!<br>");
            out.println("Database connection is closed...!<br>");
            out.print("<p>The record: (" + name + ") is successfully created..!</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error occurred: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        // Ensuring connection closure
        if (myPS != null) try { myPS.close(); } catch(SQLException e){}
        if (myConnection != null) {
            try { 
                myConnection.close(); 
            } catch(SQLException e){}
        }
    }
    %>
</body>
</html>