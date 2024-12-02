-- name: CreateEntry :one
INSERT INTO entries (
    amount, 
    account_id

) VALUES (
    $1, $2
) RETURNING *;

-- name: GetEntry :one 
SELECT * FROM entries
WHERE entry_id = $1 LIMIT 1;


-- name: ListEntries :many
SELECT * FROM entries
WHERE account_id = $1
ORDER BY entry_id
LIMIT $2
OFFSET $3;


-- -- name: UpdateEntry :exec
-- UPDATE entries 
-- SET balance = $2
-- WHERE entry_id = $1;


-- -- name: DeleteEntry :exec
-- DELETE FROM entries
-- WHERE entry_id = $1;