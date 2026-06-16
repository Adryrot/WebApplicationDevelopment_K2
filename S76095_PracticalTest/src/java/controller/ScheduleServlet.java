package controller;

import dao.SessionDAO;
import model.SessionBean;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SessionDAO dao = new SessionDAO();
        List<SessionBean> list = dao.getAllSessions();

        request.setAttribute("sessionList", list);
        request.getRequestDispatcher("schedule.jsp").forward(request, response);
    }
}

