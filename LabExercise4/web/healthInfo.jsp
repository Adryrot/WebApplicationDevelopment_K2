<%@page import="java.util.ArrayList" %>
<%@include file="header.jsp" %>
<%
    ArrayList<String> levels = new ArrayList<>();
    levels.add("Underweight (< 18.5)");
    levels.add("Normal (18.5 - 25.0)");
    levels.add("Overweight (> 25.0)");
%>
<h3>BMI Categories</h3>
<table border="1">
    <tr><th>Category Range</th></tr>
    <% for(String s : levels) { %>
        <tr><td><%= s %></td></tr> <% } %>
</table>
<%@include file="footer.jsp" %>