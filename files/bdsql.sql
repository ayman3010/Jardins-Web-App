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
	PRIMARY KEY (jardinId, cordonnesX, cordonnesY)
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
	PRIMARY KEY (jardinId, cordonnesX, cordonnesY,numero)
);


CREATE TABLE IF NOT EXISTS JARDINDB.Plante(
	planteId       Numeric(6,0)    NOT NULL,
    nomLatin       VARCHAR(60)     NOT NULL,
    nom            NUMERIC(9,6)    NOT NULL,
    categorie      NUMERIC(9,6)    NOT NULL,
    typePlante     BIT             NOT NULL,
	sousType       NUMERIC(4,0),
	jardinId       VARCHAR(10)     NOT NULL,
    FOREIGN KEY(jardinId) REFERENCES JARDINDB.Jardin(jardinId),
	PRIMARY KEY (planteId)
);

CREATE TABLE IF NOT EXISTS JARDINDB.CombinaisonPlante(
    effet       VARCHAR(60)     NOT NULL,
    plante1Id   Numeric(6,0)    NOT NULL,
    plante2Id   Numeric(6,0)    NOT NULL,
	jardinId    VARCHAR(10)     NOT NULL,
	PRIMARY KEY (plante1Id, plante2Id),
	FOREIGN KEY(plante1ID) REFERENCES JARDINDB.Plante(planteID),
	FOREIGN KEY(plante1ID) REFERENCES JARDINDB.Plante(planteID)
);


CREATE TABLE IF NOT EXISTS JARDINDB.Menace(
    nomMenace       VARCHAR(30)     NOT NULL,
    description    VARCHAR(120)   NOT NULL,
	planteId       Numeric(6,0)   NOT NULL,
    FOREIGN KEY(planteId) REFERENCES JARDINDB.Plante(planteId),
	PRIMARY KEY (nomMenace)
);

CREATE TABLE IF NOT EXISTS JARDINDB.Solution(
    solution       VARCHAR(120)   ,
    nomMenace       VARCHAR(30)     NOT NULL,
    FOREIGN KEY(nomMenace) REFERENCES JARDINDB.Menace(nomMenace),
	PRIMARY KEY (solution, nomMenace)
);
CREATE TABLE IF NOT EXISTS JARDINDB.Semencier(
    semencierID       VARCHAR(60)    NOT NULL,
    nom               VARCHAR(30)    NOT NULL,
    siteWeb           VARCHAR(60)    ,
	PRIMARY KEY (semencierID)
);
CREATE TABLE IF NOT EXISTS JARDINDB.Variete(
    nomVariete                 VARCHAR(60)     NOT NULL,
    anneeMiseMarche      NUMERIC(4,0)    NOT NULL,
    descriptionSemis     VARCHAR(120)    NOT NULL,
	plantation           VARCHAR(60)     NOT NULL,
    entretien            VARCHAR(30)     NOT NULL,
    recolte              VARCHAR(60)     NOT NULL,
	periodeMisePlace     VARCHAR(60)     NOT NULL,
    periodeRecolte       VARCHAR(30)     NOT NULL,
    commentaire          VARCHAR(60)     NOT NULL,
    typeSol              VARCHAR(60)     NOT NULL,
	PRIMARY KEY (nomVariete)
);


CREATE TABLE IF NOT EXISTS JARDINDB.productionVariete(
    semencierID       VARCHAR(60)    NOT NULL,
    nomVariete        VARCHAR(30)    NOT NULL,
    estBiologique     BIT   ,
	FOREIGN KEY(semencierId) REFERENCES JARDINDB.Semencier(semencierId),
    FOREIGN KEY(nomVariete) REFERENCES JARDINDB.Variete(nomVariete),
	PRIMARY KEY (SemencierID, nomVariete)
);

