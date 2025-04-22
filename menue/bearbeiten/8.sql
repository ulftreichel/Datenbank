CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |    Fahrplan bearbeiten    |
PROMPT =============================
PROMPT ..alle gespeicherten Daten...

DEFINE v_stopId = ''
DEFINE v_lineId = ''
DEFINE v_column = ''
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
PROMPT Von welchen Verein moechten Sie die Linien bearbeiten?:
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

COLUMN LinienID FORMAT A8;
COLUMN name FORMAT A20;
COLUMN userId FORMAT A11;

SELECT lineId AS LinienID, name
    FROM t_lines
    ORDER BY lineId;

PROMPT=======================================
ACCEPT v_lineId CHAR PROMPT 'Bitte LinienID eingeben: '
PROMPT=======================================

COLUMN HaltestellenID FORMAT A14;
COLUMN arrival FORMAT 99999.99;
COLUMN departure FORMAT 99999.99;
COLUMN userId FORMAT A11;
COLUMN lineId FORMAT A12;
SELECT stopId AS HaltestellenID, arrival, departure
    FROM t_schedules
    WHERE lineId = &v_lineId AND userId = &v_userId
    ORDER BY stopId;

PROMPT=======================================
ACCEPT v_stopId CHAR PROMPT 'Bitte HaltestellenID eingeben: '
PROMPT=======================================

ACCEPT v_column CHAR PROMPT 'Welches Feld möchten Sie bearbeiten? (arrival/departure) '
ACCEPT v_newValue CHAR PROMPT 'Neuer Wert: '

UPDATE t_schedules
    SET arrival = '&v_newValue'
    WHERE stopId = &v_stopId
    AND lineId = &v_lineId
    AND LOWER('&v_column') = arrival;

UPDATE t_schedules
    SET departure = '&v_newValue'
    WHERE stopId = &v_stopId
    AND lineId = &v_lineId
    AND LOWER('&v_column') = departure;

PROMPT ===================================
PROMPT ..Fahrplan nach dem aktualisieren..
PROMPT ===================================
SELECT stopId AS HaltestellenID,arrival,departure,lineId,userId
    FROM t_schedules
    WHERE stopId = &v_stopId AND lineId = &v_lineId;
    
PROMPT Daten wurden aktualisiert!
PROMPT Zurück mit Enter
pause
@&pfad\bearbeiten\menue.sql
