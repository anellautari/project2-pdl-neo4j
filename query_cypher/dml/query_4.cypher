MATCH (p:Paper)
WHERE p.year >= 2021
SET p.status = "recent"
RETURN 
p.title,
p.year,
p.status;