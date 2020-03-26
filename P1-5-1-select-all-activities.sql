SELECT title, username
FROM "user"
LEFT OUTER JOIN activity
ON "user".id = owner_id
WHERE creation_date > '2019-09-01'
ORDER BY title, username