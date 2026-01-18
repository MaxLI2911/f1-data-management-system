package DAO;

import config.DatabaseConfig;
import java.sql.*;

public class RaceDAO {
    public boolean exists(int id) {
        String sql = "SELECT 1 FROM races WHERE race_id = ?";
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
}