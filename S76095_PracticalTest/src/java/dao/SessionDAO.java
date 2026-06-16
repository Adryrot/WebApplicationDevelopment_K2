package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.SessionBean;

public class SessionDAO {

    private String DB_URL = "jdbc:mysql://localhost:3306/drivesmart_db";
    private String DB_USER = "root";
    private String DB_PASSWORD = "";

    public boolean bookSession(SessionBean session) {
        String sql = "INSERT INTO Training_Sessions (student_name, branch_location, lesson_type, status) VALUES (?, ?, ?, ?)";

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, session.getstudent_name());
            preparedStatement.setString(2, session.getbranch_location());
            preparedStatement.setString(3, session.getlesson_type());
            preparedStatement.setString(4, session.getstatus());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<SessionBean> getAllSessions() {
        List<SessionBean> sessions = new ArrayList<SessionBean>();
        String sql = "SELECT * FROM Training_Sessions ORDER BY branch_location ASC";

        try (Connection connection = getConnection();
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery(sql)) {

            while (rs.next()) {
                SessionBean session = new SessionBean();
                session.setsession_id(rs.getInt("session_id"));
                session.setstudent_name(rs.getString("student_name"));
                session.setbranch_location(rs.getString("branch_location"));
                session.setlesson_type(rs.getString("lesson_type"));
                session.setstatus(rs.getString("status"));
                sessions.add(session);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return sessions;
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

}