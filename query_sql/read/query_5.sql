SELECT
    t.topicname AS topic,
    COUNT(p.id) AS jumlah_paper
FROM topic t
JOIN covers c ON t.id = c.topic_id
JOIN paper p ON c.paper_id = p.id
GROUP BY t.topicname
ORDER BY jumlah_paper DESC;