PROFILE
MATCH (r1:Researcher)-[:AUTHORED]->(p:Paper)<-[:AUTHORED]-(r2:Researcher)
WHERE r1 <> r2
RETURN r1.name, r2.name, count(p) AS jumlah_kolaborasi
ORDER BY jumlah_kolaborasi DESC;
