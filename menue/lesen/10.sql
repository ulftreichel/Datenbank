CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF
SET linesize 200

PROMPT ===============================
PROMPT |     Passagiere anzeigen     |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_passengerId = ''

ACCEPT v_passengerId CHAR PROMPT 'Bitte PassagierId eingeben: '

COLUMN passengerId FORMAT A3;
COLUMN TicketName FORMAT A11;
COLUMN timestamp FORMAT A20;
COLUMN HaltstellenName FORMAT A15;
COLUMN LinienName FORMAT A10;
COLUMN FhzName FORMAT A12;
COLUMN Verein FORMAT A10;

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
JOIN t_verein a ON p.userId = a.userId
WHERE &v_passengerId = 0 OR p.passengerId = &v_passengerId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql