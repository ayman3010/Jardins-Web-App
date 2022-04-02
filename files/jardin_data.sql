SET search_path = jardindb;

-- Insertions des donnees Pour la Table Jardin
INSERT INTO JARDINDB.Jardin (jardinId, nom, surface, estPotager, estOrnement, estVerger) 
VALUES ('JD01', 'Jardin Lassonde', 2000.00, false, true, false);

INSERT INTO JARDINDB.Jardin (jardinId, nom, surface, estPotager, estOrnement, estVerger, typeSol) 
VALUES ('JD02', 'Jardin Principal', 2500.00, true, false, false, 'Argileux');

INSERT INTO JARDINDB.Jardin (jardinId, nom, surface, estPotager, estOrnement, estVerger, typeSol, hauteurMax) 
VALUES ('JD03', 'Jardin des neiges', 1000.00, false,true, false, 'Sableux', 4 );

INSERT INTO JARDINDB.Jardin (jardinId, nom, surface, estPotager, estOrnement, estVerger, typeSol, hauteurMax) 
VALUES ('JD04', 'Jardin Polytechnique', 3000.00, false, false, true, 'Silicieux', 0);

INSERT INTO JARDINDB.Jardin (jardinId, nom, surface, estPotager, estOrnement, estVerger, typeSol, hauteurMax) 
VALUES ('JD05', 'Jardin INF3710', 500.00, true, true, false, 'Tourbeux', 2 );

-- Insertion des donnees pour la Table Parcelle
-- Jardin Lassonde
INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 0):: COORDONNEES, (325.000, 100.000):: DIMENSIONS, 'JD01');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 0):: COORDONNEES, (554.000, 120.000) :: DIMENSIONS, 'JD01');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 1):: COORDONNEES ,(200.000, 210.000) :: DIMENSIONS, 'JD01');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 1):: COORDONNEES, (236.000, 230.000) :: DIMENSIONS, 'JD01');

-- Jardin Principal
INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 0):: COORDONNEES, (234.000, 230.000):: DIMENSIONS, 'JD02');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 1):: COORDONNEES, (763.000, 120.000):: DIMENSIONS, 'JD02');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 0):: COORDONNEES, (324.000, 210.000):: DIMENSIONS, 'JD02');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 1):: COORDONNEES, (324.000, 210.000):: DIMENSIONS, 'JD02');

-- Jardin des neiges
INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 0):: COORDONNEES, (674.000, 230.000):: DIMENSIONS, 'JD03');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 0):: COORDONNEES, (274.000, 540.000):: DIMENSIONS, 'JD03');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((2, 0):: COORDONNEES, ( 345.000, 210.000):: DIMENSIONS, 'JD03');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 1):: COORDONNEES, (657.000, 110.000):: DIMENSIONS, 'JD03');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 1):: COORDONNEES, (756.000, 90.000):: DIMENSIONS, 'JD03');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((2, 1):: COORDONNEES, (345.000, 1110.000):: DIMENSIONS, 'JD03');

-- Jardin Polytechnique
INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 0):: COORDONNEES, (234.000, 100.000):: DIMENSIONS, 'JD04');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 0):: COORDONNEES, (435.000, 50.000):: DIMENSIONS, 'JD04');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((2, 0):: COORDONNEES, (454.000, 30.000):: DIMENSIONS, 'JD04');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 1):: COORDONNEES, (345.000, 300.000):: DIMENSIONS, 'JD04');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 1):: COORDONNEES, (654.000, 140.000):: DIMENSIONS, 'JD04');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((2, 1):: COORDONNEES, (121.000, 120.000):: DIMENSIONS, 'JD04');


-- Jardin INF3710
INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 0):: COORDONNEES, (345.000, 110.000):: DIMENSIONS, 'JD05');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 0):: COORDONNEES, (345.000, 70.000):: DIMENSIONS, 'JD05');


INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((2, 0):: COORDONNEES, (345.000, 1020.000):: DIMENSIONS, 'JD05');

INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((0, 1):: COORDONNEES, (435.000, 541.000):: DIMENSIONS, 'JD05');


INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((1, 1):: COORDONNEES, (143.000, 343.000):: DIMENSIONS, 'JD05');


INSERT INTO JARDINDB.Parcelle (coordonnees, dimensions, jardinId)
VALUES ((2, 2):: COORDONNEES, (453.000, 164.000):: DIMENSIONS, 'JD05');


-- Insertion des donnees pour la Table Rang
-- Jardin Lassonde 
-- Parcelle 1
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (576.234323, 234.123432), false, ( 0, 0) , 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere,coordonnees, jardinId)
VALUES (1, (243.234323, 234.123432), true, 10, (0, 0), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (758.234323, 345.123432), false, (0, 0), 'JD01');
-- Parcelle 2
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (346.234323, 454.123432), false, (1, 0), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (1, (563.234323, 764.123432), true, 100, (1, 0), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere,coordonnees, jardinId)
VALUES (2, (403.234323, 235.123432), false, (1, 0), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (3, (876.234323, 253.123432), true, 34, (0,0), 'JD01');
-- Parcelle 3
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (445.234323, 126.123432), false, (0, 1), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (168.234323, 452.123432), true,(0,  1), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (463.234323, 865.123432), false,  (0, 1), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (3, (760.234323, 822.123432), false, ( 0, 1), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (4, (463.234323, 345.1234320), false, 214,(0, 1), 'JD01');
-- Parcelle 4
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (463.234323, 434.123432), false,  (1, 1), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (1, (243.234323, 354.123432), true, 341, (1, 1), 'JD01');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (175.234323, 643.123432), false, (1, 1), 'JD01');
-- Jardin Principal
-- Parcelle 1
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (110.234323, 345.123432), false,  (0, 0), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (110.234323, 354.123432), false,  (0, 0), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (110.234323, 643.123432), false, (0, 0), 'JD02');
-- Parcelle 2 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (185.234323, 325.123432), false,  (1, 0), 'JD02');

INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (156.234323, 454.123432), false,  (1, 0), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (110.234323, 343.123432), false, (1, 0), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (3, (134.234323, 345.123432), false, (1, 0), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (4, (115.234323, 345.123432), false,  (1, 0), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (5, (110.234323, 657.123432), false,  (1, 0), 'JD02');
-- -- Parcelle 3
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (115.234323, 334.123432), false,  (0, 1), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (134.234323, 454.123432), false,  (0, 1), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (645.234323, 435.123432), false,  (0, 1) , 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (3, (876.234323, 456.123432), false,  (0, 1), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (4, (326.234323, 454.123432), false,  (0, 1), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (5, (567.234323, 234.123432), false, ( 0, 1), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (6, (345.234323, 342.123432), false,  (0, 1), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (7, (156.234323, 645.123432), false,  (0, 1), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (8, (176.234323, 453.123432), false,  (0, 1), 'JD02');
-- -- Parcelle 4 (2)
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (233.234323, 654.123432), false, (1, 1), 'JD02');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (643.234323, 234.123432), false,  (1, 1), 'JD02');
-- Jardin des neiges 
-- Parcelle 1 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (867.234323, 434.123432), false, (0, 0), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (1, (765.234323, 656.123432), true, 231, (0, 0), 'JD03');
-- Parcelle 2 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (576.234323, 423.123432), false,  (1, 0), 'JD03');
-- Parcelle 3 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (243.234323, 543.123432), false,  (2, 0), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (354.234323, 645.123432), true,  (2, 0), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (567.234323, 345.123432), false,  (2, 0), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (3, (654.234323, 644.123432), true, 321, (2, 0), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (4, (534.234323, 233.123432), false, 123, (2, 0), 'JD03');
-- -- Parcelle 4 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (567.234323, 567.123432), false,  (0, 1), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (765.234323, 363.123432), false,  (0, 1), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (465.234323, 756.123432), false,  (0, 1), 'JD03');
-- Parcelle 5
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (354.234323, 543.123432) , false,  (1, 1), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (1, (586.234323, 132.123432) , true, 332, (1, 1), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (685.234323, 432.123432), false,  (1, 1), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (3, (765.234323, 164.123432), true, 123, (1, 1), 'JD03');
-- Parcelle 6 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (567.234323, 103.123432), false, ( 2, 1), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (1, (464.234323, 520.123432), true, 364, (2, 1), 'JD03');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (678.234323, 230.123432), false, ( 2, 1), 'JD03');

-- Jardin Polytechnique 
-- Parcelle 1 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (765.234323, 354.123432), false,  (0, 0), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (745.234323, 642.123432), false,  (0, 0), 'JD04');
-- Parcelle 2 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (857.234323, 630.123432), false,  (1, 0), 'JD04');
-- Parcelle 3 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (765.234323, 923.123432), false,  (2, 0), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (675.234323, 531.123432), false,  (2, 0), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (525.234323, 345.123432), false,  (2, 0), 'JD04');

INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (3, (253.234323, 654.123432), false,  (2, 0), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (4, (354.234323, 234.123432), false,  (2, 0), 'JD04');

-- -- Parcelle 4
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (467.234323, 562.123432), false,  (0, 1), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (453.234323, 834.123432), false,  (0, 1), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (867.234323, 719.123432), false,  (0, 1), 'JD04');

-- -- Parcelle 5
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (765.234323, 987.123432), false,  (1, 1), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
 VALUES (1, (345.234323, 435.123432), false,  (1, 1), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (756.234323, 532.123432), false,  (1, 1), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (3, (645.234323, 234.123432), false,  (1, 1), 'JD04');
-- -- Parcelle 6
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (321.234323, 345.123432), false,  (2, 1), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (445.234323, 645.123432), false,  (2, 1), 'JD04');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (753.234323, 235.123432), false,  (2, 1), 'JD04');
-- Jardin INF3710
-- Parcelle 1
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (867.234323, 242.123432), false, (0, 0), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (567.234323, 475.123432), false,  (0, 0), 'JD05');
-- Parcelle 2
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (0, (464.234323, 286.123432), true, 12, (1, 0), 'JD05');
-- Parcelle 3
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (464.234323, 245.123432), false,  (2, 0), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (1, (653.234323, 215.123432), false,  (2, 0), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (463.234323, 237.123432), false,  (2, 0), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (3, (433.234323, 356.123432), false,  (2, 0), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (4, (645.234323, 374.123432), false,  (2, 0), 'JD05');
-- -- Parcelle 4 
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (453.234323, 856.123432), false,  (0, 1), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (1, (344.234323, 245.123432), true, 215, (0, 1), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (643.234323, 224.123432), false, (0, 1), 'JD05');
-- -- Parcelle 51
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (0, (233.234323, 643.123432), true, 153,( 1, 1), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (1, (342.234323, 354.123432), true , 174, (1, 1), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (2, (456.234323, 453.123432), false,  (1, 1), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (3, (453.234323, 354.123432), false,  (1, 1), 'JD05');
-- -- Parcelle 6
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, coordonnees, jardinId)
VALUES (0, (353.234323, 435.123432), false, (2, 2), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (1, (454.234323, 746.123432), true, 34, (2, 2), 'JD05');
INSERT INTO JARDINDB.Rang (numero, cordonnesGeo, estJachere, periodeJachere, coordonnees, jardinId)
VALUES (2, (454.234323, 645.123432), true, 75, (2, 2), 'JD05');



-- Insertion des donnees pour la Table PlanteInfo
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Malus', 'Pommier', 'Arbre', 'Arbre-fruitier', 'fruit a pepin');
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Rosaceae', 'Rossier', 'Arbre', 'Arbre a fleurs', 'fleur a petales');
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Solanum', 'Pomme de terre', 'Racine', 'Racine a legumes', 'legumineuse');
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Musa', 'Bananier', 'Arbre', 'Arbre-fruitier', 'fruit a pepin');
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Heliantus', 'Tournesol', 'Fleur', 'Fleur a petale', NULL);
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Filicophytes', 'Fougeres', 'Arbuste', 'Arbuste vasculaire', NULL);
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Boletus', 'Cepe', 'Champignon', 'Champignon commestible', NULL);
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Cerasuc', 'Cerisier', 'Arbre', 'Arbre-fruitier', 'fruit a noyau');
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Cactoceae', 'Cactus', 'Arbre', 'Arbre a fleurs', 'fleur a epine');
INSERT INTO JARDINDB.PlanteInfo (nomLatin, nom, categorie, typePlante, sousType)
VALUES ('Trifolium', 'Trefle', 'Herbacee', 'Legumineuse', NULL);



-- INSERT INTO JARDINDB.Variete (nomVariete,anneeMiseMarche  ,descriptionSemis,plantation  ,entretien ,recolte, periodeMisePlace ,periodeRecolte ,commentaire ,typeSol  ,estBiologique)
-- VALUES ('tuberosum',2020,'bonne qualité','','','',true);

-- INSERT INTO JARDINDB.Variete (nomVariete,anneeMiseMarche  ,descriptionSemis,plantation  ,entretien ,recolte, periodeMisePlace ,periodeRecolte ,commentaire ,typeSol  ,estBiologique)
-- VALUES ('boskoop',2022,'','','','',false);

-- INSERT INTO JARDINDB.Variete (nomVariete,anneeMiseMarche  ,descriptionSemis,plantation  ,entretien ,recolte, periodeMisePlace ,periodeRecolte ,commentaire ,typeSol  ,estBiologique)
-- VALUES ('tuberosum',2019,'','','','','');

-- INSERT INTO JARDINDB.Variete (nomVariete,anneeMiseMarche  ,descriptionSemis,plantation  ,entretien ,recolte, periodeMisePlace ,periodeRecolte ,commentaire ,typeSol  ,estBiologique)
-- VALUES ('cyathea',2021,'','','','','');

-- INSERT INTO JARDINDB.Variete (nomVariete,anneeMiseMarche  ,descriptionSemis,plantation  ,entretien ,recolte, periodeMisePlace ,periodeRecolte ,commentaire ,typeSol  ,estBiologique)
-- VALUES ('basjoo',2017,'','','','','');


-- Insertion des donnees pour la Table Plante
-- Jardin Lassonde
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00001', 'Malus', 'JD01', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00006', 'Malus', 'JD01', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00011', 'Malus', 'JD01', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00016', 'Malus', 'JD01', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00021', 'Malus', 'JD01', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00026', 'Solanum', 'JD01', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00031', 'Solanum', 'JD01', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00036', 'Solanum', 'JD01', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00041', 'Solanum', 'JD01', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00046', 'Solanum', 'JD01', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00051', 'Filicophytes', 'JD01', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00056', 'Filicophytes', 'JD01', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00061', 'Filicophytes', 'JD01', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00066', 'Filicophytes', 'JD01', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00071', 'Filicophytes', 'JD01', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00076', 'Filicophytes', 'JD01', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00081', 'Orchidaceae', 'JD01', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00086', 'Orchidaceae', 'JD01', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00091', 'Orchidaceae', 'JD01', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00096', 'Orchidaceae', 'JD01', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00101', 'Orchidaceae', 'JD01', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00106', 'Orchidaceae', 'JD01', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00111', 'Orchidaceae', 'JD01', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00116', 'Orchidaceae', 'JD01', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00121', 'Orchidaceae', 'JD01', 'Phalaenopsis');
-- Jardin Principal
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00002', 'Malus', 'JD02', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00007', 'Malus', 'JD02', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00012', 'Malus', 'JD02', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00017', 'Malus', 'JD02', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00022', 'Malus', 'JD02', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00027', 'Malus', 'JD02', 'boskoop');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00032', 'Musa', 'JD02', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00037', 'Musa', 'JD02', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00042', 'Musa', 'JD02', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00047', 'Musa', 'JD02', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00052', 'Musa', 'JD02', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00057', 'Filicophytes', 'JD02', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00062', 'Filicophytes', 'JD02', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00067', 'Filicophytes', 'JD02', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00072', 'Filicophytes', 'JD02', 'cyathea');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00077', 'Boletus', 'JD02', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00082', 'Boletus', 'JD02', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00087', 'Boletus', 'JD02', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00092', 'Boletus', 'JD02', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00097', 'Boletus', 'JD02', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00102', 'Boletus', 'JD02', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00107', 'Boletus', 'JD02', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00112', 'Cactoceae', 'JD02', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00117', 'Cactoceae', 'JD02', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00122', 'Cactoceae', 'JD02', 'opuntia');
-- Jardin des neiges
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00003', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00008', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00013', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00018', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00023', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00028', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00033', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00038', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00043', 'Rosaceae', 'JD03', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00048', 'Solanum', 'JD03', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00053', 'Solanum', 'JD03', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00058', 'Solanum', 'JD03', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00063', 'Solanum', 'JD03', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00068', 'Solanum', 'JD03', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00073', 'Solanum', 'JD03', 'tuberosum');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00078', 'Musa', 'JD03', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00083', 'Musa', 'JD03', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00088', 'Musa', 'JD03', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00093', 'Musa', 'JD03', 'basjoo');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00098', 'Heliantus', 'JD03', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00103', 'Heliantus', 'JD03', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00108', 'Heliantus', 'JD03', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00113', 'Cerasuc', 'JD03', 'burlate');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00118', 'Cerasuc', 'JD03', 'burlate');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00123', 'Cerasuc', 'JD03', 'burlate');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00113', 'Trifolium', 'JD03', 'alexandrie');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00118', 'Trifolium', 'JD03', 'alexandrie');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00123', 'Trifolium', 'JD03', 'alexandrie');
-- Jardin Polytechnique
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00004', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00009', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00014', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00019', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00024', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00029', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00034', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00039', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00044', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00049', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00059', 'Rosaceae', 'JD04', 'innocencia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00064', 'Boletus', 'JD04', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00069', 'Boletus', 'JD04', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00074', 'Boletus', 'JD04', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00079', 'Boletus', 'JD04', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00084', 'Boletus', 'JD04', 'edulis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00089', 'Orchidaceae', 'JD04', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00094', 'Orchidaceae', 'JD04', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00099', 'Orchidaceae', 'JD04', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00104', 'Orchidaceae', 'JD04', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00109', 'Orchidaceae', 'JD04', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00114', 'Orchidaceae', 'JD04', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00119', 'Orchidaceae', 'JD04', 'Phalaenopsis');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00124', 'Trifolium', 'JD04', 'alexandrie');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00129', 'Trifolium', 'JD04', 'alexandrie');
-- Jardin INF3710
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00005', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00010', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00015', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00020', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00025', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00030', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00035', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00040', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00045', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00050', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00055', 'Heliantus', 'JD05', 'sunrich');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00060', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00065', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00070', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00075', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00080', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00085', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00090', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00095', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00100', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00105', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00110', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00115', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00120', 'Cactoceae', 'JD05', 'opuntia');
INSERT INTO JARDINDB.Plante (planteId, nomLatin, jardinId, nomVariete)
VALUES ('00125', 'Cactoceae', 'JD05', 'opuntia');



--Insertion de donnees pour la Table CombinaisonPlante 
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('secheresse', 'Rosaceae', 'Heliantus');
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('epuisement des sols', 'Malus', 'Musa');
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('protection', 'Malus', 'Cerasuc');
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('immunite', 'Rosaceae', 'Boletus');
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('symbiose', 'Solanum', 'Cactoceae');
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('ralentissement', 'Rosaceae', 'Filicophytes');
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('protection', 'Malus', 'Trifolium');
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('epuisement des sols', 'Solanum', 'Cactoceae');
INSERT INTO JARDINDB.CombinaisonPlante (effet, InfoPlante1, InfoPlante2)
VALUES ('protection', 'Solanum', 'Trifolium');

--Insertion de donnees pour la Table Menace
INSERT INTO JARDINDB.Menace (nomMenace, descriptionTextuelle)
VALUES ('Attaque de pucerons', 'Les pucerons peuvent attaquer les plantes en les grignotant, empechant ainsi les developpement de ces dernieres');
INSERT INTO JARDINDB.Menace (nomMenace, descriptionTextuelle)
VALUES ('Deracinement', 'Certaines plantes si elles sont dans un type de sol inadequats peuvent voir leurs racines remonter a la surface et ainsi auront plus de mal a sapprivosionner dans le sol');
INSERT INTO JARDINDB.Menace (nomMenace, descriptionTextuelle)
VALUES ('Manque de luminosite', 'Certaines plantes ont besoin de beaucoup de lumiere, si elles en manquent a cause dun objet causant une ombre ou naturellement, cela pourrait restreindre leur developpement');
INSERT INTO JARDINDB.Menace (nomMenace, descriptionTextuelle)
VALUES ('Attaque de vers', 'Les vers attaque les racines de certaintes plantes et ainsi empechent ces dernieres de sapprovisioner');
INSERT INTO JARDINDB.Menace (nomMenace, descriptionTextuelle)
VALUES ('Attaque doiseaux', 'Les oiseaux saliment de certaines plantes, si ils ne sont pas repousser, ils viennent attaquer certaines plantation');
INSERT INTO JARDINDB.Menace (nomMenace, descriptionTextuelle)
VALUES ('Secheresse', 'Certaines plantes peuvent avoir du mal a salimenter en eau dans certains type de sol et ainsi peuvent secher et mourir');


--Insertion de donnees pour la Table MenacePlante
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Malus', 'Attaque de pucerons');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Filicophytes', 'Attaque de pucerons');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Cerasuc', 'Attaque de pucerons');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Rosaceae', 'Deracinement');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Solanum', 'Deracinement');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Boletus', 'Deracinement');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Rosaceae', 'Manque de luminosite');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Filicophytes', 'Manque de luminosite');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Cactoceae', 'Manque de luminosite');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Cerasuc', 'Attaque de vers');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Solanum', 'Attaque de vers');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Musa', 'Attaque de vers');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Trifolium', 'Attaque doiseaux');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Musa', 'Attaque doiseaux');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Rosaceae', 'Attaque doiseaux');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Rosaceae', 'Secheresse');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Filicophytes', 'Secheresse');
INSERT INTO JARDINDB.MenacePlante (nomLatin, nomMenace)
VALUES ('Trifolium', 'Secheresse');

--Insertion de donnees pour la Table Solution
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Utiliser des insecticides', 'Attaque de pucerons');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Mettre des baches anti-pucerons', 'Attaque de pucerons');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Appliquer des produits anti-deracinement', 'Deracinement');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Eviter les ombres dobjets volumineux', 'Manque de luminosite');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Placement de lumiere artificielles', 'Manque de luminosite');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Barriere de produit contre les vers dans le sol', 'Attaque de vers');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Machine dhumidification des sols', 'Secheresse');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Arrosage automatique', 'Secheresse');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Pantin de bois', 'Attaque doiseaux');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Baches en plastique', 'Attaque doiseaux');
INSERT INTO JARDINDB.Solution (solution, nomMenace)
VALUES ('Produit toxique pour les oiseaux', 'Attaque doiseaux');


--Insertion de donnees pour la Table Variete

--Insertion de donnees pour la Table Semancier

--Insertion de donnees pour la Table ProductionVariete

--Insertion de donnees pour la Table RangVariete