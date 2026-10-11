SELECT
    r.name,
    ARRAY_AGG(p.title) AS riwayat_publikasi
FROM researcher r
JOIN authored a
ON r.id = a.researcher_id
JOIN paper p
ON a.paper_id = p.id
GROUP BY r.name;