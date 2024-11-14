-- 1)b) As a follow up, if a loan with the same loan type and loan number but has a different due date in the borrower table would it still count as 1 or two?
-- check Piazza 81
-- update consider cname and lno as primary keys so cannot be duplicates even if due is different

SELECT b.cname AS name, COUNT(b.lno) AS loanCount
FROM borrower b
GROUP BY b.cname

UNION

SELECT name AS name, 0 AS loanCount
FROM customer
WHERE name NOT IN (SELECT cname FROM borrower)
