CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |    Bus Position anzeigen    |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_vehicleId = ''

ACCEPT v_vehicleId CHAR PROMPT 'Bitte BusID eingeben: '

COLUMN FahrzeugNr FORMAT A10;
COLUMN lat FORMAT 99999.99;
COLUMN lon FORMAT 99999.99;
COLUMN timestamp FORMAT A20;
COLUMN VereinsNr FORMAT A6;

SELECT vehicleId AS FahrzeugNr, lat, lon, TO_CHAR(timestamp, 'DD.MM.YYYY HH:MI:SS') AS timestamp
FROM t_bus_position
WHERE &v_vehicleId = 0 OR vehicleId = &v_vehicleId;

PROMPT Zurueck mit Enter
PAUSE
@&pfad\lesen\menue.sql
