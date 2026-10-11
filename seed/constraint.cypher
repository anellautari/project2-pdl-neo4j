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
