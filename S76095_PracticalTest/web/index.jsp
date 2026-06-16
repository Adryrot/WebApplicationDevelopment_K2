<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Practical Test</title>
    </head>
    <body>
        <%@ include file="header.html" %>

        <h2><center>Welcome to DriveSmart Integrated Academy</center></h2>
        <p><center>Select a module below:</center></p>

        <div><center>
            <a href="book_session.jsp"style="display:inline-block; padding:10px 14px; 
               background:#000000; color:#fff; text-decoration:none; margin:6px 6px 0 0;">Book a Session</a>
            <a href="ScheduleServlet"style="display:inline-block; padding:10px 14px; 
               background:#000000; color:#fff; text-decoration:none; margin:6px 6px 0 0;">View Schedule</a>
        </center></div>

        <%@ include file="footer.jsp" %>
    </body>
</html>

