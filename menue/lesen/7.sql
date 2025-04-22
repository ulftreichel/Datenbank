CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |    Haltestellen anzeigen    |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_stopId = ''

ACCEPT v_stopId CHAR PROMPT 'Bitte HaltestellenID eingeben: '

COLUMN HaltestellenNr FORMAT A14;
COLUMN name FORMAT A12;
COLUMN Latitude FORMAT 99999.99;
COLUMN Longitude FORMAT 99999.99;
COLUMN VereinsNr FORMAT A9;

SELECT userId AS VereinsNr, stopId AS HaltestellenNr, name, lat AS Latitude, lon AS Longitude
    FROM t_stops
    WHERE &v_stopId = 0 OR stopId = &v_stopId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql