<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>DriveSmart - Book Session</title>
    </head>
    <body>
        <%@ include file="header.html" %>

        <h2>Book a Driving Training Session</h2>

        <form method="POST" action="BookSessionServlet">
            <div style="margin-bottom: 10px;">
                <label>Student Name:</label><br/>
                <input type="text" name="student_name" required />
            </div>

            <div style="margin-bottom: 10px;">
                <label>Branch Location:</label><br/>
                <input type="text" name="branch_location" placeholder="e.g., Kuala Lumpur" required />
            </div>

            <div style="margin-bottom: 10px;">
                <label>Lesson Type:</label><br/>
                <select name="lesson_type" required>
                    <option value="Manual Car">Manual Car</option>
                    <option value="Automatic Car">Automatic Car</option>
                    <option value="Motorcycle">Motorcycle</option>
                </select>
            </div>

            <button type="submit">Book Session</button>
        </form>

        <%@ include file="footer.jsp" %>
    </body>
</html>

