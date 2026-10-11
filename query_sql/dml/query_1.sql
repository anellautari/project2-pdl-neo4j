UPDATE paper p
SET status='verified'
WHERE EXISTS (
    SELECT 1
    FROM authored a
    WHERE a.paper_id=p.id

)
AND EXISTS (
    SELECT 1
    FROM conference c
    WHERE c.id=p.conference_id
);