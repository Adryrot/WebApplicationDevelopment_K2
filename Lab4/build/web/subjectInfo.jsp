<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Subject Information</title>
</head>
<body>
    <div class="result-box">
        <h3 class="form-title">Subject Details</h3>
        
        <p><strong>Code:</strong> <%= request.getParameter("code") %></p>
        <p><strong>Subject:</strong> <%= request.getParameter("subject") %></p>
        <p><strong>Credit:</strong> <%= request.getParameter("credit") %></p>
    </div>
</body>
</html>