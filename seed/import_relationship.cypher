// import relationship

// AFFILIATED_WITH
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/researcher.csv'
AS row

MATCH
(r:Researcher{id:row.id}),
(i:Institution{id:row.institution_id})

CREATE
(r)-[:AFFILIATED_WITH]->(i);

// AUTHORED
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/authored.csv'
AS row

MATCH
(r:Researcher{id:row.researcher_id}),
(p:Paper{id:row.paper_id})

CREATE
(r)-[:AUTHORED]->(p);

// PUBLISHED_IN
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/paper.csv'
AS row

MATCH
(p:Paper{id:row.id}),
(c:Conference{id:row.conference_id})

CREATE
(p)-[:PUBLISHED_IN]->(c);

// COVERS
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/covers.csv'
AS row

MATCH
(p:Paper{id:row.paper_id}),
(t:Topic{id:row.topic_id})

CREATE
(p)-[:COVERS]->(t);

// CITES
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/cites.csv'
AS row

MATCH
(p1:Paper{id:row.source_paper}),
(p2:Paper{id:row.target_paper})

CREATE
(p1)-[:CITES]->(p2);
