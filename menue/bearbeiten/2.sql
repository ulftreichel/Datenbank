CL SCR
SET WRAP ON;
SET SERVEROUTPUT OFF
SET VERIFY OFF

PROMPT =============================
PROMPT |    Vereine bearbeiten     |
PROMPT =============================
PROMPT ..alle gespeicherten Daten...

DEFINE v_column = ''
DEFINE v_userId = ''
DEFINE v_gemeinde = ''
DEFINE v_plz = ''
DEFINE v_vereinsname = ''
DEFINE v_region = ''
DEFINE v_newValue = ''

COLUMN VereinID FORMAT A8;
COLUMN gemeinde FORMAT A35;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;

SELECT userId AS VereinID, gemeinde, plz, vereinsname, region
FROM t_verein;

ACCEPT v_userId CHAR PROMPT 'Bitte VereinID eingeben: '
ACCEPT v_column CHAR PROMPT 'Welches Feld moechten Sie bearbeiten? (gemeinde/plz/vereinsname/region) '
ACCEPT v_newValue CHAR PROMPT 'Neuer Wert: '

UPDATE t_verein
SET gemeinde = '&v_newValue'
WHERE userId = &v_userId
AND LOWER('&v_column') = 'gemeinde';

UPDATE t_verein
SET plz = '&v_newValue'
WHERE userId = &v_userId
AND LOWER('&v_column') = 'plz';

UPDATE t_verein
SET vereinsname = '&v_newValue'
WHERE userId = '&v_userId'
AND LOWER('&v_column') = 'vereinsname';

UPDATE t_verein
SET region = '&v_newValue'
WHERE userId = '&v_userId'
AND LOWER('&v_column') = 'region';

COMMIT;
PROMPT =====================================
PROMPT .Vereinsdaten nach dem aktualisieren.
PROMPT =====================================

COLUMN VereinID FORMAT A8;
COLUMN gemeinde FORMAT A35;
COLUMN plz FORMAT A5;
COLUMN vereinsname FORMAT A11;
COLUMN region FORMAT A6;
SELECT userId,gemeinde,plz,vereinsname,region
    FROM t_verein
    WHERE userId = &v_userId;

PROMPT Daten wurden aktualisiert!
PROMPT Zurueck mit Enter
pause
@&pfad\bearbeiten\menue.sql