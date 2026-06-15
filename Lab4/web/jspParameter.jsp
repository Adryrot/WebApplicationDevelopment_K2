<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Using JSP Standard Action</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Using jsp:include and jsp:param to display information</h1>
        
        <div class="card">
            <% 
                // Define subject information [cite: 620-622]
                String sCode = "CSE3023";
                String sSubject = "Web-based Application Development";
                String sCredit = "3(2+1)";
            %>

            <h2 class="form-title">Calling SubjectInfo.Jsp Page</h2>
            
            <jsp:include page="subjectInfo.jsp" flush="true">
                <jsp:param name="code" value="<%= sCode %>" />
                <jsp:param name="subject" value="<%= sSubject %>" />
                <jsp:param name="credit" value="<%= sCredit %>" />
            </jsp:include>
        </div>
    </div>
</body>
</html>