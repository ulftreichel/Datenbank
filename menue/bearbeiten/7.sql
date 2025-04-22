CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |  Haltestellen bearbeiten  |
PROMPT =============================
PROMPT ..alle gespeicherten Daten...

DEFINE v_column = ''
DEFINE v_stopId = ''
DEFINE v_name = ''
DEFINE v_lat = ''
DEFINE v_lon = ''
DEFINE v_newValue = ''
DEFINE v_userId = ''

COLUMN VereinID FORMAT A8;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT userId AS VereinID, gemeinde, plz, vereinsname, region
    FROM t_verein
    ORDER BY userId;

PROMPT=======================================
PROMPT Von welchen Verein moechten Sie die Haltestellen bearbeiten?:
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

COLUMN HaltestellenID FORMAT A14;
COLUMN name FORMAT A12;
COLUMN lat FORMAT 99999.99;
COLUMN lon FORMAT 99999.99;
COLUMN userId FORMAT A11;

SELECT stopId AS HaltestellenID, name, lat, lon
    FROM t_stops
    ORDER BY stopId;

ACCEPT v_stopId CHAR PROMPT 'Bitte HaltestellenID eingeben: '
ACCEPT v_column CHAR PROMPT 'Welches Feld möchten Sie bearbeiten? (name/lat/lon) '
ACCEPT v_newValue CHAR PROMPT 'Neuer Wert: '

UPDATE t_stops
SET name = '&v_newValue'
WHERE stopId = &v_stopId
AND LOWER('&v_column') = 'name';

UPDATE t_stops
SET lat = '&v_newValue'
WHERE stopId = &v_stopId
AND LOWER('&v_column') = lat;

UPDATE t_stops
SET lon = '&v_newValue'
WHERE stopId = &v_stopId
AND LOWER('&v_column') = lon;

PROMPT ====================================
PROMPT .Haltestelle nach dem aktualisieren.
PROMPT ====================================
SELECT stopId,name,lat,lon,userId
    FROM t_stops
    WHERE stopId = &v_stopId;

PROMPT Daten wurden aktualisiert!
PROMPT Zurueck mit Enter
pause
@&pfad\bearbeiten\menue.sql