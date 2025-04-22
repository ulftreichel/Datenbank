CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |      Fahrplan anzeigen      |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_stopId = ''

ACCEPT v_stopId CHAR PROMPT 'Bitte FahrplanID eingeben: '

COLUMN HaltestellenNr FORMAT A14;
COLUMN Ankunft FORMAT 99999.99;
COLUMN Abfahrt FORMAT 99999.99;
COLUMN VereinsNr FORMAT A9;
COLUMN LinienId FORMAT A8;

SELECT userId AS VereinsNr, stopId AS HaltestellenNr, lineId AS LinienId arrival AS Ankunft, departure AS Abfahrt
    FROM t_schedules
    WHERE &v_stopId = 0 OR stopId = &v_stopId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql