MATCH 
(r1:Researcher)-[:AUTHORED]->(p:Paper)<-[:AUTHORED]-(r2:Researcher)
WHERE id(r1)<id(r2)
WITH r1,r2,count(p) AS jumlah_paper_bersama
WHERE jumlah_paper_bersama >= 2
MERGE (r1)-[:COLLABORATES_WITH {
    jumlah_paper: jumlah_paper_bersama
}]->(r2)
RETURN 
r1.name,
r2.name,
jumlah_paper_bersama;