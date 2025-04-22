CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |    Vereinsdaten anzeigen    |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_userId = ''

ACCEPT v_userId CHAR PROMPT 'Bitte VereinsId eingeben: '

COLUMN VereinsNr FORMAT A9;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;

SELECT userId AS VereinsNr,gemeinde,plz,vereinsname,region
    FROM t_verein
    WHERE &v_userId = 0 OR userId = &v_userId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql