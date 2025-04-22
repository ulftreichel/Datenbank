CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |     Linien bearbeiten     |
PROMPT =============================
PROMPT ..alle gespeicherten Daten...

DEFINE v_column = ''
DEFINE v_lineId = ''
DEFINE v_name = ''
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

ACCEPT v_lineId CHAR PROMPT 'Bitte LinienID eingeben: '
ACCEPT v_newValue CHAR PROMPT 'Neuen Namen eingeben: '

UPDATE t_lines
SET name = '&v_newValue'
WHERE lineId = &v_lineId
AND LOWER('&v_column') = 'name';

PROMPT =====================================
PROMPT .Vereinsdaten nach dem aktualisieren.
PROMPT =====================================
SELECT lineId,name,userId
    FROM t_lines
    WHERE lineId = &v_lineId;

PROMPT Daten wurden aktualisiert!
PROMPT Zurueck mit Enter
pause
@&pfad\bearbeiten\menue.sql