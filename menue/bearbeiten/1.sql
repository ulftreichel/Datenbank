CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ==============================
PROMPT |    Userdaten bearbeiten    |
PROMPT ==============================
PROMPT ...alle gespeicherten Daten...

DEFINE v_column = ''
DEFINE v_userId = ''
DEFINE v_name = ''
DEFINE v_email = ''
DEFINE v_role = ''
DEFINE v_password = ''
DEFINE v_newValue = ''

COLUMN userId FORMAT A6;
COLUMN name FORMAT A15;
COLUMN email FORMAT A15;
COLUMN role FORMAT A10;
COLUMN password FORMAT A25;

SELECT *
    FROM users;

ACCEPT v_userId CHAR PROMPT 'Bitte UserId eingeben: '
ACCEPT v_column CHAR PROMPT 'Welches Feld möchten Sie bearbeiten? (name/email/role/password) '
ACCEPT v_newValue CHAR PROMPT 'Neuer Wert: '

UPDATE users
SET name = '&v_newValue'
WHERE userId = '&v_userId'
AND LOWER('&v_column') = 'name';

UPDATE users
SET email = '&v_newValue'
WHERE userId = '&v_userId'
AND LOWER('&v_column') = 'email';

UPDATE users
SET role = '&v_newValue'
WHERE userId = '&v_userId'
AND LOWER('&v_column') = 'role';

UPDATE users
SET password = '&v_newValue'
WHERE userId = '&v_userId'
AND LOWER('&v_column') = 'password';

PROMPT ==================================
PROMPT .Userdaten nach dem aktualisieren.
PROMPT ==================================

SELECT userId,name,email,role,password
    FROM users
    WHERE userId = &v_userId;

PROMPT Daten wurden aktualisiert!
PROMPT Zurueck mit Enter
pause
@&pfad\bearbeiten\menue.sql