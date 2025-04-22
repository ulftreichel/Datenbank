CL SCR

PROMPT ====================================
PROMPT Die Beispieldaten werden eingetragen
PROMPT ====================================

INSERT INTO users (
        userId,name,email,role,password
    ) VALUES (
        '1','Ulf','ulf@admin.de','Admin','hierkoennteeinRichtigesPasswordstehen'
    );

INSERT INTO users (
        userId,name,email,role,password
    ) VALUES (
        '2','Horst','Horst@bbv.de','Vorstand','hierkoennteeinRichtigesPasswordstehen'
    );

INSERT INTO t_verein (
        userId,gemeinde,plz,vereinsname,region
    ) VALUES (
        '2','Rehden','49453','BBV Rehden','NI'
    );

INSERT INTO t_vehicles(
        vehicleId,kennzeichen,name,sitzplaetze,userId
    ) VALUES (
        '1','DH-BB 123','Bus 1',8,'2'
    );

INSERT INTO t_vehicles(
        vehicleId,kennzeichen,name,sitzplaetze,userId
    ) VALUES (
        '2','DH-BV 456','Bus 2',8,'2'
    );

INSERT INTO t_drivers (
        driverId, name, email, webPassword, userId
    ) VALUES (
        '1','Joerg Burde', 'burde@bbv.de', 'hierkoennteihrpasswortstehen','2'
    );

INSERT INTO t_drivers (
        driverId, name, email, webPassword, userId
    ) VALUES (
        '2','Peter Degen', 'degen@bbv.de', 'hierkoennteihrpasswortstehen','2'
    );

INSERT INTO t_drivers (
        driverId, name, email, webPassword, userId
    ) VALUES (
        '3','Heinz Kirchfeld', 'kirchfeld@bbv.de', 'hierkoennteihrpasswortstehen','2'
    );

INSERT INTO t_drivers (
        driverId, name, email, webPassword, userId
    ) VALUES (
        '4','Heino Prigge', 'prigge@bbv.de', 'hierkoennteihrpasswortstehen','2'
    );

INSERT INTO t_drivers (
        driverId, name, email, webPassword, userId
    ) VALUES (
        '5','Ursula Endres', 'endres@bbv.de', 'hierkoennteihrpasswortstehen','2'
    );

INSERT INTO t_ticket_types (
        tickettypeId, name, price, userId
    ) VALUES (
        '1','Erwachsener', 2.45, '2'
    );

INSERT INTO t_ticket_types (
        tickettypeId, name, price, userId
    ) VALUES (
        '2','Erwachsener 4-Fahrten-Karte', 8.80, '2'
    );

INSERT INTO t_ticket_types (
        tickettypeId, name, price, userId
    ) VALUES (
        '3','Erwachsener Tageskarte', 6.90, '2'
    );

INSERT INTO t_ticket_types (
        tickettypeId, name, price, userId
    ) VALUES (
        '4','Erwachsener Tageskarte 2 Personen', 10.20, '2'
    );

INSERT INTO t_ticket_types (
        tickettypeId, name, price, userId
    ) VALUES (
        '5','Kind (bis 15 Jahre)', 1.30, '2'
    );

INSERT INTO t_ticket_types (
        tickettypeId, name, price, userId
    ) VALUES (
        '6','Schueler Monatskarte', 44.80, '2'
    );

INSERT INTO t_lines (
        lineId, name, userId
    ) VALUES (
        '1','Linie 1','2'
    );

INSERT INTO t_lines (
        lineId, name, userId
    ) VALUES (
        '2','Linie 2','2'
    );

INSERT INTO t_stops (
        stopId, name, lat, lon, userId
    ) VALUES (
        '1','Rehden Mitte', 52.666, 8.666, '2'
    );

INSERT INTO t_stops (
        stopId, name, lat, lon, userId
    ) VALUES (
        '2','Rehden Nord', 52.666, 8.666, '2'
    );

INSERT INTO t_stops (
        stopId, name, lat, lon, userId
    ) VALUES (
        '3','Rehden West', 52.666, 8.666, '2'
    );

INSERT INTO t_stops (
        stopId, name, lat, lon, userId
    ) VALUES (
        '4','Rehden Sued', 52.666, 8.666, '2'
    );

INSERT INTO t_stops (
        stopId, name, lat, lon, userId
    ) VALUES (
        '5','Rehden Ost', 52.666, 8.666, '2'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '1', 7.45, 7.50, '2', '1'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '2', 8.00, 8.05, '2', '1'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '3', 8.15, 8.20, '2', '1'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '4', 8.30, 8.35, '2', '1'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '5', 8.45, 8.50, '2', '1'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '1', 9.45, 9.50, '2', '2'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '2', 10.00, 10.05, '2', '2'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '3', 10.15, 10.20, '2', '2'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '4', 10.30, 10.35, '2', '2'
    );

INSERT INTO t_schedules (
        stopId, arrival, departure, userId, lineId
    ) VALUES (
        '5', 10.45, 10.50, '2', '2'
    );

INSERT INTO t_bus_position (
        vehicleId, lat, lon, timestamp
    ) VALUES (
        '1', 52.666, 8.666, TO_DATE('01.04.2025 06:20:12', 'DD.MM.YYYY HH:MI:SS')
    );

INSERT INTO t_passengers (
    passengerId, tickettypeId, timestamp, stopId, lineId, vehicleId, userId)
    VALUES (
        '1', '1', TO_DATE('01.04.2025 06:20:12', 'DD.MM.YYYY HH:MI:SS'), '1', '1', '1', '2'
    );

COMMIT;
PROMPT ===============================================
PROMPT Daten erfolgreich eingetragen, weiter mit Enter
PROMPT ===============================================
pause
define pfad = C:\Users\student\Scripte\sqlplus\menue
@&pfad\menue.sql