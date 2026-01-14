CREATE TABLE `circuits`
(
    `circuitId`  INTEGER
        primary key,
    `circuitRef` TEXT not null default '',
    `name`       TEXT not null default '',
    `location`   TEXT,
    `country`    TEXT,
    `lat`        REAL,
    `lng`        REAL,
    `alt`        INTEGER,
    `url`        TEXT not null default ''
        unique
);

CREATE TABLE `constructors`
(
    `constructorId`  INTEGER
        primary key,
    `constructorRef` TEXT not null default '',
    `name`           TEXT not null default ''
        unique,
    `nationality`    TEXT,
    `url`            TEXT not null default ''
);

CREATE TABLE `drivers`
(
    `driverId`    INTEGER
        primary key,
    `driverRef`   TEXT not null default '',
    `number`      INTEGER,
    `code`        TEXT,
    `forename`    TEXT not null default '',
    `surname`     TEXT not null default '',
    `dob`         DATE,
    `nationality` TEXT,
    `url`         TEXT not null default ''
        unique
);

CREATE TABLE `seasons`
(
    `year` INTEGER not null default 0 
        primary key,
    `url`  TEXT    not null default ''
        unique
);

CREATE TABLE `races`
(
    `raceId`    INTEGER
        primary key,
    `year`      INTEGER not null default 0           ,
    `round`     INTEGER not null default 0           ,
    `circuitId` INTEGER not null default 0           ,
    `name`      TEXT    not null default ''          ,
    `date`      DATE    not null default '0000-00-00',
    `time`      TEXT,
    `url`       TEXT unique,
    foreign key (`year`) references `seasons`(`year`),
    foreign key (`circuitId`) references `circuits`(`circuitId`)
);

CREATE TABLE `constructorResults`
(
    `constructorResultsId` INTEGER
        primary key,
    `raceId`               INTEGER not null default 0 ,
    `constructorId`        INTEGER not null default 0 ,
    `points`               REAL,
    `status`               TEXT,
    foreign key (`raceId`) references `races`(`raceId`),
    foreign key (`constructorId`) references `constructors`(`constructorId`)

);

CREATE TABLE `constructorStandings`
(
    `constructorStandingsId` INTEGER
        primary key,
    `raceId`                 INTEGER not null default 0 ,
    `constructorId`          INTEGER not null default 0 ,
    `points`                 REAL   not null default 0 ,
    `position`               INTEGER,
    `positionText`           TEXT,
    `wins`                   INTEGER not null default 0 ,
    foreign key (`raceId`) references `races`(`raceId`),
    foreign key (`constructorId`) references `constructors`(`constructorId`)
);

CREATE TABLE `driverStandings`
(
    `driverStandingsId` INTEGER
        primary key,
    `raceId`            INTEGER not null default 0 ,
    `driverId`          INTEGER not null default 0 ,
    `points`            REAL   not null default 0 ,
    `position`          INTEGER,
    `positionText`      TEXT,
    `wins`              INTEGER not null default 0 ,
    foreign key (`raceId`) references `races`(`raceId`),
    foreign key (`driverId`) references `drivers`(`driverId`)
);

CREATE TABLE `lapTimes`
(
    `raceId`       INTEGER not null,
    `driverId`     INTEGER not null,
    `lap`          INTEGER not null,
    `position`     INTEGER,
    `time`         TEXT,
    `milliseconds` INTEGER,
    primary key (`raceId`, `driverId`, `lap`),
    foreign key (`raceId`) references `races`(`raceId`),
    foreign key (`driverId`) references `drivers`(`driverId`)
);

CREATE TABLE `pitStops`
(
    `raceId`       INTEGER not null,
    `driverId`     INTEGER not null,
    `stop`         INTEGER not null,
    `lap`          INTEGER not null,
    `time`         TEXT    not null,
    `duration`     TEXT,
    `milliseconds` INTEGER,
    primary key (`raceId`, `driverId`, `stop`),
    foreign key (`raceId`) references `races`(`raceId`),
    foreign key (`driverId`) references `drivers`(`driverId`)
);

CREATE TABLE `qualifying`
(
    `qualifyId`     INTEGER
        primary key,
    `raceId`        INTEGER not null default 0 ,
    `driverId`      INTEGER not null default 0 ,
    `constructorId` INTEGER not null default 0 ,
    `number`        INTEGER not null default 0 ,
    `position`      INTEGER,
    `q1`            TEXT,
    `q2`            TEXT,
    `q3`            TEXT,
    foreign key (`raceId`) references `races`(`raceId`),
    foreign key (`driverId`) references `drivers`(`driverId`),
    foreign key (`constructorId`) references `constructors`(`constructorId`)
);

CREATE TABLE `status`
(
    `statusId` INTEGER
        primary key,
    `status`   TEXT not null default ''
);

CREATE TABLE `results`
(
    `resultId`        INTEGER
        primary key,
    `raceId`          INTEGER not null default 0 ,
    `driverId`        INTEGER not null default 0 ,
    `constructorId`   INTEGER not null default 0 ,
    `number`          INTEGER,
    `grid`            INTEGER not null default 0 ,
    `position`        INTEGER,
    `positionText`    TEXT    not null default '',
    `positionOrder`   INTEGER not null default 0 ,
    `points`          REAL   not null default 0 ,
    `laps`            INTEGER not null default 0 ,
    `time`            TEXT,
    `milliseconds`    INTEGER,
    `fastestLap`      INTEGER,
    `rank`            INTEGER default 0,
    `fastestLapTime`  TEXT,
    `fastestLapSpeed` TEXT,
    `statusId`        INTEGER not null default 0 ,
    foreign key (`raceId`) references `races`(`raceId`),
    foreign key (`driverId`) references `drivers`(`driverId`),
    foreign key (`constructorId`) references `constructors`(`constructorId`),
    foreign key (`statusId`) references `status`(`statusId`)
)