PROFILE
MATCH 
(p1:Paper)<-[:CITES]-(p2:Paper)
RETURN 
p1.title AS paper,
count(p2) AS jumlah_sitasi
ORDER BY jumlah_sitasi DESC;
