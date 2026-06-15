package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SubjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SubjectDAO subjectDAO = new SubjectDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect("login.html");
            return;
        }
        
        StudentBean user = (StudentBean) session.getAttribute("loggedUser");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            SubjectBean sub = new SubjectBean();
            sub.setMatricNo(user.getMatricNo());
            sub.setSubjectCode(request.getParameter("subjectCode"));
            sub.setSubjectName(request.getParameter("subjectName"));
            
            subjectDAO.addSubject(sub);
            response.sendRedirect("subject/viewSubject.jsp");
            
        } else if ("update".equals(action)) {
            SubjectBean sub = new SubjectBean();
            sub.setId(Integer.parseInt(request.getParameter("id")));
            sub.setMatricNo(user.getMatricNo());
            sub.setSubjectCode(request.getParameter("subjectCode"));
            sub.setSubjectName(request.getParameter("subjectName"));
            
            subjectDAO.updateSubject(sub);
            response.sendRedirect("subject/viewSubject.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect("login.html");
            return;
        }
        
        StudentBean user = (StudentBean) session.getAttribute("loggedUser");
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            subjectDAO.deleteSubject(id, user.getMatricNo()); 
            response.sendRedirect("subject/viewSubject.jsp");
        }
    }
}