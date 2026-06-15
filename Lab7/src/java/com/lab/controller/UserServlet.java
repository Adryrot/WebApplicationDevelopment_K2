package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.dao.StudentDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // Max 16 MB required for image upload
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            // 1. HANDLE REGISTRATION
            StudentBean newStudent = new StudentBean();
            newStudent.setMatricNo(request.getParameter("matricNo"));
            newStudent.setFullname(request.getParameter("fullname"));
            newStudent.setPassword(request.getParameter("password"));

            InputStream inputStream = null;
            Part filePart = request.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
            }

            boolean isSuccess = studentDAO.registerStudent(newStudent, inputStream);
            if (isSuccess) {
                response.getWriter().println("<h3>Registration Successful!</h3>");
                response.getWriter().println("<a href='login.html'>Login here</a>");
            } else {
                response.getWriter().println("<h3>Registration Failed!</h3>");
                response.getWriter().println("<a href='register.html'>Try Again</a>");
            }
            
        } else if ("login".equals(action)) {
            // 2. HANDLE LOGIN
            String matric = request.getParameter("matricNo");
            String pass = request.getParameter("password");
            
            StudentBean student = studentDAO.loginStudent(matric, pass);
            if (student != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedUser", student);
                response.sendRedirect("dashboard.jsp");
            } else {
                response.getWriter().println("<h3>Invalid Credentials!</h3>");
                response.getWriter().println("<a href='login.html'>Try Again</a>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if ("logout".equals(action)) {
            // 3. HANDLE LOGOUT
            if (session != null) {
                session.invalidate(); // Destroy session
            }
            response.sendRedirect("login.html");
            
        } else if ("delete".equals(action)) {
            // 4. HANDLE DELETE ACCOUNT
            if (session != null && session.getAttribute("loggedUser") != null) {
                StudentBean user = (StudentBean) session.getAttribute("loggedUser");
                studentDAO.deleteStudent(user.getMatricNo());
                session.invalidate(); // Destroy session after account deletion
            }
            response.sendRedirect("register.html");
        }
    }
}