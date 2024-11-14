-- Also outputs customers who have not borrowed any loans

WITH customer_loan_pairs AS (
    SELECT name, lno
    FROM customer c, borrower b 
    WHERE name = cname
    UNION
    SELECT name, 'NONE' as lno
    FROM customer c
    WHERE name NOT IN (SELECT cname FROM borrower)
)

SELECT DISTINCT c1.name as name1, c2.name as name2
FROM customer_loan_pairs c1, customer_loan_pairs c2
WHERE c1.name < c2.name
AND NOT EXISTS (
    SELECT *
    FROM customer_loan_pairs b1
    WHERE b1.name = c1.name 
    AND NOT EXISTS (
        SELECT *
        FROM customer_loan_pairs b2
        WHERE b2.name = c2.name
          AND b1.lno = b2.lno
    )
)
AND NOT EXISTS (
    SELECT *
    FROM customer_loan_pairs b1
    WHERE b1.name = c2.name 
    AND NOT EXISTS (
        SELECT *
        FROM customer_loan_pairs b2
        WHERE b2.name = c1.name
          AND b1.lno = b2.lno
    )
)
