SELECT
    i.name AS institution,
    ARRAY_AGG(r.name) AS researchers
FROM institution i
JOIN researcher r ON i.id = r.institution_id
GROUP BY i.name
ORDER BY institution;