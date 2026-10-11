// constraint

CREATE CONSTRAINT researcher_id_unique
FOR (r:Researcher)
REQUIRE r.id IS UNIQUE;

CREATE CONSTRAINT institution_id_unique
FOR (i:Institution)
REQUIRE i.id IS UNIQUE;

CREATE CONSTRAINT paper_id_unique
FOR (p:Paper)
REQUIRE p.id IS UNIQUE;

CREATE CONSTRAINT topic_id_unique
FOR (t:Topic)
REQUIRE t.id IS UNIQUE;

CREATE CONSTRAINT conference_id_unique
FOR (c:Conference)
REQUIRE c.id IS UNIQUE;

// import node

// researcher
LOAD CSV WITH HEADERS FROM 
'file:///researcher.csv'
AS row

CREATE (:Researcher {
    id: row.id,
    name: row.name,
    email: row.email
});

// institution
LOAD CSV WITH HEADERS FROM 
'file:///institution.csv'
AS row

CREATE (:Institution {
    id: row.id,
    name: row.name,
    city: row.city
});

// paper
LOAD CSV WITH HEADERS FROM 
'file:///paper.csv'
AS row

CREATE (:Paper {
    id: row.id,
    title: row.title,
    year: toInteger(row.year),
    status: row.status
});

// topic
LOAD CSV WITH HEADERS FROM 
'file:///topic.csv'
AS row

CREATE (:Topic {
    id: row.id,
    topicName: row.topicName
});

// conference
LOAD CSV WITH HEADERS FROM 
'file:///conference.csv'
AS row

CREATE (:Conference {
    id: row.id,
    confName: row.confName,
    year: toInteger(row.year)
});


// import relationship

// AFFILIATED_WITH
LOAD CSV WITH HEADERS FROM
'file:///researcher.csv'
AS row

MATCH
(r:Researcher{id:row.id}),
(i:Institution{id:row.institution_id})

CREATE
(r)-[:AFFILIATED_WITH]->(i);

// AUTHORED
LOAD CSV WITH HEADERS FROM
'file:///authored.csv'
AS row

MATCH
(r:Researcher{id:row.researcher_id}),
(p:Paper{id:row.paper_id})

CREATE
(r)-[:AUTHORED]->(p);

// PUBLISHED_IN
LOAD CSV WITH HEADERS FROM
'file:///paper.csv'
AS row

MATCH
(p:Paper{id:row.paper_id}),
(c:Conference{id:row.conference_id})

CREATE
(p)-[:PUBLISHED_IN]->(c);

// COVERS
LOAD CSV WITH HEADERS FROM
'file:///covers.csv'
AS row

MATCH
(p:Paper{id:row.paper_id}),
(t:Topic{id:row.topic_id})

CREATE
(p)-[:COVERS]->(t);

// CITES
LOAD CSV WITH HEADERS FROM
'file:///cites.csv'
AS row

MATCH
(p1:Paper{id:row.source_paper}),
(p2:Paper{id:row.target_paper})

CREATE
(p1)-[:CITES]->(p2);