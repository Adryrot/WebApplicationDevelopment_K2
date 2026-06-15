<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Process Exception Failure</title>
</head>
<body>
    <form id="errorFrm" action="insertStudent.jsp" method="POST">
        <h1>Lab 6 Task 3 Perform creating and retrieving records via JSP page</h1>
        <p style="color:red; font-weight:bold;">An error occurred when inserting record...!</p>
        <blockquote style="background-color:#fee; padding:10px; border-left:5px solid red;">
            <strong>System Root Log Reason Message:</strong><br>
            <%= exception.getMessage() %>
        </blockquote>
        <br>
        <input type="submit" value="Return to Registration Page" />
    </form>
</body>
</html>