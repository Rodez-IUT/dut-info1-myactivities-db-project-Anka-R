CREATE OR REPLACE FUNCTION gds.pl_insert_salle(
		un_nom character varying(250),
		un_nb_personne_max integer) RETURNS gds.salle AS $$
		
	DECLARE
		salle_cree gds.salle%ROWTYPE;
	
	BEGIN
		INSERT INTO gds.salle (id, nom, nb_personnes_max, date_creation, date_modification) 
		VALUES (nextval('gds.salle_seq'), un_nom, un_nb_personne_max, now(), now())
		RETURNING * INTO salle_cree;
		
	RETURN salle_cree;
	END;
	$$ LANGUAGE plpgsql;