SET SERVEROUTPUT ON;

DECLARE
    v_age NUMBER;
    v_points NUMBER;
    v_future_race_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- STARTING POSITIVE TESTS (VALID DATA) ');

    -- TEST 1: Calculate Driver Age
    -- Data: Max Verstappen (119) born 30/09/1997 at Australian GP (101) on 16/03/2025
    v_age := fn_get_driver_age_at_race(119, 101);
    DBMS_OUTPUT.PUT_LINE('1. Driver Age Test: Expected 27, Result = ' || v_age);

    -- TEST 2: Calculate Team Points
    -- Data: Red Bull (109) in Season 76 (2025). Sum of 18 + 1 points
    v_points := fn_get_team_season_points(109, 76);
    DBMS_OUTPUT.PUT_LINE('2. Team Points Test: Expected 19, Result = ' || v_points);

    -- TEST 3: Generate Standings Procedure
    -- Prints the championship table for Season 76 (2025)
    DBMS_OUTPUT.PUT_LINE('3. Season Standings Report:');
    pr_generate_standings(76);


    DBMS_OUTPUT.PUT_LINE(CHR(10) || '--- STARTING VALIDATION and TRIGGERS TESTS');

    -- TEST 4: Trigger trg_race_date_season_match
    -- Attempt to insert a 2026 race into a 2025 season (ID 76)
    DBMS_OUTPUT.PUT_LINE('4. Testing Year Match Trigger:');
    BEGIN
        INSERT INTO races (season_id, name, date_hosted, circuit_id)
        VALUES (76, 'Invalid Year Race', TO_DATE('01/01/2026', 'DD/MM/YYYY'), 101);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('   Success: Caught expected error -> ' || SQLERRM);
    END;

    -- TEST 5: Procedure Validation pr_add_race_result
    -- Attempt to add a result with negative points
    DBMS_OUTPUT.PUT_LINE('5. Testing Negative Points Validation:');
    BEGIN
        pr_add_race_result(101, 101, 101, 1, -10, 1);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('   Success: Caught expected error -> ' || SQLERRM);
    END;

    -- TEST 6: Trigger trg_check_race_date_valid
    -- Attempt to add results for a race that is scheduled for the future
    DBMS_OUTPUT.PUT_LINE('6. Testing Future Race Result Trigger:');
    BEGIN
        -- Create a temporary future race (assuming current system date < Dec 2025)
        INSERT INTO races (season_id, name, date_hosted, circuit_id)
        VALUES (76, 'Future GP', TO_DATE('31/12/2025', 'DD/MM/YYYY'), 101)
        RETURNING race_id INTO v_future_race_id;

        INSERT INTO races_results (race_id, driver_id, team_id, finishing_position, points, status_id)
        VALUES (v_future_race_id, 101, 101, 1, 25, 1);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('   Success: Caught expected error -> ' || SQLERRM);
    END;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '--- ALL TESTS COMPLETED');
END;
/