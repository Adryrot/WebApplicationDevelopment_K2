<%-- 
    Document   : jstl_database
    Created on : 12 May 2026, 3:28:51 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<body>
    <sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3308/webappdevlab5" user="root" password=""/>
    
    <sql:query dataSource="${dbConnection}" var="result">
        SELECT * FROM users;
    </sql:query>

    <table border="1" cellpadding="8">
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><c:out value="${row.id}" /></td>
                <td><c:out value="${row.username}" /></td>
                <td><c:out value="${row.roles}" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>