CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT ==============================
PROMPT |      Fahrzeug einfügen     |
PROMPT ==============================

DEFINE v_vehicleId = ''
DEFINE v_kennzeichen = ''
DEFINE v_name = ''
DEFINE v_sitzplaetze = ''
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
PROMPT Fuer welchen Verein soll das Fahrzeug hinzugefuegt werden?:
ACCEPT v_userId CHAR PROMPT 'Bitte VereinsID eingeben: '
PROMPT=======================================

ACCEPT v_kennzeichen CHAR PROMPT 'Bitte Kennzeichen angeben: '
ACCEPT v_name CHAR PROMPT 'Bitte Fahrzeugnamen angeben: '
ACCEPT v_sitzplaetze CHAR PROMPT 'Bitte Sitzplaetze angeben: '
INSERT INTO t_vehicles (vehicleId,kennzeichen,name,sitzplaetze,userId)
VALUES ((SELECT MAX(vehicleId) + 1 FROM t_vehicles), '&v_kennzeichen', '&v_name', &v_sitzplaetze, &v_userId);
COMMIT;
PROMPT ==================================
PROMPT ....gespeicherte Fahrzeugdaten....
PROMPT ==================================

COLUMN FahrzeugNr FORMAT A10;
COLUMN kennzeichen FORMAT A12;
COLUMN name FORMAT A12;
COLUMN sitzplaetze FORMAT 99999;
COLUMN userId FORMAT A11;

SELECT vehicleId AS FahrzeugNr,kennzeichen,name,sitzplaetze
    FROM t_vehicles
    WHERE vehicleId = (SELECT MAX(vehicleId) FROM t_vehicles);

PROMPT Zurueck mit Enter
pause
@&pfad\hinzufuegen\menue.sql