<%@include file="header.jsp" %>
<div class="card">
    <h3>BMI Calculator</h3>
    <form action="processBMI.jsp" method="POST">
        Weight (kg): <input type="number" name="weight" step="0.1" required><br><br>
        Height (m): <input type="number" name="height" step="0.01" required><br><br>
        <button type="submit">Calculate BMI</button>
    </form>
</div>
<%@include file="footer.jsp" %>