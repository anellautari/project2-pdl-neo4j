SELECT
    r1.name AS researcher_1,
    r2.name AS researcher_2,
    COUNT(p.id) AS jumlah_kolaborasi
FROM authored a1
JOIN authored a2 ON a1.paper_id = a2.paper_id
JOIN researcher r1 ON a1.researcher_id = r1.id
JOIN researcher r2 ON a2.researcher_id = r2.id
JOIN paper p ON a1.paper_id = p.id
WHERE r1.id <> r2.id
GROUP BY
    r1.name,
    r2.name
ORDER BY jumlah_kolaborasi DESC;