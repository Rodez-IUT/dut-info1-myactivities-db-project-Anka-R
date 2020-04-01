Les différents problèmes de la fonction create_activities_with_owner :
- "a_username VARCHAR(500)" : 500 caractères disponibles pour un nom et un prénom est un peu grand. Un "VARCHAR(70)" serait plus adapté.
- "a_user_id bigint" et "an_act_id bigint" : un bigint représente 9 223 372 036 854 775 807 possibilités. Un int (2 147 483 647 possibilités) aurait largement suffit.
- "SELECT * FROM activity where id = an_act_id" : cette instruction placée à la fin de la fonction pourrait être remplacée par "RETURNING activity" afin d'améliorer la lisibilité de la fonction.
- "an_act_descr text", "a_user_id bigint", ... : les "a" et "an" en début d'identificateurs rendent l'écriture de la fonction plus lourde et moins lisible. Il conviendrait mieux de les enlever.