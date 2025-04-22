SET ECHO OFF
CL SCR

PROMPT Enter fuer automatischen Login

pause

CONN hr1/oracle_4U@localhost/xepdb1

PROMPT
PROMPT
PROMPT ==================================================
PROMPT Erfolgreich eingeloggt, Enter druecken fuer weiter
PROMPT ==================================================
pause 
define pfad = C:\Users\student\Scripte\sqlplus\menue

@&pfad\menue.sql
