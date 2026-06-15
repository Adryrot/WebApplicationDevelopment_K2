<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lab 6 Task 4</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }
        td, th {
            border: 1px solid #999;
            padding: 0.5rem;
            text-align: left;
        }
        th {
            background: gold;
        }
    </style>
</head>
<body>
    <h1>Lab 6 Task 4: Retrieving record via JSP Page.</h1>
    
    <table>
        <thead>
            <tr>
                <th>Student No</th>
                <th>Name</th>
                <th>Program</th>
            </tr>
        </thead>
        <tbody>
        <%
        Connection myConnection = null;
        Statement myStatement = null;
        ResultSet myResultSet = null;

        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Step 1: MySQL driver loaded...!");

            // Step 2: Establish the connection
            String myURL = "jdbc:mysql://localhost:3308/CSA3023";
            myConnection = DriverManager.getConnection(myURL, "root", "");
            System.out.println("Step 2: Database is connected...!");

            // Step 3: Create a statement object
            myStatement = myConnection.createStatement();

            // Step 4: Perform retrieve record from Student's table
            String myQuery = "SELECT stuno, stuname, stuprogram FROM student";
            myResultSet = myStatement.executeQuery(myQuery);

            // Step 5: Iterative data rendering fetch loop
            while (myResultSet.next()) {
                out.print("<tr>");
                out.print("<td width=\"20%\">" + myResultSet.getString(1) + "</td>");
                out.print("<td width=\"40%\">" + myResultSet.getString(2) + "</td>");
                out.print("<td width=\"40%\">" + myResultSet.getString(3) + "</td>");
                out.print("</tr>");
            }
        } catch (Exception e) {
            out.print("<tr><td colspan='3' style='color:red;'>Data Query Error: " + e.getMessage() + "</td></tr>");
        } finally {
            if (myResultSet != null) try { myResultSet.close(); } catch(SQLException e){}
            if (myStatement != null) try { myStatement.close(); } catch(SQLException e){}
            if (myConnection != null) {
                try {
                    myConnection.close();
                    System.out.println("Step 5: Close database connection...!");
                    System.out.println("Database connection is closed...!");
                } catch(SQLException e){}
            }
        }
        %>
        </tbody>
    </table>
</body>
</html>