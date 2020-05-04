CREATE FUNCTION gds.pl_get_salles_avec_temps_occupation(curs refcursor) RETURNS 
    refcursor AS $$

    BEGIN
	OPEN curs FOR SELECT nom, gds.pl_calcule_temps_occupation(nom) AS temps_occupation 
                  FROM gds.salle 
                  ORDER BY temps_occupation DESC, nom ASC;
    RETURN curs;
    END;
    $$ LANGUAGE plpgsql;