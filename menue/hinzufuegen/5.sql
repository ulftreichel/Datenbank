CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |    Tickets einfuegen      |
PROMPT =============================

DEFINE v_tickettypeId = ''
DEFINE v_name = ''
DEFINE v_price = ''
DEFINE v_userId = ''

COLUMN userId FORMAT A6;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT *
    FROM t_verein
    ORDER BY userId;
PROMPT=======================================
PROMPT Fuer welchen Verein soll das Ticket hinzugefuegt werden?
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

ACCEPT v_name CHAR PROMPT 'Bitte geben Sie den Ticketbezeichnung an: '
PROMPT Dezimaltrennzeichen ist '.'
ACCEPT v_price CHAR PROMPT 'Bitte geben Sie den Ticketpreis an: '
INSERT INTO t_ticket_types (tickettypeId,name,price,userId)
VALUES ((SELECT MAX(tickettypeId) + 1 FROM t_ticket_types), '&v_name', &v_price, &v_userId);
COMMIT;
PROMPT ================================
PROMPT ....gespeicherte Ticketdaten....
PROMPT ================================

COLUMN TicketNr FORMAT A12;
COLUMN Bezeichnung FORMAT A35;
COLUMN Preis FORMAT 99999.99;
SELECT tickettypeId AS TicketNr,name AS Bezeichnung,price AS Preis
    FROM t_ticket_types
    WHERE tickettypeId = (SELECT MAX(tickettypeId) FROM t_ticket_types);

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql