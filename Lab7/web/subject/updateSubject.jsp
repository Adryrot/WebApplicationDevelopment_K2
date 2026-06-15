<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean, com.lab.bean.SubjectBean, com.lab.dao.SubjectDAO"%>
<%
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");
    if (user == null) { response.sendRedirect("../login.html"); return; }
    
    int id = Integer.parseInt(request.getParameter("id"));
    SubjectDAO dao = new SubjectDAO();
    SubjectBean sub = dao.getSubjectById(id);
    if(sub == null || !sub.getMatricNo().equals(user.getMatricNo())) {
        response.sendRedirect("viewSubjects.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Subject Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light container d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card p-4 shadow-lg rounded-4" style="max-width: 500px; width: 100%;">
        <h3 class="fw-bold text-center text-warning mb-3">Update Subject Details</h3>
        <form action="../SubjectServlet" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= sub.getId() %>">
            <div class="mb-3">
                <label class="form-label fw-semibold">Subject Code:</label>
                <input type="text" name="subjectCode" value="<%= sub.getSubjectCode() %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-semibold">Subject Title:</label>
                <input type="text" name="subjectName" value="<%= sub.getSubjectName() %>" class="form-control" required>
            </div>
            <button type="submit" 
                    class="btn btn-warning w-100 py-2 fw-semibold text-white shadow-sm">Apply Modifications</button>
            <a href="viewSubject.jsp" 
               class="btn btn-link w-100 text-center mt-2 text-decoration-none text-muted">Cancel Changes</a>
        </form>
    </div>
</body>
</html>