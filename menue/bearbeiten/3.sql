CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |   Fahrzeuge bearbeiten    |
PROMPT =============================
PROMPT ..alle gespeicherten Daten...

DEFINE v_column = ''
DEFINE v_vehicleId = ''
DEFINE v_kennzeichen = ''
DEFINE v_name = ''
DEFINE v_sitzplaetze = ''
DEFINE v_newValue = ''
DEFINE v_userId = ''

COLUMN VereinID FORMAT A8;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT userId AS VereinID, gemeinde, plz, vereinsname, region
    FROM t_verein;

PROMPT=======================================
PROMPT Von welchen Verein moechten Sie die Fahrzeuge bearbeiten?
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

COLUMN FahrzeugNr FORMAT A10;
COLUMN kennzeichen FORMAT A12;
COLUMN name FORMAT A12;
COLUMN sitzplaetze FORMAT 99999;
COLUMN userId FORMAT A11;

SELECT vehicleId AS FahrzeugNr, kennzeichen, name, sitzplaetze
    FROM t_vehicles
    WHERE userId = &v_userId
    ORDER BY vehicleId;
ACCEPT v_vehicleId CHAR PROMPT 'Bitte FahrzeugID eingeben: '
ACCEPT v_column CHAR PROMPT 'Welches Feld moechten Sie bearbeiten? (kennzeichen/name/sitzplaetze) '
ACCEPT v_newValue CHAR PROMPT 'Neuer Wert: '

UPDATE t_vehicles
SET kennzeichen = '&v_newValue'
WHERE vehicleId = &v_vehicleId
AND LOWER('&v_column') = 'kennzeichen';

UPDATE t_vehicles
SET name = '&v_newValue'
WHERE vehicleId = &v_vehicleId
AND LOWER('&v_column') = 'name';

UPDATE t_vehicles
SET sitzplaetze = '&v_newValue'
WHERE vehicleId = &v_vehicleId
AND LOWER('&v_column') = 'sitzplaetze';


PROMPT ======================================
PROMPT .Fahrzeugdaten nach dem aktualisieren.
PROMPT ======================================
SELECT vehicleId,kennzeichen,name,sitzplaetze
    FROM t_vehicles
    WHERE vehicleId = &v_vehicleId;

PROMPT Daten wurden aktualisiert!
PROMPT Zurueck mit Enter
pause
@&pfad\bearbeiten\menue.sql