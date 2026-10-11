PROFILE
MATCH (r:Researcher)-[:AUTHORED]->(p:Paper)
RETURN r.name, collect(p.title);
