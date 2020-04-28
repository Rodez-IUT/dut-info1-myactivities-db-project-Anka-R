CREATE OR REPLACE FUNCTION gds.pl_insert_reservation(
        une_date_debut timestamp without time zone,
        une_date_fin timestamp without time zone,
        un_nom_de_salle character varying(250)) RETURNS gds.reservation AS $$
		
	DECLARE
		reserv_cree gds.reservation%ROWTYPE;
		id_salle integer;
	
	BEGIN
		SELECT id INTO id_salle FROM gds.salle WHERE nom = un_nom_de_salle;
		
		IF FOUND THEN
			INSERT INTO gds.reservation (id, date_debut, date_fin, date_creation, date_modification, salle_id) 
			VALUES (nextval('gds.reservation_seq'), une_date_debut, une_date_fin, now(), now(), id_salle)
			RETURNING * INTO reserv_cree;
		ELSE
			RAISE NOTICE 'Salle non trouvée';
		END IF;
		
	RETURN reserv_cree;
	END;
	$$ LANGUAGE plpgsql;