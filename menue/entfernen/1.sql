CL SCR
SET SERVEROUTPUT ON;

PROMPT ==============================
PROMPT ......Benutzer loeschen.......
PROMPT ==============================
PROMPT .gespeicherte Benutzerdaten:..

DEFINE v_userId = '';

COLUMN userId FORMAT A6;
COLUMN name FORMAT A8;
COLUMN email FORMAT A13;
COLUMN role FORMAT A9;
COLUMN password FORMAT A38;
SET WRAP ON;

SELECT *
    FROM users;

ACCEPT v_userId CHAR PROMPT 'Bitte BenutzerID eingeben, die Sie loeschen moechten: '
PROMPT ==============================
PROMPT Möchten Sie den Benutzer wirklich löschen und alle zugehörigen Daten löschen? (J/N)
PROMPT ==============================
ACCEPT v_confirm CHAR PROMPT 'Antwort: '

BEGIN
    IF '&v_confirm' = 'J' THEN
        DELETE FROM t_bus_position WHERE userId = '&v_userId';
        DELETE FROM t_vehicles WHERE userId = '&v_userId';
        DELETE FROM t_schedules WHERE userId = '&v_userId';
        DELETE FROM t_drivers WHERE userId = '&v_userId';
        DELETE FROM t_lines WHERE userId = '&v_userId';
        DELETE FROM t_stops WHERE userId = '&v_userId';
        DELETE FROM t_ticket_types WHERE userId = '&v_userId';
        DELETE FROM t_verein WHERE userId = '&v_userId';
        DELETE FROM t_passenger WHERE userId = '&v_userId';
        DELETE FROM users WHERE userId = '&v_userId';
        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Der Benutzer und alle zugehoerigen Daten wurden erfolgreich geloescht.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Der Loeschvorgang wurde abgebrochen.');
    END IF;
END;
/

PROMPT Zurück mit Enter
pause

@&pfad\entfernen\menue.sql
