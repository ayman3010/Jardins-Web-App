SET search_path = jardindb;
CREATE OR REPLACE FUNCTION sauvegarder_historique_variete() RETURNS TRIGGER AS $historique_variete$
BEGIN
CREATE TABLE IF NOT EXISTS JARDINDB.HistoriqueVariete(
	 jardinId     VARCHAR(10)    NOT NULL,
	 nomVariete        VARCHAR(30)    NOT NULL,
	 dateAjout         timestamp           NOT NULL
);
IF(TG_OP='INSERT') THEN
INSERT INTO JARDINDB.HistoriqueVariete VALUES(NEW.jardinId,NEW.nomVariete, NOW() );
END IF;
RETURN NEW;
END;
$historique_variete$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER historique_variete 
AFTER INSERT ON JARDINDB.RangVariete
FOR EACH ROW EXECUTE PROCEDURE sauvegarder_historique_variete();

INSERT INTO JARDINDB.RangVariete ( numero, coordonnees, jardinId, nomVariete, typeMiseEnplace )
VALUES(0, (2,0),'JD05','boskoop','');

SELECT * FROM HistoriqueVariete;



