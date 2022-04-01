SET search_path = jardins;

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
    coordonneesX   NUMERIC(4,0)    NOT NULL,
    coordonneesY   NUMERIC(4,0)    NOT NULL,
    longueur     NUMERIC(8,3)    NOT NULL,
    largeur      NUMERIC(8,3)    NOT NULL,
	jardinId     VARCHAR(10)     NOT NULL,
    FOREIGN KEY(jardinId) REFERENCES JARDINDB.Jardin(jardinId),
	PRIMARY KEY (jardinId, coordonneesX, coordonneesY)
);

CREATE TABLE IF NOT EXISTS JARDINDB.Rang(
    numero       NUMERIC(4,0)     NOT NULL,
    latitude     NUMERIC(9,6)     NOT NULL,
    longitude    NUMERIC(9,6)     NOT NULL,
    estJachere   BIT              NOT NULL,
    periodeJachere NUMERIC(3, 0),
	coordonneesX   NUMERIC(4,0)     NOT NULL,
    coordonneesY   NUMERIC(4,0)     NOT NULL,
	jardinId     VARCHAR(10)      NOT NULL,
    FOREIGN KEY(jardinId, coordonneesX, coordonneesY) REFERENCES JARDINDB.Parcelle(jardinId, coordonneesX, coordonneesY),
	PRIMARY KEY (jardinId, coordonneesX, coordonneesY,numero)
);


CREATE TABLE IF NOT EXISTS JARDINDB.Plante(
	planteId       VARCHAR(10)    NOT NULL,
    nomLatin       VARCHAR(30)     NOT NULL,
	jardinId       VARCHAR(10),
    nomVariete           VARCHAR(60)     NOT NULL,
    FOREIGN KEY(nomLatin) REFERENCES JARDINDB.PlanteInfo(nomLatin),
    FOREIGN KEY(jardinId) REFERENCES JARDINDB.Jardin(jardinId),
    FOREIGN KEY(nomVariete) REFERENCES JARDINDB.Variete(nomVariete),
	PRIMARY KEY (planteId)
);

CREATE TABLE IF NOT EXISTS JARDINDB.PlanteInfo(
    nomLatin       VARCHAR(30)     NOT NULL,
    nom            NUMERIC(9,6)    NOT NULL,
    categorie      NUMERIC(9,6)    NOT NULL,
    typePlante     VARCHAR(20)     NOT NULL,
	sousType       NUMERIC(4,0),
    PRIMARY KEY(nomLatin)
)

CREATE TABLE IF NOT EXISTS JARDINDB.CombinaisonPlante(
    effet       VARCHAR(60)     NOT NULL,
    InfoPlante1   VARCHAR(30)    NOT NULL,
    InfoPlante2   VARCHAR(30)    NOT NULL,
	FOREIGN KEY(InfoPlante1) REFERENCES JARDINDB.PlanteInfo(nomLatin),
	FOREIGN KEY(InfoPlante2) REFERENCES JARDINDB.PlanteInfo(nomLatin),
    PRIMARY KEY (InfoPlante1, InfoPlante2)
);


CREATE TABLE IF NOT EXISTS JARDINDB.Menace(
    nomMenace       VARCHAR(30)     NOT NULL,
    descriptionTextuelle   VARCHAR(400)   NOT NULL,
	PRIMARY KEY (nomMenace)
);

CREATE TABLE IF NOT EXISTS JARDINDB.MenacePlante(
    nomLatin       VARCHAR(30)     NOT NULL,
    nomMenace       VARCHAR(30)     NOT NULL,
    FOREIGN KEY(nomLatin) REFERENCES JARDINDB.PlanteInfo(nomLatin),
    FOREIGN KEY(nomMenace) REFERENCES JARDINDB.Menace(nomMenace),
    PRIMARY KEY(nomLatin, nomMenace)
)

CREATE TABLE IF NOT EXISTS JARDINDB.Solution(
    solution       VARCHAR(120),
    nomMenace       VARCHAR(30)     NOT NULL,
    FOREIGN KEY(nomMenace) REFERENCES JARDINDB.Menace(nomMenace),
	PRIMARY KEY (solution, nomMenace)
);

CREATE TABLE IF NOT EXISTS JARDINDB.Variete(
    nomVariete           VARCHAR(60)     NOT NULL,
    anneeMiseMarche      NUMERIC(4,0)    NOT NULL,
    descriptionSemis     VARCHAR(120)    NOT NULL,
	plantation           VARCHAR(60)     NOT NULL,
    entretien            VARCHAR(30)     NOT NULL,
    recolte              VARCHAR(60)     NOT NULL,
	periodeMisePlace     VARCHAR(60)     NOT NULL,
    periodeRecolte       VARCHAR(30)     NOT NULL,
    commentaire          VARCHAR(60)     NOT NULL,
    typeSol              VARCHAR(60)     NOT NULL,
    estBiologique        BIT             NOT NULL,
	PRIMARY KEY (nomVariete)
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
	FOREIGN KEY(semencierID) REFERENCES JARDINDB.Semencier(semencierID),
    FOREIGN KEY(nomVariete) REFERENCES JARDINDB.Variete(nomVariete),
	PRIMARY KEY (SemencierID, nomVariete)
);

CREATE TABLE IF NOT EXISTS JARDINDB.RangVariete(
    numero       NUMERIC(4,0)     NOT NULL,
    coordonneesX   NUMERIC(4,0)     NOT NULL,
    coordonneesY   NUMERIC(4,0)     NOT NULL,
	jardinId     VARCHAR(10)      NOT NULL,
    nomVariete           VARCHAR(60)     NOT NULL,
    FOREIGN KEY(jardinId, coordonneesX, coordonneesY, numero) REFERENCES JARDINDB.Rang(jardinId, coordonneesX, coordonneesY, numero),
    FOREIGN KEY(nomVariete) REFERENCES JARDINDB.Variete(nomVariete),
    PRIMARY KEY(jardinId, coordonneesX, coordonneesY, numero, nomVariete)
)

