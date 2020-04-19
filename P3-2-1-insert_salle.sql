CREATE OR REPLACE FUNCTION gds.insert_salle(
        un_nom character varying(250), 
        un_nb_personne_max integer)
    RETURNS gds.salle AS $$
        -- insertion de la salle
        INSERT INTO gds.salle (id, nom, nb_personnes_max, date_creation, date_modification) 
        VALUES (nextval('gds.salle_seq'), un_nom, un_nb_personne_max, now(), now())
        -- return de la salle créée
		RETURNING salle;
	$$ LANGUAGE SQL;