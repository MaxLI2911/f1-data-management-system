import DAO.*;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class DAOTest {
    TeamDAO teamDAO = new TeamDAO();
    DriverDAO driverDAO = new DriverDAO();

    @Test
    void testTeamExists() {
        assertTrue(teamDAO.exists(109), "Team 109 should exist in DB");
        assertFalse(teamDAO.exists(999), "Team 999 should not exist");
    }

    @Test
    void testGetTeamPointsFunction() {
        int points = driverDAO.getTeamPoints(109, 76);
        assertEquals(19, points, "Team 109 should have 19 points in season 76");
    }

    @Test
    void testDriverAgeFunction() {
        Integer age = driverDAO.getAgeAtRace(119, 101);
        assertNotNull(age);
        assertEquals(27, age, "Verstappen should be 27 at the 2025 Australian GP");
    }
}