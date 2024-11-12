-- 1)c) answer to piazza question kinda applies to this
WITH borrowed AS (
    SELECT type AS type, COUNT(*) AS occurrence
    FROM loan l, borrower b
    WHERE l.no = b.lno
    GROUP BY l.type
    
    UNION
    
    SELECT type AS type, 0 AS occurrence
    FROM loan
    WHERE no NOT IN (SELECT lno FROM borrower)
)

SELECT b.type
FROM borrowed b
WHERE b.type NOT IN(
    SELECT b2.type
    FROM borrowed b1, borrowed b2
    WHERE b1.occurrence < b2.occurrence
)