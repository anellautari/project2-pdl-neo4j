PROFILE
MATCH (r:Researcher)-[:AUTHORED]->(p:Paper)
RETURN r.name, count(p) AS jumlah_publikasi
ORDER BY jumlah_publikasi DESC;
