<%-- 
    Document   : processAuthor
    Created on : 17 May 2026, 6:26:10 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="myAuthor" class="lab6.com.Author" scope="request" />
<jsp:setProperty name="myAuthor" property="*" />

<!DOCTYPE html>
<html>
<head>
    <title>Process Author Registration</title>
</head>
<body>
    <h1>Lab 6 Task 1 Perform creating and retrieving records via JSP page</h1>
    
    <%
    int result = 0;
    Connection myConnection = null;
    PreparedStatement myPS = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String myURL = "jdbc:mysql://localhost:3308/CSA3023";
        myConnection = DriverManager.getConnection(myURL, "root", "");

        String sInsertQry = "INSERT INTO Author (authno, name, address, city, state, zip) VALUES(?, ?, ?, ?, ?, ?)";
        myPS = myConnection.prepareStatement(sInsertQry);
        
        myPS.setString(1, myAuthor.getAuthno());
        myPS.setString(2, myAuthor.getName());
        myPS.setString(3, myAuthor.getAddress());
        myPS.setString(4, myAuthor.getCity());
        myPS.setString(5, myAuthor.getState());
        myPS.setString(6, myAuthor.getZip());
        
        result = myPS.executeUpdate();
        
        if (result > 0) {
            out.println("<p>Record successfully added into Author table...!</p>");
            out.print("<p>Record with author no " + myAuthor.getAuthno() + " successfully created..!</p>");
            out.print("<p>Details of record are:</p>");
            out.print("<p>Name: " + myAuthor.getName() + "</p>");
            out.print("<p>Address: " + myAuthor.getAddress() + "</p>");
            out.print("<p>City: " + myAuthor.getCity() + "</p>");
            out.print("<p>State: " + myAuthor.getState() + "</p>");
            out.print("<p>Zip: " + myAuthor.getZip() + "</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Database transaction failed: " + e.getMessage() + "</p>");
    } finally {
        if (myPS != null) try { myPS.close(); } catch(SQLException e){}
        if (myConnection != null) {
            try { 
                myConnection.close(); 
                System.out.println("Step 5: Close database connection...!");
                System.out.println("Database connection is closed...!");
            } catch(SQLException e){}
        }
    }
    %>
</body>
</html>