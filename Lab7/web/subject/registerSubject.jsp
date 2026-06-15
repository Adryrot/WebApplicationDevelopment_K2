<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");
    if (user == null) { response.sendRedirect("../login.html"); return; }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Subject Entry</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light container d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card p-4 shadow-lg rounded-4" style="max-width: 500px; width: 100%;">
        <h3 class="fw-bold text-center text-success mb-3">Register New Subject</h3>
        <form action="../SubjectServlet" method="POST">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label class="form-label fw-semibold">Subject Code:</label>
                <input type="text" name="subjectCode" class="form-control" placeholder="e.g. CSF3113" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-semibold">Subject Name Title:</label>
                <input type="text" name="subjectName" class="form-control" 
                       placeholder="e.g. Web-Based Application Development" required>
            </div>
            <button type="submit" class="btn btn-success w-100 py-2 fw-semibold shadow-sm">
                Save Record Entry</button>
            <a href="viewSubject.jsp" 
               class="btn btn-link w-100 text-center mt-2 text-decoration-none text-muted">Cancel</a>
        </form>
    </div>
</body>
</html>