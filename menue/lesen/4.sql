CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF
SET linesize 200

PROMPT ===============================
PROMPT |       Fahrer anzeigen       |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_driverId = ''

ACCEPT v_driverId CHAR PROMPT 'Bitte FahrerID eingeben: '

COLUMN FahrerNr FORMAT A8;
COLUMN name FORMAT A15;
COLUMN email FORMAT A13;
COLUMN webPassword FORMAT A38;
COLUMN VereinsNr FORMAT A9;

SELECT userId AS VereinsNr, driverId AS FahrerNr, name, email, webPassword
    FROM t_drivers
    WHERE &v_driverId = 0 OR driverId = &v_driverId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql