<%@include file="header.jsp" %>
<%
    double finalBmi = Double.parseDouble(request.getParameter("bmiVal"));
    String finalCat = request.getParameter("cat");
%>
<div class="card">
    <h3>Your Result</h3>
    <p>BMI: <%= String.format("%.2f", finalBmi) %></p> <p>Category: <strong><%= finalCat %></strong></p>
</div>
<%@include file="footer.jsp" %>