CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ==============================
PROMPT |   neuen Vorstand anlegen   |
PROMPT ==============================

DEFINE v_userId = ''
DEFINE v_name = ''
DEFINE v_email = ''
DEFINE v_role = 'Vorstand'
DEFINE v_password = ''

PROMPT ==============================
ACCEPT v_name CHAR PROMPT 'Bitte Namen eingeben: '
ACCEPT v_email CHAR PROMPT 'Bitte eMail eingeben: '
ACCEPT v_password CHAR PROMPT 'Bitte Passwort eingeben: '
PROMPT ==============================

INSERT INTO users (userId, name, email, role, password)
VALUES ((SELECT MAX(userId) + 1 FROM users), '&v_name', '&v_email', '&v_role', '&v_password');
COMMIT;

COLUMN userId FORMAT A6;
COLUMN name FORMAT A8;
COLUMN email FORMAT A13;
COLUMN role FORMAT A9;
COLUMN password FORMAT A38;

PROMPT ==============================
PROMPT ....gespeicherter Vorstand....
PROMPT ==============================

SELECT userId, name, email, role, password
    FROM users
    WHERE userId = (SELECT MAX(userId) FROM users);

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql
