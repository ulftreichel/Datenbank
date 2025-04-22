CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF
PROMPT =============================
PROMPT |      Linien einfuegen     |
PROMPT =============================

DEFINE v_lineId = ''
DEFINE v_name = ''
DEFINE v_user_id = ''

COLUMN userId FORMAT A6;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT *
    FROM t_verein
    ORDER BY userId;
PROMPT=======================================
PROMPT Fuer welchen Verein soll das Linie hinzugefuegt werden?
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

ACCEPT v_name CHAR PROMPT 'Bitte geben Sie die Linienbezeichnung an: '
INSERT INTO t_lines (lineId,name,userId)
VALUES ((SELECT MAX(lineId) + 1 FROM t_lines), '&v_name', &v_userId);
COMMIT;
PROMPT ================================
PROMPT ....gespeicherte Liniendaten....
PROMPT ================================
COLUMN LinienNr FORMAT A8;
COLUMN name FORMAT A20;
SELECT lineId AS LinienNr,name
    FROM t_lines
    WHERE lineId = (SELECT MAX(lineId) FROM t_lines);

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql