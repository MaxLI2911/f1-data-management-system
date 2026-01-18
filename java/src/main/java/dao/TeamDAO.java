package dao;

import config.DatabaseConfig;
import model.Team;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeamDAO {
    public List<Team> getAllTeams() {
        List<Team> teams = new ArrayList<>();
        String sql = "SELECT team_id, name, engine_suplier, principal FROM teams";

        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                teams.add(new Team(
                        rs.getInt("team_id"),
                        rs.getString("name"),
                        rs.getString("engine_suplier"),
                        rs.getString("principal")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error " + e.getMessage());
        }
        return teams;
    }
    public boolean exists(int id) {
        String sql = "SELECT 1 FROM teams WHERE team_id = ?"; //
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