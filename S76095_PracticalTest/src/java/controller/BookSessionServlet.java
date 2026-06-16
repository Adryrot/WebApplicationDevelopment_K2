package controller;

import dao.SessionDAO;
import model.SessionBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookSessionServlet")
public class BookSessionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String student_name = request.getParameter("student_name");
        String branch_location = request.getParameter("branch_location");
        String lesson_type = request.getParameter("lesson_type");

        SessionBean session = new SessionBean();
        session.setstudent_name(student_name);
        session.setbranch_location(branch_location);
        session.setlesson_type(lesson_type);
        session.setstatus("Booked");

        SessionDAO dao = new SessionDAO();
        dao.bookSession(session);

        response.sendRedirect(request.getContextPath() + "/ScheduleServlet");
    }
}