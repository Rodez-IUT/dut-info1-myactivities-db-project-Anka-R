CREATE OR REPLACE FUNCTION find_activities_older_than(old_dat date) 
    RETURNS SETOF activity AS $$
        SELECT *
		FROM activity
		WHERE modification_date < old_dat
	$$ LANGUAGE SQL;