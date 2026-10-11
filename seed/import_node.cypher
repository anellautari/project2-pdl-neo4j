// import node

// researcher
LOAD CSV WITH HEADERS FROM 
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/researcher.csv'
AS row

CREATE (:Researcher {
    id: row.id,
    name: row.name,
    email: row.email,
    institution_id: row.institution_id
});

// institution
LOAD CSV WITH HEADERS FROM 
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/institution.csv'
AS row

CREATE (:Institution {
    id: row.id,
    name: row.name,
    city: row.city
});

// paper
LOAD CSV WITH HEADERS FROM 
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/paper.csv'
AS row

CREATE (:Paper {
    id: row.id,
    title: row.title,
    year: toInteger(row.year),
    status: row.status
});

// topic
LOAD CSV WITH HEADERS FROM 
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/topic.csv'
AS row

CREATE (:Topic {
    id: row.id,
    topicName: row.topicName
});

// conference
LOAD CSV WITH HEADERS FROM 
'https://raw.githubusercontent.com/anellautari/project2-pdl-neo4j/refs/heads/main/data/conference.csv'
AS row

CREATE (:Conference {
    id: row.id,
    confName: row.confName,
    year: toInteger(row.year)
});
