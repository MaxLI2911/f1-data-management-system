package DAO;

import config.DatabaseConfig;
import model.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT driver_id, name, surname, race_number FROM drivers";

        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                drivers.add(new Driver(
                        rs.getInt("driver_id"),
                        rs.getString("name"),
                        rs.getString("surname"),
                        rs.getInt("race_number")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching drivers: " + e.getMessage());
        }
        return drivers;
    }

    public int getTeamPoints(int teamId, int seasonId) {
        String sql = "{ ? = call fn_get_team_season_points(?, ?) }";
        try (Connection conn = DatabaseConfig.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.registerOutParameter(1, Types.INTEGER);
            cstmt.setInt(2, teamId);
            cstmt.setInt(3, seasonId);
            cstmt.execute();

            return cstmt.getInt(1);
        } catch (SQLException e) {
            System.err.println("Error calling function: " + e.getMessage());
            return 0;
        }
    }

    public boolean exists(int id) {
        String sql = "SELECT 1 FROM drivers WHERE driver_id = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            return false;
        }
    }

    public Integer getAgeAtRace(int driverId, int raceId) {
        String sql = "{ ? = call fn_get_driver_age_at_race(?, ?) }";
        try (Connection conn = DatabaseConfig.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.registerOutParameter(1, Types.INTEGER);
            cstmt.setInt(2, driverId);
            cstmt.setInt(3, raceId);
            cstmt.execute();

            int age = cstmt.getInt(1);
            return cstmt.wasNull() ? null : age;
        } catch (SQLException e) {
            System.err.println("Error calculating age: " + e.getMessage());
            return null;
        }
    }
}