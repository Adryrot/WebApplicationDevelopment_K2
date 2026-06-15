<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean, com.lab.bean.SubjectBean, com.lab.dao.SubjectDAO, java.util.List"%>
<%
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("../login.html");
        return;
    }
    SubjectDAO dao = new SubjectDAO();
    List<SubjectBean> subjectList = dao.getSubjectsByMatric(user.getMatricNo());
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Registered Subjects</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light container mt-5">
    <div class="card shadow p-4 rounded-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-dark">Subject Records for <%= user.getFullname() %></h2>
            <div>
                <a href="registerSubject.jsp" class="btn btn-success font-semibold shadow-sm">Add New Subject</a>
                <a href="../dashboard.jsp" class="btn btn-outline-secondary font-semibold shadow-sm">Back to Profile</a>
            </div>
        </div>

        <table class="table table-hover align-middle table-bordered text-center">
            <thead class="table-dark">
                <tr>
                    <th>Subject Code</th>
                    <th>Subject Title</th>
                    <th>Execution Core Options</th>
                </tr>
            </thead>
            <tbody>
                <% if(subjectList.isEmpty()) { %>
                    <tr><td colspan="3" class="text-muted p-4">
                    No academic subjects registered under your account profile yet.</td></tr>
                <% } else { 
                    for(SubjectBean sub : subjectList) { %>
                    <tr>
                        <td class="fw-bold"><%= sub.getSubjectCode() %></td>
                        <td class="text-start ps-4"><%= sub.getSubjectName() %></td>
                        <td>
                            <a href="updateSubject.jsp?id=<%= sub.getId() %>" 
                               class="btn btn-sm btn-warning px-3 me-2">Edit</a>
                            <a href="../SubjectServlet?action=delete&id=<%= sub.getId() %>" 
                               onclick="return confirm('Are you sure you want to drop this subject record permanently?')" 
                               class="btn btn-sm btn-danger px-3">Delete</a>
                        </td>
                    </tr>
                <%  } 
                } %>
            </tbody>
        </table>
    </div>
</body>
</html>