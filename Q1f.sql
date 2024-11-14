-- Also outputs customers who have not borrowed any loans

WITH CustomerPairs AS (
    SELECT c1.name AS name1, c2.name AS name2
    FROM customer c1, customer c2
)

SELECT DISTINCT cp.name1 AS name1, cp.name2 AS name2
FROM CustomerPairs cp
WHERE cp.name1 < cp.name2 
AND NOT EXISTS (
    SELECT *
    FROM borrower b1
    WHERE b1.cname = cp.name1
    AND b1.lno NOT IN (
        SELECT lno
        FROM borrower b2
        WHERE b2.cname = cp.name2
    )
)
AND NOT EXISTS (
    SELECT *
    FROM borrower b1
    WHERE b1.cname = cp.name2
    AND b1.lno NOT IN (
        SELECT lno
        FROM borrower b2
        WHERE b2.cname = cp.name1
    )
)

