<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="errorStudent.jsp" %>
<jsp:useBean id="myStudent" class="lab6.com.Student" scope="request" />
<jsp:setProperty name="myStudent" property="*" />

<!DOCTYPE html>
<html>
<head>
    <title>Process Student Registration</title>
</head>
<body>
    <%
    int result = 0;
    Connection myConnection = null;
    PreparedStatement myPS = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String myURL = "jdbc:mysql://localhost:3308/CSA3023";
        myConnection = DriverManager.getConnection(myURL, "root", "");

        String sInsertQry = "INSERT INTO student (stuno, stuname, stuprogram) VALUES (?, ?, ?)";
        myPS = myConnection.prepareStatement(sInsertQry);
        
        // Triggers validation checks via getStuno method
        myPS.setString(1, myStudent.getStuno());
        myPS.setString(2, myStudent.getName());
        myPS.setString(3, myStudent.getProgram());

        result = myPS.executeUpdate();

        if (result > 0) {
            System.out.println("\tRecord successfully added into Student's table...!");
            out.print("<p>Record with student no " + myStudent.getStuno() + " successfully created..!</p>");
            out.print("<p>Details of record are;</p>");
            out.print("<p>Student ID : " + myStudent.getStuno() + "</p>");
            out.print("<p>Name : " + myStudent.getName() + "</p>");
            out.print("<p>Program: " + myStudent.getProgram() + "</p>");
        }
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