SET search_path = jardindb;

DROP SCHEMA IF EXISTS JARDINDB CASCADE;
CREATE SCHEMA JARDINDB;

CREATE TYPE DIMENSIONS AS (largeur NUMERIC(10, 2), longueur NUMERIC(10,2));
CREATE TYPE COORDONNEES AS (coordonneesX INTEGER, coordonneesY INTEGER);
CREATE TYPE COORDONNEES_GEOGRAPHIQUE AS (longitude NUMERIC(9,6), latitude NUMERIC(9,6));

-- maybe a constraint to say that at least one boolean value is true
CREATE TABLE IF NOT EXISTS JARDINDB.Jardin (
    jardinId     VARCHAR(10)    NOT NULL,
    nom          VARCHAR(20)    NOT NULL,
    surface      NUMERIC(6,2)   ,
	estPotager   Boolean        NOT NULL,
	estOrnement  Boolean        NOT NULL,
	estVerger    Boolean        NOT NULL,
	typeSol      VARCHAR(30),
	hauteurMax   NUMERIC(6,2),
    PRIMARY KEY (jardinId)
);

CREATE TABLE IF NOT EXISTS JARDINDB.Parcelle(
	coordonnees   COORDONNEES    NOT NULL,
    dimensions     DIMENSIONS    NOT NULL,
	jardinId     VARCHAR(10)     NOT NULL,
    FOREIGN KEY(jardinId) REFERENCES JARDINDB.Jardin(jardinId) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (jardinId, coordonnees) 
);

CREATE TABLE IF NOT EXISTS JARDINDB.Rang(
    numero         Integer             NOT NULL,
    cordonnesGeo   COORDONNEES_GEOGRAPHIQUE NOT NULL,
    estJachere     Boolean                  NOT NULL,
    periodeJachere NUMERIC(3, 0)            CONSTRAINT max_periode_jachere CHECK (periodeJachere < 365),          
	coordonnees    COORDONNEES              NOT NULL,
	jardinId       VARCHAR(10)              NOT NULL,
    FOREIGN KEY(jardinId, coordonnees) REFERENCES JARDINDB.Parcelle(jardinId, coordonnees) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (jardinId, coordonnees,numero)
);

CREATE TABLE IF NOT EXISTS JARDINDB.PlanteInfo(
    nomLatin       VARCHAR(30)     NOT NULL,
    nom            VARCHAR(30)    NOT NULL,
    categorie      VARCHAR(30)    ,
    typePlante     VARCHAR(30)    ,
	sousType       VARCHAR(40),
    PRIMARY KEY(nomLatin)
);

CREATE TABLE IF NOT EXISTS JARDINDB.Variete(
    nomVariete           VARCHAR(60)     NOT NULL,
    anneeMiseMarche      NUMERIC(4,0)    NOT NULL,
    descriptionSemis     VARCHAR(120)    ,
	plantation           VARCHAR(60)     ,
    entretien            VARCHAR(60)     ,
    recolte              VARCHAR(60)     ,
	periodeMisePlace     VARCHAR(60)     ,
    periodeRecolte       VARCHAR(60)     ,
    commentaire          VARCHAR(60)     ,
    typeSol              VARCHAR(60)     ,
    estBiologique        Boolean         DEFAULT false,
	PRIMARY KEY (nomVariete)
);


CREATE TABLE IF NOT EXISTS JARDINDB.Plante(
	planteId       VARCHAR(10)    NOT NULL,
    nomLatin       VARCHAR(30)     NOT NULL,
	jardinId       VARCHAR(10),
    nomVariete     VARCHAR(60),
    FOREIGN KEY(nomLatin) REFERENCES JARDINDB.PlanteInfo(nomLatin) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(jardinId) REFERENCES JARDINDB.Jardin(jardinId) ON DELETE SET NULL ,
    FOREIGN KEY(nomVariete) REFERENCES JARDINDB.Variete(nomVariete) ON DELETE SET NULL ON UPDATE CASCADE,
	PRIMARY KEY (planteId)
);



CREATE TABLE IF NOT EXISTS JARDINDB.CombinaisonPlante(
    effet       VARCHAR(60)     NOT NULL,
    InfoPlante1   VARCHAR(30)    NOT NULL,
    InfoPlante2   VARCHAR(30)    NOT NULL,
	FOREIGN KEY(InfoPlante1) REFERENCES JARDINDB.PlanteInfo(nomLatin) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(InfoPlante2) REFERENCES JARDINDB.PlanteInfo(nomLatin) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (InfoPlante1, InfoPlante2,effet)
);


CREATE TABLE IF NOT EXISTS JARDINDB.Menace(
    nomMenace       VARCHAR(30)     NOT NULL,
    descriptionTextuelle   VARCHAR(400)   NOT NULL,
	PRIMARY KEY (nomMenace)
);

CREATE TABLE IF NOT EXISTS JARDINDB.MenacePlante(
    nomLatin       VARCHAR(30)     NOT NULL,
    nomMenace       VARCHAR(30)     NOT NULL,
    FOREIGN KEY(nomLatin) REFERENCES JARDINDB.PlanteInfo(nomLatin) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nomMenace) REFERENCES JARDINDB.Menace(nomMenace) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(nomLatin, nomMenace)
);

CREATE TABLE IF NOT EXISTS JARDINDB.Solution(
    solution       VARCHAR(120),
    nomMenace       VARCHAR(30)     NOT NULL,
    FOREIGN KEY(nomMenace) REFERENCES JARDINDB.Menace(nomMenace) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (solution, nomMenace)
);



CREATE TABLE IF NOT EXISTS JARDINDB.Semencier(
    semencierID       VARCHAR(10)    NOT NULL,
    nom               VARCHAR(30)    NOT NULL,
    siteWeb           VARCHAR(60)    NOT NULL,
	PRIMARY KEY (semencierID)
);

CREATE TABLE IF NOT EXISTS JARDINDB.ProductionVariete(
    semencierID       VARCHAR(10)    NOT NULL,
    nomVariete        VARCHAR(30)    NOT NULL,
	FOREIGN KEY(semencierID) REFERENCES JARDINDB.Semencier(semencierID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nomVariete) REFERENCES JARDINDB.Variete(nomVariete) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (semencierID, nomVariete)
);

CREATE TABLE IF NOT EXISTS JARDINDB.RangVariete(
    numero         Integer     NOT NULL,
	coordonnees    COORDONNEES      NOT NULL,
	jardinId       VARCHAR(10)      NOT NULL,
    nomVariete     VARCHAR(60)      NOT NULL,
	typeMiseEnplace VARCHAR(60),
    FOREIGN KEY(jardinId, coordonnees, numero) REFERENCES JARDINDB.Rang(jardinId,coordonnees, numero) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nomVariete) REFERENCES JARDINDB.Variete(nomVariete) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(jardinId, coordonnees, numero, nomVariete)
)

