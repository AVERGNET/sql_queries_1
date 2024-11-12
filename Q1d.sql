SELECT name AS name
FROM customer c
WHERE NOT EXISTS (
    SELECT l.type
    FROM loan l
    WHERE NOT EXISTS (
        SELECT *
        FROM borrower b, loan l2
        WHERE l2.no = lno and name = cname and l.type = l2.type
    )
)
