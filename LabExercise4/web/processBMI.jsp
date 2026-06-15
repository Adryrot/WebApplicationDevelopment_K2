<%
    double weight = Double.parseDouble(request.getParameter("weight"));
    double height = Double.parseDouble(request.getParameter("height"));
    
    if (height > 0) {
        double bmi = weight / (height * height);
        String category = "";
        if (bmi < 18.5) category = "Underweight";
        else if (bmi <= 25) category = "Normal";
        else category = "Overweight";
%>
        <jsp:forward page="resultBMI.jsp">
            <jsp:param name="bmiVal" value="<%= String.valueOf(bmi) %>" />
            <jsp:param name="cat" value="<%= category %>" />
        </jsp:forward>
<%
    } else {
        out.println("Error: Height cannot be zero!");
    }
%>