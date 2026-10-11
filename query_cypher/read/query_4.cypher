PROFILE
MATCH 
(r:Researcher)-[:AFFILIATED_WITH]->(i:Institution)
RETURN 
i.name AS institution,
collect(r.name) AS researchers
ORDER BY institution;
