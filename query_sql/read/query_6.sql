SELECT
    p1.title AS paper,
    COUNT(p2.citing_paper_id) AS jumlah_sitasi
FROM paper p1
JOIN cites p2 ON p1.id = p2.cited_paper_id
GROUP BY p1.title
ORDER BY jumlah_sitasi DESC;