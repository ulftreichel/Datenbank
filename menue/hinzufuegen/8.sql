CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ==============================
PROMPT |     Fahrplan einfuegen     |
PROMPT ==============================

DEFINE v_stopId = ''
DEFINE v_lineId = ''
DEFINE v_arrival = ''
DEFINE v_departure = ''
DEFINE v_userId = ''

COLUMN userId FORMAT A6;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT *
    FROM t_verein;
PROMPT=======================================
PROMPT Fuer welchen Verein soll ein Fahrplan hinzugefuegt werden?
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

COLUMN LinienNr FORMAT A8;
COLUMN name FORMAT A20;
SELECT lineId AS LinienNr, name
    FROM t_lines
    WHERE userId = &v_userId
    ORDER BY lineId;

PROMPT=======================================
PROMPT Fuer welche Linie soll ein Fahrplan hinzugefuegt werden?
ACCEPT v_lineId CHAR PROMPT 'Bitte LinienID eingeben: '
PROMPT=======================================

COLUMN stopId FORMAT A12;
COLUMN name FORMAT A12;

SELECT stopId, name
    FROM t_stops
    WHERE userId = &v_userId
    ORDER BY stopId;

PROMPT=======================================
PROMPT Welche Haltestelle soll ein Fahrplan angelegt werden?
ACCEPT v_stopId CHAR PROMPT 'Bitte HaltestellenID eingeben: '
PROMPT=======================================

ACCEPT v_arrival CHAR PROMPT 'Bitte geben Sie die Ankunftszeit an: '
ACCEPT v_departure CHAR PROMPT 'Bitte geben Sie die Abfahrtzeit an: '

INSERT INTO t_schedules (stopId,arrival,departure,userId,lineId)
VALUES (&v_stopId, &v_arrival, &v_departure, &v_userId, &v_lineId);
COMMIT;

PROMPT ==============================
PROMPT ..gespeicherte Fahrplandaten..
PROMPT ==============================

COLUMN HaltestellenNr FORMAT A12;
COLUMN Ankunft FORMAT 99999.99;
COLUMN Abfahrt FORMAT 99999.99;
COLUMN VereinsNr FORMAT A9;
COLUMN LinienNr FORMAT A8;

SELECT stopId AS HaltestellenNr , arrival AS Ankunft, departure AS Abfahrt , userId AS VereinsNr, lineId AS LinienNr
    FROM t_schedules
    WHERE stopId = &v_stopId AND lineId = &v_lineId AND userId = &v_userId;

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql