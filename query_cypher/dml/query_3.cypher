PROFILE
MATCH
(c:Conference)
WHERE c.year < 2020
SET c.year = 2020
RETURN 
c.confName,
c.year;
