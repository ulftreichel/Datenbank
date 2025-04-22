CL SCR
SET ECHO OFF;
DROP TABLE t_bus_position CASCADE CONSTRAINTS;
DROP TABLE t_drivers CASCADE CONSTRAINTS;
DROP TABLE t_lines CASCADE CONSTRAINTS;
DROP TABLE t_stops CASCADE CONSTRAINTS;
DROP TABLE t_ticket_types CASCADE CONSTRAINTS;
DROP TABLE t_vehicles CASCADE CONSTRAINTS;
DROP TABLE t_schedules CASCADE CONSTRAINTS;
DROP TABLE t_passengers CASCADE CONSTRAINTS;
DROP TABLE t_verein CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;

CREATE TABLE users (
    userId VARCHAR2(255) PRIMARY KEY,
    name VARCHAR2(255),
    email VARCHAR2(255),
    role VARCHAR2(10),
    password VARCHAR2(255)
);

CREATE TABLE t_verein (
    userId VARCHAR2(255) PRIMARY KEY,
    gemeinde VARCHAR2(255),
    plz VARCHAR2(6),
    vereinsname VARCHAR2(255),
    region VARCHAR2(2),
    FOREIGN KEY (userId) REFERENCES users(userId) ON DELETE CASCADE
);

CREATE TABLE t_drivers (
    driverId VARCHAR2(255) PRIMARY KEY,
    name VARCHAR2(255),
    email VARCHAR2(255),
    webPassword VARCHAR2(255),
    userId VARCHAR2(255),
    FOREIGN KEY (userId) REFERENCES t_verein(userId) ON DELETE CASCADE
);

CREATE TABLE t_lines (
    lineId VARCHAR2(255) PRIMARY KEY,
    name VARCHAR2(255),
    userId VARCHAR2(255),
    FOREIGN KEY (userId) REFERENCES t_verein(userId) ON DELETE CASCADE
);

CREATE TABLE t_stops (
    stopId VARCHAR2(255) PRIMARY KEY,
    name VARCHAR2(255),
    lat NUMBER,
    lon NUMBER,
    userId VARCHAR2(255),
    FOREIGN KEY (userId) REFERENCES t_verein(userId) ON DELETE CASCADE
);

CREATE TABLE t_ticket_types (
    tickettypeId VARCHAR2(255) PRIMARY KEY,
    name VARCHAR2(255),
    price NUMBER(10, 2),
    userId VARCHAR2(255),
    FOREIGN KEY (userId) REFERENCES t_verein(userId) ON DELETE CASCADE
);

CREATE TABLE t_vehicles (
    vehicleId VARCHAR2(255) PRIMARY KEY,
    kennzeichen VARCHAR2(255),
    name VARCHAR2(255),
    sitzplaetze NUMBER,
    userId VARCHAR2(255),
    FOREIGN KEY (userId) REFERENCES t_verein(userId) ON DELETE CASCADE
);

CREATE TABLE t_bus_position (
    vehicleId VARCHAR2(255) PRIMARY KEY,
    lat NUMBER(10, 8),
    lon NUMBER(10, 8),
    timestamp DATE,
    FOREIGN KEY (vehicleId) REFERENCES t_vehicles(vehicleId) ON DELETE CASCADE
);

CREATE TABLE t_schedules (
    stopId VARCHAR2(255),
    arrival NUMBER(10, 2),
    departure NUMBER(10, 2),
    userId VARCHAR2(255),
    lineId VARCHAR2(255),
    PRIMARY KEY (stopId, lineId),
    FOREIGN KEY (userId) REFERENCES t_verein(userId) ON DELETE CASCADE,
    FOREIGN KEY (lineId) REFERENCES t_lines(lineId) ON DELETE CASCADE,
    FOREIGN KEY (stopId) REFERENCES t_stops(stopId) ON DELETE CASCADE
);

CREATE TABLE t_passengers (
    passengerId VARCHAR2(255) PRIMARY KEY,
    tickettypeId VARCHAR2(255),
    timestamp DATE,
    stopId VARCHAR2(255),
    lineId VARCHAR2(255),
    vehicleId VARCHAR2(255),
    driverId VARCHAR2(255),
    userId VARCHAR2(255),
    FOREIGN KEY (userId) REFERENCES t_verein(userId) ON DELETE CASCADE,
    FOREIGN KEY (tickettypeId) REFERENCES t_ticket_types(tickettypeId) ON DELETE CASCADE,
    FOREIGN KEY (driverId) REFERENCES t_drivers(driverId) ON DELETE CASCADE,
    FOREIGN KEY (lineId) REFERENCES t_lines(lineId) ON DELETE CASCADE,
    FOREIGN KEY (stopId) REFERENCES t_stops(stopId) ON DELETE CASCADE,
    FOREIGN KEY (vehicleId) REFERENCES t_vehicles(vehicleId) ON DELETE CASCADE
);

COMMIT;
PROMPT =======================================================
PROMPT Tabellen wurden erfolgreich angelegt. Zurueck mit Enter
PROMPT =======================================================
pause

define pfad = C:\Users\student\Scripte\sqlplus\menue

@&pfad\menue.sql
