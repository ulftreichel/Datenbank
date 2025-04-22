CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |    Tickets bearbeiten     |
PROMPT =============================
PROMPT ..alle gespeicherten Daten...

DEFINE v_column = ''
DEFINE v_tickettypeId = ''
DEFINE v_name = ''
DEFINE v_price = ''
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
PROMPT Von welchen Verein moechten Sie die Tickets bearbeiten?
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

COLUMN TicketID FORMAT A8;
COLUMN name FORMAT A35;
COLUMN price FORMAT 99999.99;
COLUMN userId FORMAT A11;
SET WRAP ON;

SELECT tickettypeId AS TicketID, name, price
    FROM t_ticket_types
    WHERE userId = &v_userId
    ORDER BY tickettypeId;

ACCEPT v_tickettypeId CHAR PROMPT 'Bitte TicketID eingeben: '
ACCEPT v_column CHAR PROMPT 'Welches Feld möchten Sie bearbeiten? (name/price) '
ACCEPT v_newValue CHAR PROMPT 'Neuer Wert: '

UPDATE t_ticket_types
SET name = '&v_newValue'
WHERE tickettypeId = &v_tickettypeId
AND LOWER('&v_column') = 'name';

UPDATE t_ticket_types
SET price = '&v_newValue'
WHERE tickettypeId = &v_tickettypeId
AND LOWER('&v_column') = price;

PROMPT ====================================
PROMPT .Ticketdaten nach dem aktualisieren.
PROMPT ====================================
SELECT tickettypeId,name,price,userId
    FROM t_ticket_types
    WHERE tickettypeId = &v_tickettypeId;

PROMPT Daten wurden aktualisiert!
PROMPT Zurueck mit Enter
pause
@&pfad\bearbeiten\menue.sql