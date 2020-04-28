CREATE OR REPLACE FUNCTION gds.pl_calcule_temps_occupation(
	un_nom_de_salle character varying(250)) RETURNS interval AS $$
	
	DECLARE
		temps_occup interval;
	
	BEGIN
		SELECT * INTO temps_occup FROM gds.salle WHERE nom = un_nom_de_salle;
		IF FOUND THEN
			SELECT SUM(age(date_fin, date_debut)) INTO temps_occup FROM gds.reservation WHERE salle_id = (SELECT id
																						 FROM gds.salle
																						 WHERE nom = un_nom_de_salle);
		ELSE
			RAISE NOTICE 'Salle non trouvée';
		END IF;
		
	RETURN temps_occup;
	END;
	$$ LANGUAGE plpgsql;