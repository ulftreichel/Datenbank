CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |    Fahrer bearbeiten      |
PROMPT =============================
PROMPT ..alle gespeicherten Daten...

DEFINE v_column = ''
DEFINE v_driverId = ''
DEFINE v_name = ''
DEFINE v_email = ''
DEFINE v_webPassword = ''
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
PROMPT Von welchen Verein moechten Sie die Fahrer bearbeiten?
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

COLUMN FahrerID FORMAT A8;
COLUMN name FORMAT A20;
COLUMN email FORMAT A20;
COLUMN webPassword FORMAT A30;

SELECT driverId AS FahrerID, name, email, webPassword
    FROM t_drivers
    WHERE userId = &v_userId
    ORDER BY driverId;

ACCEPT v_driverId CHAR PROMPT 'Bitte FahrerID eingeben: '
ACCEPT v_column CHAR PROMPT 'Welches Feld möchten Sie bearbeiten? (name/email/webPassword) '
ACCEPT v_newValue CHAR PROMPT 'Neuer Wert: '

UPDATE t_drivers
SET name = '&v_newValue'
WHERE driverId = '&v_driverId'
AND LOWER('&v_column') = 'name';

UPDATE t_drivers
SET email = '&v_newValue'
WHERE driverId = '&v_driverId'
AND LOWER('&v_column') = 'email';

UPDATE t_drivers
SET webPassword = '&v_newValue'
WHERE driverId = '&v_driverId'
AND LOWER('&v_column') = 'webpassword';

PROMPT ====================================
PROMPT .Fahrerdaten nach dem aktualisieren.
PROMPT ====================================
SELECT driverId,name,email,webPassword,userId
    FROM t_drivers
    WHERE driverId = &v_driverId;

PROMPT Daten wurden aktualisiert!
PROMPT Zurueck mit Enter
pause
@&pfad\bearbeiten\menue.sql