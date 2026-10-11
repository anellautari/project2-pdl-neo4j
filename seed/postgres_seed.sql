DROP TABLE IF EXISTS cites CASCADE;
DROP TABLE IF EXISTS covers CASCADE;
DROP TABLE IF EXISTS authored CASCADE;
DROP TABLE IF EXISTS paper CASCADE;
DROP TABLE IF EXISTS researcher CASCADE;
DROP TABLE IF EXISTS topic CASCADE;
DROP TABLE IF EXISTS conference CASCADE;
DROP TABLE IF EXISTS institution CASCADE;

CREATE TABLE institution (
    id VARCHAR(10) PRIMARY KEY,
    name TEXT,
    city TEXT
);

CREATE TABLE conference (
    id VARCHAR(10) PRIMARY KEY,
    confName TEXT,
    year INT
);

CREATE TABLE researcher (
    id VARCHAR(10) PRIMARY KEY,
    name TEXT,
    email TEXT,
    institution_id VARCHAR(10),
    FOREIGN KEY(institution_id) REFERENCES institution(id)
);

CREATE TABLE paper (
    id VARCHAR(10) PRIMARY KEY,
    title TEXT,
    year INT,
    status TEXT,
    conference_id VARCHAR(10),
    FOREIGN KEY(conference_id) REFERENCES conference(id)
);

CREATE TABLE topic (
    id VARCHAR(10) PRIMARY KEY,
    topicName TEXT
);

CREATE TABLE authored (
    researcher_id VARCHAR(10),
    paper_id VARCHAR(10),
    PRIMARY KEY(
        researcher_id,
        paper_id
    ),
    FOREIGN KEY(researcher_id) REFERENCES researcher(id),
    FOREIGN KEY(paper_id) REFERENCES paper(id)
);

CREATE TABLE covers (
    paper_id VARCHAR(10),
    topic_id VARCHAR(10),
    PRIMARY KEY(
        paper_id,
        topic_id
    ),
    FOREIGN KEY(paper_id) REFERENCES paper(id),
    FOREIGN KEY(topic_id) REFERENCES topic(id)
);

CREATE TABLE cites (
    citing_paper_id VARCHAR(10),
    cited_paper_id VARCHAR(10),
    PRIMARY KEY(
        citing_paper_id,
        cited_paper_id
    ),
    FOREIGN KEY(citing_paper_id) REFERENCES paper(id),
    FOREIGN KEY(cited_paper_id) REFERENCES paper(id)
);

-- import from csv

\copy institution FROM 'C:/Users/Anella Utari/Documents/GitHub/project2-pdl-neo4j/data/institution.csv' DELIMITER ',' CSV HEADER;
\copy conference FROM 'C:/Users/Anella Utari/Documents/GitHub/project2-pdl-neo4j/data/conference.csv' DELIMITER ',' CSV HEADER;
\copy researcher FROM 'C:/Users/Anella Utari/Documents/GitHub/project2-pdl-neo4j/data/researcher.csv' DELIMITER ',' CSV HEADER;
\copy topic FROM 'C:/Users/Anella Utari/Documents/GitHub/project2-pdl-neo4j/data/topic.csv' DELIMITER ',' CSV HEADER;
\copy paper FROM 'C:/Users/Anella Utari/Documents/GitHub/project2-pdl-neo4j/data/paper.csv' DELIMITER ',' CSV HEADER;
\copy authored FROM 'C:/Users/Anella Utari/Documents/GitHub/project2-pdl-neo4j/data/authored.csv' DELIMITER ',' CSV HEADER;
\copy covers FROM 'C:/Users/Anella Utari/Documents/GitHub/project2-pdl-neo4j/data/covers.csv' DELIMITER ',' CSV HEADER;
\copy cites FROM 'C:/Users/Anella Utari/Documents/GitHub/project2-pdl-neo4j/data/cites.csv' DELIMITER ',' CSV HEADER;