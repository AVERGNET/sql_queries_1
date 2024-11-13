WITH customer_loan_pairs AS (
    SELECT name, COALESCE(b.lno, 'NONE') as lno
    FROM customer LEFT JOIN borrower b ON name = cname
)

SELECT DISTINCT c1.name as name1, c2.name as name2
FROM customer_loan_pairs c1, customer_loan_pairs c2
WHERE c1.name < c2.name
AND NOT EXISTS (
    -- Check no loans exist for c1 that c2 doesn't have
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
    -- Check no loans exist for c2 that c1 doesn't have
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
