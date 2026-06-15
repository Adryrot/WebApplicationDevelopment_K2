<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="lab6.com.Marathon"%>
<%@page import="lab6.com.Database"%>
<%@page import="lab6.com.MarathonDAO"%>
<jsp:useBean id="myMarathon" class="lab6.com.Marathon" scope="request" />
<jsp:setProperty name="myMarathon" property="*" />
<!DOCTYPE html>
<html>
<head>
    <title>Process Marathon Data</title>
</head>
<body>
    <%
    try {
        Database myDB = new Database();
        MarathonDAO object1 = new MarathonDAO();
        
        int result = object1.addDetails(myMarathon);
        
        if (result > 0) {
            System.out.println("\tRecord successfully added into Marathon's table...!");
            out.print("<p>Record with IC No " + myMarathon.getIcno() + " successfully created..!</p>");
            out.print("<p>Details of record are:</p>");
            out.print("<p>Ic No : " + myMarathon.getIcno() + "</p>");
            out.print("<p>Name : " + myMarathon.getName() + "</p>");
            out.print("<p>Category : " + myMarathon.getCategory() + "</p>");
        } else {
            out.print("<p style='color:red;'>Transaction failed. Unable to insert information record.</p>");
        }
        
        System.out.println("Step 5: Close database connection...!");
        myDB.closeConnection();
        
    } catch(Exception e) {
        out.print("<p style='color:red;'>Operational Error: " + e.getMessage() + "</p>");
    }
    %>
</body>
</html>