package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Model.Car;

public class CarDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/carshop?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_CAR_SQL = "INSERT INTO CarPricelist (Brand, Model, Cyclinder, Price) VALUES (?, ?, ?, ?);";
    private static final String SELECT_CAR_BY_ID = "SELECT Car_id, Brand, Model, Cyclinder, Price FROM CarPricelist WHERE Car_id = ?;";
    private static final String SELECT_ALL_CARS = "SELECT * FROM CarPricelist;";
    private static final String DELETE_CAR_SQL = "DELETE FROM CarPricelist WHERE Car_id = ?;";
    private static final String UPDATE_CAR_SQL = "UPDATE CarPricelist SET Brand = ?, Model = ?, Cyclinder = ?, Price = ? WHERE Car_id = ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertCar(Car car) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_CAR_SQL)) {
            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setInt(3, car.getCylinder());
            ps.setDouble(4, car.getPrice());
            ps.executeUpdate();
        }
    }

    public Car selectCar(int id) {
        Car car = null;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_CAR_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                car = new Car(
                    rs.getInt("Car_id"),
                    rs.getString("Brand"),
                    rs.getString("Model"),
                    rs.getInt("Cyclinder"),
                    rs.getDouble("Price")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }

    public List<Car> selectAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CARS)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cars.add(new Car(
                    rs.getInt("Car_id"),
                    rs.getString("Brand"),
                    rs.getString("Model"),
                    rs.getInt("Cyclinder"),
                    rs.getDouble("Price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    public boolean deleteCar(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_CAR_SQL)) {
            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_CAR_SQL)) {
            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setInt(3, car.getCylinder());
            ps.setDouble(4, car.getPrice());
            ps.setInt(5, car.getCarId());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}