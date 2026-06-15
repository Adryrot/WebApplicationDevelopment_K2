<%-- 
    Document   : payroll_view
    Created on : 12 May 2026, 3:45:03 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Employee Payroll System</title>
        <style>
            table { width: 60%; border-collapse: collapse; margin-top: 20px; }
            th, td { border: 1px solid black; padding: 10px; text-align: left; }
            th { background-color: #f2f2f2; }
        </style>
    </head>
    <body>
        <h2>Employee Payroll List</h2>
        <table>
            <thead>
                <tr>
                    <th>Emp ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Basic Salary (RM)</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employeeList}" var="emp">
                    <tr>
                        <td>${emp.empId}</td>
                        <td>${emp.name}</td>
                        <td>${emp.department}</td>
                        <td>${emp.basicSalary}</td>
                        <td>
                            <c:choose>
                                <c:when test="${emp.basicSalary >= 3000}">
                                    <strong>Senior</strong>
                                </c:when>
                                <c:otherwise>
                                    Junior
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>