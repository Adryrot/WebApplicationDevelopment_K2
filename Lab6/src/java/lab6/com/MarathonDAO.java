package lab6.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MarathonDAO {
    private Connection connection;
    private int result = 0;

    public MarathonDAO() throws ClassNotFoundException {
        this.connection = Database.getConnection();
    }

    public int addDetails(Marathon marathon) {
        PreparedStatement preparedStatement = null;
        try {
            String mySQL = "INSERT INTO marathon (icno, name, category) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(mySQL);
            
            System.out.println("IC No = " + marathon.getIcno());
            System.out.println("Name = " + marathon.getName());
            System.out.println("Category = " + marathon.getCategory());
            
            preparedStatement.setString(1, marathon.getIcno());
            preparedStatement.setString(2, marathon.getName());
            preparedStatement.setString(3, marathon.getCategory());
            
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null) {
                try { preparedStatement.close(); } catch (SQLException e) {}
            }
        }
        return result;
    }
}