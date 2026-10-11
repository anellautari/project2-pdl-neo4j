PROFILE
MATCH 
(p:Paper)-[:COVERS]->(t:Topic)
RETURN 
t.topicName AS topic,
count(p) AS jumlah_paper
ORDER BY jumlah_paper DESC;
