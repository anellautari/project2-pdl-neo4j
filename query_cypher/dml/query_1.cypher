PROFILE
MATCH (p:Paper)
WHERE EXISTS {
    MATCH (r:Researcher)-[:AUTHORED]->(p)
}
AND EXISTS {
    MATCH (p)-[:PUBLISHED_IN]->(c:Conference)
}
SET p.status = "verified"
RETURN p.title, p.status;
