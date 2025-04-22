CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |       Linien anzeigen       |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_lineId = ''

ACCEPT v_lineId CHAR PROMPT 'Bitte LinienID eingeben: '

COLUMN LinienNr FORMAT A8;
COLUMN name FORMAT A20;
COLUMN VereinsNr FORMAT A11;

SELECT userId AS VereinsNr, lineId AS LinienNr, name
    FROM t_lines
    WHERE &v_lineId = 0 OR lineId = &v_lineId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql