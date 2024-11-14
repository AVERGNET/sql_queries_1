WITH LoanCounts AS (
  SELECT l.type, COUNT(b.cname) as occurrence
  FROM loan l LEFT JOIN borrower b ON l.no = b.lno
  GROUP BY l.type
)

SELECT b.type
FROM LoanCounts b
WHERE b.type NOT IN(
    SELECT b2.type
    FROM LoanCounts b1, LoanCounts b2
    WHERE b1.occurrence < b2.occurrence
)
