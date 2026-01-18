SET SERVEROUTPUT ON;
SET PAGESIZE 100;

DECLARE
    v_test_age NUMBER;
    v_test_pts NUMBER;
    v_new_race_id NUMBER;
    v_future_season_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Driver Performance Analysis');
    -- Joins 4 tables: drivers, qualifying, results, and teams to calculate "Positions Gained"
    FOR r IN (
        SELECT 
            d.surname || ', ' || d.name AS driver_name,
            t.name AS team_name,
            rq.starting_pos AS grid,
            rr.finishing_position AS finish,
            (rq.starting_pos - rr.finishing_position) AS positions_gained
        FROM drivers d
        JOIN races_qualifying rq ON d.driver_id = rq.driver_id
        JOIN races_results rr ON d.driver_id = rr.driver_id AND rq.race_id = rr.race_id
        JOIN teams t ON rr.team_id = t.team_id
        WHERE rr.race_id = 101 -- Australian GP
        ORDER BY rr.finishing_position ASC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Driver: ' || r.driver_name || ' | Team: ' || r.team_name || 
                             ' | Grid: ' || r.grid || ' | Finish: ' || r.finish || 
                             ' | Gained: ' || r.positions_gained);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '--- Engine Supplier Standings) ---');
    -- Aggregates points by engine supplier using JOIN and GROUP BY
    FOR r IN (
        SELECT 
            t.engine_suplier,
            COUNT(DISTINCT t.team_id) AS team_count,
            SUM(rr.points) AS total_points
        FROM teams t
        JOIN races_results rr ON t.team_id = rr.team_id
        GROUP BY t.engine_suplier
        ORDER BY total_points DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Supplier: ' || r.engine_suplier || ' | Teams: ' || r.team_count || 
                             ' | Total Pts: ' || r.total_points);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'FUNCTION and PROCEDURE TESTING');
    
    -- Test fn_get_driver_age_at_race for Max Verstappen (119)
    v_test_age := fn_get_driver_age_at_race(119, 101);
    DBMS_OUTPUT.PUT_LINE('1. Age Test (ID 119 at Race 101): ' || v_test_age);

    -- Test fn_get_team_season_points for Red Bull (109) in Season 76
    v_test_pts := fn_get_team_season_points(109, 76);
    DBMS_OUTPUT.PUT_LINE('2. Team Points Test (Red Bull, Season 76): ' || v_test_pts);

    -- Test pr_generate_standings procedure
    DBMS_OUTPUT.PUT_LINE('3. Procedure Test (Full Standings):');
    pr_generate_standings(76);

    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'TRIGGER and VALIDATION TESTS');

    -- Test: trg_race_date_season_match (Year Mismatch)
    DBMS_OUTPUT.PUT_LINE('4. Testing Race/Season Year Match Trigger:');
    BEGIN
        -- Attempt to add a 2026 race to a 2025 season (ID 76)
        INSERT INTO races (season_id, name, date_hosted, circuit_id)
        VALUES (76, 'Invalid Year GP', TO_DATE('01/01/2026', 'DD/MM/YYYY'), 101);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('   Success: Caught mismatch -> ' || SQLERRM);
    END;

    -- Test: trg_check_race_date_valid (Future Results)
    DBMS_OUTPUT.PUT_LINE('5. Testing Future Race Result Trigger:');
    BEGIN
        -- Create a new season and race for 2026
        INSERT INTO seasons (year, description) VALUES (2026, 'Future Season') RETURNING season_id INTO v_future_season_id;
        INSERT INTO races (season_id, name, date_hosted, circuit_id)
        VALUES (v_future_season_id, 'Future GP', TO_DATE('31/12/2026', 'DD/MM/YYYY'), 101)
        RETURNING race_id INTO v_new_race_id;

        -- Attempt to add a result for a race that hasn't happened yet
        INSERT INTO races_results (race_id, driver_id, team_id, finishing_position, points, status_id)
        VALUES (v_new_race_id, 101, 101, 1, 25, 1);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('   Success: Blocked future result -> ' || SQLERRM);
    END;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '--- ALL EXTENDED TESTS COMPLETED ---');
    ROLLBACK; 
END;
/