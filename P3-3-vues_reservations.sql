CREATE VIEW gds.vue_reservations AS
    SELECT
        res.id as id_reservation,
        sal.nom as nom_salle,
        res.date_debut as debut_reservation,
        res.date_fin as fin_reservation
    FROM gds.salle sal
    JOIN gds.reservation res
    ON sal.id = res.salle_id
    ORDER BY nom_salle, debut_reservation DESC