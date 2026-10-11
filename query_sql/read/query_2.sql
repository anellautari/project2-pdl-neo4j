SELECT
    r.name,
    COUNT(p.id) AS jumlah_publikasi
FROM researcher r
JOIN authored a
ON r.id = a.researcher_id
JOIN paper p
ON a.paper_id = p.id
GROUP BY r.name
ORDER BY jumlah_publikasi DESC;