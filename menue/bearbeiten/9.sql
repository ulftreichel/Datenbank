CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |  Bus Position bearbeiten  |
PROMPT =============================
PROMPT ..alle gespeicherten Vereine...

DEFINE v_column = ''
DEFINE v_newValue = ''
DEFINE v_vehicleId = ''
DEFINE v_userId = ''
DEFINE v_lat = ''
DEFINE v_lon = ''
DEFINE v_timestamp = ''

COLUMN VereinID FORMAT A8;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT userId AS VereinID, gemeinde, plz, vereinsname, region
    FROM t_verein
    ORDER BY userId;

PROMPT=======================================
PROMPT Von welchen Verein moechten Sie die Linien bearbeiten?:
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

COLUMN FahrzeugNr FORMAT A10;
COLUMN kennzeichen FORMAT A12;
COLUMN name FORMAT A12;

SELECT vehicleId AS FahrzeugNr, kennzeichen, name
    FROM t_vehicles
    WHERE userId = &v_userId
    ORDER BY vehicleId;

PROMPT =======================================
PROMPT Von welchem Fahrzeug moechten Sie die Position bearbeiten?
ACCEPT v_vehicleId CHAR PROMPT 'Bitte FahrzeugID eingeben: '
PROMPT =======================================

PROMPT =======================================
PROMPT Welche Spalte möchten Sie bearbeiten?
PROMPT Mögliche Werte: lat, lon, timestamp
ACCEPT v_column CHAR PROMPT 'Spalte (lat/lon/timestamp): '
PROMPT =======================================

PROMPT Denken Sie daran, dass das Dezimaltrennzeichen '.' ist (für lat/lon)
PROMPT und das Zeitformat DD.MM.YYYY HH:MI:SS ist (für timestamp)
ACCEPT v_newValue CHAR PROMPT 'Neuer Wert: '

UPDATE t_bus_position
SET lat = '&v_newValue'
WHERE vehicleId = &v_vehicleId
AND LOWER('&v_column') = 'lat';

UPDATE t_bus_position
SET lon = '&v_newValue'
WHERE vehicleId = &v_vehicleId
AND LOWER('&v_column') = 'lon';

PROMPT =======================================
PROMPT ..Bus-Position nach dem Aktualisieren..
PROMPT =======================================

SELECT vehicleId AS FahrzeugNr, lat, lon, TO_CHAR(timestamp, 'DD.MM.YYYY HH:MI:SS') AS timestamp
    FROM t_bus_position
    WHERE vehicleId = &v_vehicleId;

PROMPT Daten wurden aktualisiert!
PROMPT Zurück mit Enter
PAUSE
@&pfad\bearbeiten\menue.sql