CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |   Haltestellen einfuegen    |
PROMPT ===============================

DEFINE v_stopId = ''
DEFINE v_name = ''
DEFINE v_lat = ''
DEFINE v_lon = ''
DEFINE v_userId = ''

COLUMN userId FORMAT A6;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT *
    FROM t_verein
    ORDER BY userId;
PROMPT=======================================
PROMPT Fuer welchen Verein soll die Haltestelle hinzugefuegt werden?
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

ACCEPT v_name CHAR PROMPT 'Bitte geben Sie die Haltestellenbezeichnung/Namen an: '
PROMPT Denken Sie daran das das Dezimaltrennzeichen '.' ist
ACCEPT v_lat CHAR PROMPT 'Bitte geben Sie den Laengengrad an: '
ACCEPT v_lon CHAR PROMPT 'Bitte geben Sie den Breitengrad an: '

INSERT INTO t_stops (stopId,name,lat,lon,userId)
VALUES ((SELECT MAX(stopId) + 1 FROM t_stops), '&v_name', &v_lat, &v_lon, &v_userId);
COMMIT;
PROMPT ==================================
PROMPT ..gespeicherte Haltestellendaten..
PROMPT ==================================


COLUMN HaltestellenNr FORMAT A14;
COLUMN name FORMAT A12;
COLUMN Latitude FORMAT 99999.99;
COLUMN Longitude FORMAT 99999.99;

SELECT stopId AS HaltestellenNr, name, lat AS Latitude, lon AS Longitude
    FROM t_stops
    WHERE stopId = (SELECT MAX(stopId) FROM t_stops);

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql