--Probar seguir a alguien:

INSERT INTO seguidores (seguidor_id, seguido_id)
VALUES (1, 2);

--Probar dejar de seguir:

UPDATE seguidores
SET estado = FALSE
WHERE seguidor_id = 1 AND seguido_id = 2;

--Probar reactivar:

UPDATE seguidores
SET estado = TRUE
WHERE seguidor_id = 1 AND seguido_id = 2;

SELECT *
FROM seguidores;S