CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |      Userdaten anzeigen     |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_userId = ''

ACCEPT v_userId CHAR PROMPT 'Bitte UserId eingeben: '

COLUMN userId FORMAT A6;
COLUMN name FORMAT A8;
COLUMN email FORMAT A13;
COLUMN role FORMAT A9;
COLUMN password FORMAT A38;
SET WRAP ON;

SELECT userId,name,email,role,password
    FROM users
    WHERE &v_userId = 0 OR userId = &v_userId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql