CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |     Fahrzeuge anzeigen      |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_vehicleId = ''

ACCEPT v_vehicleId CHAR PROMPT 'Bitte FahrzeugID eingeben: '

COLUMN FahrzeugNr FORMAT A10;
COLUMN kennzeichen FORMAT A12;
COLUMN name FORMAT A12;
COLUMN sitzplaetze FORMAT 99999;
COLUMN VereinsNr FORMAT A9;

SELECT userId AS VereinsNr, vehicleId AS FahrzeugNr,kennzeichen,name,sitzplaetze
    FROM t_vehicles
    WHERE &v_vehicleId = 0 OR vehicleId = &v_vehicleId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql