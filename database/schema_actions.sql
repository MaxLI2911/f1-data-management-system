-- Trigger checking if the year of the race matches the season year
CREATE OR REPLACE TRIGGER trg_race_date_season_match
BEFORE INSERT OR UPDATE ON races
FOR EACH ROW
DECLARE
    v_season_year NUMBER(4);
BEGIN
    SELECT year INTO v_season_year
    FROM seasons
    WHERE season_id = :NEW.season_id;

    IF EXTRACT(YEAR FROM :NEW.date_hosted) != v_season_year THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: Year of the race date must match season year!');
    END IF;
END;
/

-- Trigger checking if a result is being added for a race that did not happen yet
CREATE OR REPLACE TRIGGER trg_check_race_date_valid
BEFORE INSERT OR UPDATE ON races_results
FOR EACH ROW
DECLARE
    v_race_date DATE;
BEGIN
    SELECT date_hosted INTO v_race_date
    FROM races
    WHERE race_id = :NEW.race_id;

    IF v_race_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20002, 'Error: Can not enter results for a race that has not happened!');
    END IF;
END;
/

-- Function calculating driver's age at a certain race
CREATE OR REPLACE FUNCTION fn_get_driver_age_at_race(
    p_driver_id IN NUMBER,
    p_race_id IN NUMBER
) RETURN NUMBER IS
    v_birth_date DATE;
    v_race_date DATE;
    v_age NUMBER;
BEGIN
    SELECT birth_date INTO v_birth_date FROM drivers WHERE driver_id = p_driver_id;

    SELECT date_hosted INTO v_race_date FROM races WHERE race_id = p_race_id;

    v_age := FLOOR(MONTHS_BETWEEN(v_race_date, v_birth_date) / 12);

    RETURN v_age;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

-- Function calculating total points in a given season for a team
CREATE OR REPLACE FUNCTION fn_get_team_season_points(
    p_team_id IN NUMBER,
    p_season_id IN NUMBER
) RETURN NUMBER IS
    v_total_points NUMBER := 0;
BEGIN
    SELECT NVL(SUM(rr.points), 0)
    INTO v_total_points
    FROM races_results rr
    JOIN races r ON rr.race_id = r.race_id
    WHERE rr.team_id = p_team_id
      AND r.season_id = p_season_id;

    RETURN v_total_points;
END;
/

-- Procedure generating general standings for a given season
CREATE OR REPLACE PROCEDURE pr_generate_standings(p_season_id IN NUMBER) IS
    CURSOR c_standings IS
        SELECT d.name || ' ' || d.surname AS full_name,
               NVL(SUM(rr.points), 0) AS total_points
        FROM drivers d
        JOIN races_results rr ON d.driver_id = rr.driver_id
        JOIN races r ON rr.race_id = r.race_id
        WHERE r.season_id = p_season_id
        GROUP BY d.driver_id, d.name, d.surname
        ORDER BY total_points DESC;

    v_rec c_standings%ROWTYPE;
    v_position NUMBER := 1;
    v_season_year seasons.year%TYPE;
BEGIN
    SELECT year INTO v_season_year FROM seasons
    WHERE season_id = p_season_id;
    DBMS_OUTPUT.PUT_LINE('--- ' || v_season_year || ' GENERAL STANDINGS ---');

    OPEN c_standings;
    LOOP
        FETCH c_standings INTO v_rec;
        EXIT WHEN c_standings%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_position || '. ' || v_rec.full_name || ' - ' || v_rec.total_points || ' pts');
        v_position := v_position + 1;
    END LOOP;
    CLOSE c_standings;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        IF c_standings%ISOPEN THEN CLOSE c_standings; END IF;
END;
/

-- Procedure which allows adding a race result
CREATE OR REPLACE PROCEDURE pr_add_race_result(
    p_race_id IN NUMBER,
    p_driver_id IN NUMBER,
    p_team_id IN NUMBER,
    p_position IN NUMBER,
    p_points IN NUMBER,
    p_status_id IN NUMBER
) IS
BEGIN
    IF p_points < 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Points cannot be negative//!');
    END IF;

    IF p_position < 1 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Position must be greater than 0!');
    END IF;

    INSERT INTO races_results (race_id, driver_id, team_id, finishing_position, points, status_id)
    VALUES (p_race_id, p_driver_id, p_team_id, p_position, p_points, p_status_id);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Added result for driver ID: ' || p_driver_id);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: This driver has a result in this race already.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/