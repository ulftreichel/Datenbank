CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF
SET linesize 200
PROMPT =============================
PROMPT |   Passagier entfernen    |
PROMPT =============================

DEFINE v_passengerId = ''

COLUMN passengerId FORMAT A10;
COLUMN TicketName FORMAT A15;
COLUMN timestamp FORMAT A20;
COLUMN HaltstellenName FORMAT A15;
COLUMN LinienName FORMAT A15;
COLUMN FhzName FORMAT A15;
COLUMN Verein FORMAT A15;

PROMPT Verfuegbare Passagiere:
SELECT 
    p.passengerId, 
    t.name AS TicketName, 
    TO_CHAR(p.timestamp, 'DD.MM.YYYY HH:MI:SS') AS timestamp,
    s.name AS HaltstellenName, 
    l.name AS LinienName, 
    v.name AS FhzName, 
    a.vereinsname AS Verein
FROM t_passengers p
JOIN t_ticket_types t ON p.tickettypeId = t.tickettypeId
JOIN t_stops s ON p.stopId = s.stopId
JOIN t_lines l ON p.lineId = l.lineId
JOIN t_vehicles v ON p.vehicleId = v.vehicleId
JOIN t_verein a ON p.userId = a.userId;

PROMPT ===============================
ACCEPT v_passengerId CHAR PROMPT 'Bitte die PassengerId des zu entfernenden Passagiers eingeben: '
PROMPT ===============================

DELETE FROM t_passengers
WHERE passengerId = &v_passengerId;
COMMIT;

PROMPT ===============================
PROMPT Passagier mit ID &v_passengerId wurde entfernt.
PROMPT ===============================

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql