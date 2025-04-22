CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF
SET linesize 200
PROMPT =============================
PROMPT |     Fahrer einfuegen      |
PROMPT =============================

DEFINE v_driverId = ''
DEFINE v_name = ''
DEFINE v_email = ''
DEFINE v_webPassword = ''

COLUMN VereinsNr FORMAT A9;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;

PROMPT Fuer welchen Verein soll der Fahrer hinzugefuegt werden?
SELECT userId AS VereinsNr, gemeinde, plz, vereinsname, region
    FROM t_verein
    ORDER BY userId;
PROMPT=======================================
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

ACCEPT v_name CHAR PROMPT 'Bitte den namen des Fahrers angeben: '
ACCEPT v_email CHAR PROMPT 'Bitte die eMail des Fahrers angeben: '
ACCEPT v_webPassword CHAR PROMPT 'Bitte ein Passwort fuer den Login angeben: '

INSERT INTO t_drivers (driverId,name,email,webPassword,userId)
VALUES ((SELECT MAX(driverId) + 1 FROM t_drivers), '&v_name', '&v_email', '&v_webPassword', &v_userId);
COMMIT;
PROMPT ================================
PROMPT ....gespeicherte Fahrerdaten....
PROMPT ================================

COLUMN FahrerNr FORMAT A8;
COLUMN name FORMAT A20;
COLUMN email FORMAT A20;
COLUMN webPassword FORMAT A30;
COLUMN userId FORMAT A11;
SELECT driverId AS FahrerNr,name,email,webPassword
    FROM t_drivers
    WHERE vehicleId = (SELECT MAX(vehicleId) FROM t_vehicles);

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql