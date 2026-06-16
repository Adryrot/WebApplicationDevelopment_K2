<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="model.SessionBean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>DriveSmart</title>
        <style>
            table { border-collapse: collapse; width: 100%; }
            th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
            th { background: #f2f2f2; }
        </style>
    </head>
    <body>
        <%@ include file="header.html" %>

        <h2>Training Session</h2>

        <table>
            <thead>
                <tr>
                    <th>Session ID</th>
                    <th>Student Name</th>
                    <th>Branch Location</th>
                    <th>Lesson Type</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<SessionBean> sessionList = (List<SessionBean>) request.getAttribute("sessionList");
                    if (sessionList != null) {
                        for (SessionBean s : sessionList) {
                %>
                            <tr>
                                <td><%= s.getsession_id() %></td>
                                <td><%= s.getstudent_name() %></td>
                                <td><%= s.getbranch_location() %></td>
                                <td><%= s.getlesson_type() %></td>
                                <td><%= s.getstatus() %></td>
                            </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <%@ include file="footer.jsp" %>
    </body>
</html>

