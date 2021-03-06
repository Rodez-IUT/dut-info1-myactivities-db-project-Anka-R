CREATE FUNCTION gds.pl_get_salles_avec_temps_occupation() RETURNS 
    TABLE(nom_salle varchar(250), temps_occupation interval) AS $$

    BEGIN
    RETURN QUERY SELECT nom, gds.pl_calcule_temps_occupation(nom) AS temps_occupation 
                FROM gds.salle 
                ORDER BY temps_occupation DESC, nom ASC;
    RETURN;
    END;
    $$ LANGUAGE plpgsql;