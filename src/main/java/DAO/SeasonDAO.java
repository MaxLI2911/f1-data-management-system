package DAO;

import config.DatabaseConfig;
import model.Season;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeasonDAO {
    public List<Season> getAllSeasons() {
        List<Season> seasons = new ArrayList<>();
        String sql = "SELECT season_id, year, description FROM seasons ORDER BY year DESC";

        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                seasons.add(new Season(
                        rs.getInt("season_id"),
                        rs.getInt("year"),
                        rs.getString("description")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching seasons: " + e.getMessage());
        }
        return seasons;
    }

    public boolean exists(int id) {
        String sql = "SELECT 1 FROM seasons WHERE season_id = ?"; //
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