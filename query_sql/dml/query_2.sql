CREATE TABLE collaborates_with (
    researcher1_id VARCHAR(10),
    researcher2_id VARCHAR(10),
    jumlah_paper INT,
    PRIMARY KEY (
        researcher1_id,
        researcher2_id
    ),
    FOREIGN KEY (researcher1_id) REFERENCES researcher(id),
    FOREIGN KEY (researcher2_id) REFERENCES researcher(id)
);

INSERT INTO collaborates_with (
    researcher1_id,
    researcher2_id,
    jumlah_paper
)

SELECT
    LEAST(a1.researcher_id, a2.researcher_id) AS researcher1_id,
    GREATEST(a1.researcher_id, a2.researcher_id) AS researcher2_id,
    COUNT(a1.paper_id) AS jumlah_paper_bersama
FROM authored a1
JOIN authored a2 ON a1.paper_id = a2.paper_id
WHERE a1.researcher_id < a2.researcher_id
GROUP BY
    LEAST(a1.researcher_id, a2.researcher_id),
    GREATEST(a1.researcher_id, a2.researcher_id)
HAVING COUNT(a1.paper_id) >= 2;