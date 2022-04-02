SET search_path = jardindb;

-- 1) (2 points) Lister toutes les plantes qui sont actuellement dans les rangs d’un jardin
-- 2) (2 points) Lister le nombre de rangs minimum et maximum sur les parcelles d’un jardin donné (choisissez-en dans vos données)

select min(S.nbRang) as minNbRang, max(s.nbRang) as maxNbRang
from (SELECT jardinId, coordonnees, count(*) as nbRang
FROM rang
WHERE jardinId = 'JD01'
GROUP BY jardinId, coordonnees) S;

-- 3) (2 points) Lister les détails des parcelles qui ont la variété de plante A et la variété de plante B
SELECT *
FROM parcelle P
WHERE EXISTS(
	SELECT * 
	FROM rang R
	WHERE R.JardinId = P.jardinId AND R.coordonnees = P.coordonnees AND EXISTS (
		SELECT * 
		FROM RangVariete RV
	    WHERE R.numero = RV.numero AND R.JardinId = RV.jardinId AND R.coordonnees = RV.coordonnees 
		AND (RV.nomVariete = 'boskoop') ))
INTERSECT
SELECT *
FROM parcelle P
WHERE EXISTS(
	SELECT * 
	FROM rang R
	WHERE R.JardinId = P.jardinId AND R.coordonnees = P.coordonnees AND EXISTS (
		SELECT * 
		FROM RangVariete RV
	    WHERE R.numero = RV.numero AND R.JardinId = RV.jardinId AND R.coordonnees = RV.coordonnees AND RV.nomVariete = 'cyathea'));
	    
-- 4) (2 points) Lister les détails des parcelles qui ont la variété de plante A ou la variété de plante B 

SELECT *
FROM parcelle P
WHERE EXISTS(
	SELECT * 
	FROM rang R
	WHERE R.JardinId = P.jardinId AND R.coordonnees = P.coordonnees AND EXISTS (
		SELECT * 
		FROM RangVariete RV
	    WHERE R.numero = RV.numero AND R.JardinId = RV.jardinId AND R.coordonnees = RV.coordonnees 
		AND (RV.nomVariete = 'boskoop' OR RV.nomVariete = 'cythea' ) ));
-- 5) (2 points) Lister les détails des parcelles qui ont la variété de plante A mais pas la variété de plante B


-- 6) (2 points) Lister tous les rangs d’un jardin donné avec leurs variétés de plantes s’ils sont cultivés. Dans le cas contraire, affichez null.
SELECT R.numero,R.JardinId ,R.coordonnees,R.estJachere,R.periodeJachere, RV.nomVariete
FROM Rang R LEFT JOIN RangVariete RV
ON R.numero = RV.numero AND R.JardinId = RV.jardinId AND R.coordonnees = RV.coordonnees 
WHERE R.jardinId = 'JD01' 
ORDER BY numero, coordonnees;

-- 7) (2 points) Quel est le nombre de jardins uniquement avec des semences biologiques ?



-- 8) (2 points) Lister tous les jardins qui ont au moins un rang en jachère
SELECT DISTINCT JardinId, nom,surface
FROM JARDIN J JOIN PARCELLE P using (JardinId)
WHERE EXISTS (SELECT * from rang R
			 WHERE P.jardinId = R.jardinId AND P.coordonnees = R.coordonnees AND R.estJachere = true )
ORDER BY JardinId;
-- 9) (2 points) Quelles sont les menaces auxquelles sont sensibles les plantes fougères ?


-- 10) (2 points) Quelles sont les plantes de la variété tuberosum ?
SELECT *
FROM plante P 
WHERE nomVariete = 'tuberosum';



















