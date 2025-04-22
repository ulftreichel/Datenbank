CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =================================
PROMPT |        Verein einfuegen       |
PROMPT =================================

DEFINE v_userId = ''
DEFINE v_gemeinde = ''
DEFINE v_plz = ''
DEFINE v_vereinsname = ''
DEFINE v_region = ''

COLUMN BenutzerNr FORMAT A10;
COLUMN name FORMAT A20;
PROMPT Fuer welchen User soll ein Verein angelegt werden?
SELECT userId AS BenutzerNr, name
    FROM users
    ORDER BY userId;
PROMPT Bitte geben Sie die Vereinsdaten ein:
PROMPT
ACCEPT v_userId CHAR PROMPT 'BenutzerNr des Vorstands: '
ACCEPT v_gemeinde CHAR PROMPT 'Wie heisst die Gemeinde: '
ACCEPT v_plz CHAR PROMPT 'Welche PLZ hat die Gemeinde: '
ACCEPT v_vereinsname CHAR PROMPT 'Wie soll der Verein heissen: '
PROMPT ==============================================
PROMPT |  In welchen Bundesland liegt die Gemeinde  |
PROMPT |============================================|
PROMPT |     "NI", "HB", "HH", "BW", "BY", "BE",    |
PROMPT |     "BB", "HE", "MV", "NW", "RP", "SL",    |
PROMPT |           "SN", "ST", "SH", "TH"           |
PROMPT ==============================================
ACCEPT v_region CHAR PROMPT 'Geben Sie das Bundesland mit 2 Zeichen an: '

INSERT INTO t_verein (userId, gemeinde, plz, vereinsname, region)
VALUES (&v_userId, '&v_gemeinde', '&v_plz', '&v_vereinsname', '&v_region');
COMMIT;

PROMPT =================================
PROMPT ....gespeicherte Vereinsdaten....
PROMPT =================================

COLUMN VereinsNr FORMAT A9;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
PROMPT ===============================
PROMPT ...gespeicherte Vereinsdaten...
PROMPT ===============================
SELECT userId AS VereinsNr,gemeinde,plz,vereinsname,region
    FROM t_verein
    WHERE userId = (SELECT MAX(userId) FROM t_verein);
    
PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql
