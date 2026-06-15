package lab6.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static Connection myConnection = null;
    private static final String myURL = "jdbc:mysql://localhost:3308/CSA3023";

    public static Connection getConnection() throws ClassNotFoundException {
        try {
            if (myConnection != null && !myConnection.isClosed()) {
                return myConnection;
            }
            Class.forName("com.mysql.cj.jdbc.Driver");
            myConnection = DriverManager.getConnection(myURL, "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return myConnection;
    }

    public void closeConnection() throws ClassNotFoundException {
        try {
            if (myConnection != null && !myConnection.isClosed()) {
                myConnection.close();
                System.out.println("Database connection is closed...!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}