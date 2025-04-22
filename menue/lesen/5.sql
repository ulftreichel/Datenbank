CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ===============================
PROMPT |      Tickets anzeigen       |
PROMPT | mit 0 werden alle angezeigt |
PROMPT ===============================

DEFINE v_tickettypeId = ''

ACCEPT v_tickettypeId CHAR PROMPT 'Bitte TicketID eingeben: '

COLUMN TicketNr FORMAT A8;
COLUMN name FORMAT A35;
COLUMN price FORMAT 99999.99;
COLUMN VereinsNr FORMAT A11;
SELECT userId AS VereinsNr, tickettypeId AS TicketNr,name,price
    FROM t_ticket_types
    WHERE &v_tickettypeId = 0 OR tickettypeId = &v_tickettypeId;

PROMPT Zurueck mit Enter
pause
@&pfad\lesen\menue.sql