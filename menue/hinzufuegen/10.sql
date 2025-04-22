CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF
SET linesize 200
PROMPT =============================
PROMPT |   Passagier hinzufuegen   |
PROMPT =============================

DEFINE v_passengerId = ''
DEFINE v_tickettypeId = ''
DEFINE v_stopId = ''
DEFINE v_stopName = ''
DEFINE v_lineId = ''
DEFINE v_vehicleId = ''
DEFINE v_userID = ''
DEFINE v_timestamp = ''
DEFINE v_driver = ''
DEFINE v_driverId = ''

COLUMN userId FORMAT A6;
COLUMN gemeinde FORMAT A8;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT userId, gemeinde
    FROM t_verein;
PROMPT=======================================
PROMPT In welcher Gemeinde ist der Passagier eingestiegen?
ACCEPT v_userId CHAR PROMPT 'Bitte Nummer der Gemeinde eingeben: '
PROMPT=======================================

COLUMN HaltestellenNR FORMAT A14;
COLUMN name FORMAT A12;

SELECT stopId AS HaltestellenNR,name
    FROM t_stops
    WHERE userId = '&v_userId';

PROMPT=======================================
PROMPT An welcher Haltestelle ist der Passagier eingestiegen?
ACCEPT v_stopId CHAR PROMPT 'Bitte HaltestellenNr eingeben: '
PROMPT=======================================

COLUMN LinenNr FORMAT A7;
COLUMN name FORMAT A20;
COLUMN userId FORMAT A11;
SELECT lineId AS LinenNr,name
    FROM t_lines
    WHERE userId = &v_userId;

PROMPT=======================================
PROMPT Auf den Schild mit den Abfahrtszeiten steht eine LinienNr?
ACCEPT v_lineId CHAR PROMPT 'Bitte geben Sie die LinienNr ein: '
PROMPT=======================================

COLUMN FahrzeugNr FORMAT A10;
COLUMN kennzeichen FORMAT A12;

SELECT vehicleId AS FahrzeugNr,kennzeichen AS Kennzeichen
    FROM t_vehicles
    WHERE userId = &v_userId;

PROMPT=======================================
PROMPT Wie ist das Kennzeichen von dem Fahrzeug?
ACCEPT v_vehicleId CHAR PROMPT 'Bitte geben Sie die FahrzeugNr ein: '
PROMPT=======================================

COLUMN "Der Passagier wird heute begruesst von..." NEW_VALUE v_driver
COLUMN "FahrerNr" NEW_VALUE v_driverId
COLUMN "FahrerNr" FORMAT A10;
COLUMN "Der Passagier wird heute begruesst von..." FORMAT A42;
SELECT driverID AS "FahrerNr", name AS "Der Passagier wird heute begruesst von..."
FROM (
    SELECT name
    FROM t_drivers WHERE userId = &v_userId
    ORDER BY DBMS_RANDOM.VALUE
)
WHERE ROWNUM = 1;
PROMPT =======================================

COLUMN "TicketNr" FORMAT A12;
COLUMN "Ticketname" FORMAT A35;
COLUMN "Ticketpreis" FORMAT 99999.99;

SELECT tickettypeId AS "TicketNr",name AS "Ticketname", price AS Ticketpreis
    FROM t_ticket_types
    WHERE userId = &v_userId;

PROMPT=======================================
PROMPT Welches Ticket wurde erworben?
ACCEPT v_tickettypeId CHAR PROMPT 'Bitte geben Sie die TicketNr ein: '
PROMPT=======================================
PROMPT Bitte nur in Scheinen bezahlen, Hartgeld ist zu schwer
ACCEPT v_given NUMBER PROMPT 'Wieviel Euro haben Sie gegeben?: '
PROMPT=======================================
COLUMN restbetrag NEW_VALUE v_restbetrag
SELECT 
    &v_given - price AS restbetrag
FROM t_ticket_types
WHERE tickettypeId = &v_tickettypeId;
PROMPT Sie bekommen: &v_restbetrag Euro wieder. Zaehlen Sie bitte nach !!!
PROMPT weiter wenn Sie nachgezaehlt haben
pause
PROMPT =======================================

INSERT INTO t_passengers (
    passengerId, tickettypeId, timestamp, stopId, lineId, vehicleId, driveriD, userId)
    VALUES ((SELECT MAX (passengerId) + 1 FROM t_passengers), &v_tickettypeId, TO_DATE(sysdate, 'DD.MM.YYYY HH:MI:SS'), &v_stopId, &v_lineId, &v_vehicleId, &v_driverId, &v_userId
    );
COMMIT;

COLUMN passengerId FORMAT A3;
COLUMN TicketName FORMAT A11;
COLUMN timestamp FORMAT A20;
COLUMN HaltstellenName FORMAT A15;
COLUMN LinienName FORMAT A10;
COLUMN FhzName FORMAT A12;
COLUMN Verein FORMAT A10;

SELECT 
    p.passengerId, 
    t.name AS TicketName, 
    TO_CHAR(p.timestamp, 'DD.MM.YYYY HH:MI:SS') AS timestamp,
    s.name AS HaltstellenName, 
    l.name AS LinienName, 
    v.name AS FhzName, 
    a.vereinsname AS Verein
FROM t_passengers p
JOIN t_ticket_types t ON p.tickettypeId = t.tickettypeId
JOIN t_stops s ON p.stopId = s.stopId
JOIN t_lines l ON p.lineId = l.lineId
JOIN t_vehicles v ON p.vehicleId = v.vehicleId
JOIN t_verein a ON p.userId = a.userId
WHERE p.passengerId = &v_passengerId;

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql