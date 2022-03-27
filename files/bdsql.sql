SET search_path = Jardins;

DROP SCHEMA IF EXISTS JARDINDB CASCADE;
CREATE SCHEMA JARDINDB;

CREATE TABLE IF NOT EXISTS JARDINDB.Jardin (
    jardinId     VARCHAR(10)    NOT NULL,
    nom          VARCHAR(20)    NOT NULL,
    surface      NUMERIC(6,2)   NOT NULL,
	estPotager   BIT            NOT NULL,
	estOrnement  BIT            NOT NULL,
	estVerger    BIT            NOT NULL,
	typeSol   VARCHAR(30),
	hauteurMax NUMERIC(6,2),
    PRIMARY KEY (jardinId)
);



CREATE TABLE IF NOT EXISTS JARDINDB.Parcelle(
    cordonnesX   NUMERIC(4,0)    NOT NULL,
    cordonnesY   NUMERIC(4,0)    NOT NULL,
    longueur     NUMERIC(8,3)    NOT NULL,
    largeur      NUMERIC(8,3)    NOT NULL,
	jardinId     VARCHAR(10)     NOT NULL,
    FOREIGN KEY(jardinId) REFERENCES JARDINDB.Jardin(jardinId),
	PRIMARY KEY (jardinId, cordonnesX, cordonnesY),
);

CREATE TABLE IF NOT EXISTS JARDINDB.Rang(
    numero       NUMERIC(4,0)     NOT NULL,
    latitude     NUMERIC(9,6)     NOT NULL,
    longitude    NUMERIC(9,6)     NOT NULL,
    estJachere   BIT              NOT NULL,
	cordonnesX   NUMERIC(4,0)     NOT NULL,
    cordonnesY   NUMERIC(4,0)     NOT NULL,
	jardinId     VARCHAR(10)      NOT NULL,
    FOREIGN KEY(jardinId, cordonnesX, cordonnesY) REFERENCES JARDINDB.Parcelle(jardinId, cordonnesX, cordonnesY),
	PRIMARY KEY (jardinId, cordonnesX, cordonnesY,numero),
);



CREATE TABLE IF NOT EXISTS JARDINDB.Plante(
    nomLatin       VARCHAR(60)     NOT NULL,
    nom            NUMERIC(9,6)    NOT NULL,
    categorie      NUMERIC(9,6)    NOT NULL,
    typePlante     BIT             NOT NULL,
	sousType       NUMERIC(4,0)   ,
	jardinId       VARCHAR(10)     NOT NULL,
    FOREIGN KEY(jardinId) REFERENCES JARDINDB.Parcelle(jardinId),
	PRIMARY KEY (nomLatin),
);

CREATE TABLE IF NOT EXISTS JARDINDB.PlanteJardin(
);


CREATE TABLE IF NOT EXISTS HOTELDB.Guest(
    guestNb VARCHAR(10) NOT NULL,
    nas     VARCHAR(10) UNIQUE NOT NULL,
    name    VARCHAR(20) NOT NULL,
    gender  genderType  DEFAULT 'M',
    city    VARCHAR(50) NOT NULL,
    PRIMARY KEY (guestNb)
);

CREATE TABLE IF NOT EXISTS HOTELDB.Booking(
    hotelNb     VARCHAR(10)     NOT NULL,
    roomNb      VARCHAR(10)     NOT NULL,
    guestNb     VARCHAR(10)     NOT NULL,
    dateFrom    DATE            NOT NULL,
    dateTo      DATE            NULL,
    PRIMARY KEY (hotelNb, guestNb, roomNb, dateFrom),
    FOREIGN KEY (guestNb) REFERENCES HOTELDB.Guest(guestNb)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (hotelNb, roomNb) REFERENCES HOTELDB.Room (hotelNb, roomNb)
    ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT date CHECK (dateTo >= dateFrom),
    CONSTRAINT dateFrom CHECK (dateFrom >= current_date)
);

ALTER TABLE HOTELDB.Guest ALTER gender DROP DEFAULT;