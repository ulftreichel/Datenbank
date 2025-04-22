CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ================================
PROMPT |   Bus Position hinzufuegen   |
PROMPT ================================

DEFINE v_vehicleId = ''
DEFINE v_lat = ''
DEFINE v_lon = ''
DEFINE v_timestamp = ''
DEFINE v_userId = ''

COLUMN VereinsNr FORMAT A9;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT userId AS VereinsNr, gemeinde, plz, vereinsname, region
    FROM t_verein
    ORDER BY userId;
PROMPT=======================================
PROMPT Fuer welchen Verein sollen die Fahrzeuge angezeigt werden?
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

COLUMN FahrzeugNr FORMAT A10;
COLUMN kennzeichen FORMAT A12;
COLUMN name FORMAT A12;

SELECT vehicleId AS FahrzeugNr, kennzeichen, name
    FROM t_vehicles
    WHERE userId = &v_userId
    ORDER BY vehicleId;

PROMPT ======================================
ACCEPT v_vehicleId CHAR PROMPT 'Fuer welches Fahrzeug wollen Sie die Position festlegen? '
PROMPT ======================================

PROMPT Denken Sie daran, dass das Dezimaltrennzeichen '.' ist
ACCEPT v_lat CHAR PROMPT 'Bitte geben Sie den Laengengrad an: '
ACCEPT v_lon CHAR PROMPT 'Bitte geben Sie den Breitengrad an: '

INSERT INTO t_bus_position (vehicleId, lat, lon, timestamp)
VALUES (&v_vehicleId, &v_lat, &v_lon, TO_DATE(sysdate, 'DD.MM.YYYY HH:MI:SS'));
COMMIT;

PROMPT ==================================
PROMPT ....gespeicherte neue Position....
PROMPT ==================================

COLUMN vehicleId FORMAT A6;
COLUMN lat FORMAT 99999.99;
COLUMN lon FORMAT 99999.99;
COLUMN timestamp FORMAT A20;

SELECT vehicleId, lat, lon, TO_CHAR(timestamp, 'DD.MM.YYYY HH:MI:SS') AS timestamp
    FROM t_bus_position
    WHERE vehicleId = (SELECT MAX(vehicleId) FROM t_bus_position);

PROMPT Zurueck mit Enter
PAUSE
@&pfad\hinzufuegen\menue.sql