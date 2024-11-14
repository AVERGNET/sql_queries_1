-- Still outputs customers if they do not borrow a loan of type NULL 
-- piazza @156
-- https://piazza.com/class/m1jpqujznjy121/post/156

SELECT name AS name
FROM customer c
WHERE NOT EXISTS (
    SELECT l.type
    FROM loan l
    WHERE l.type IS NOT NULL 
    AND NOT EXISTS (
        SELECT *
        FROM borrower b, loan l2
        WHERE l2.no = b.lno and c.name = b.cname and l.type = l2.type
    )
)