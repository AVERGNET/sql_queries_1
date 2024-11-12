WITH loan_type_count AS (
    SELECT l.no, l.type, COUNT(b.cname) as count
    FROM loan l
    LEFT JOIN borrower b ON l.no = b.lno
    GROUP BY l.no, l.type
), averages_by_type AS (
    SELECT type AS type, AVG(count) AS avg
    FROM loan_type_count
    GROUP BY type
), loans_count AS(
    SELECT no, type, COUNT(no) AS loanCount
    FROM loan l, borrower b
    WHERE no = lno
    GROUP BY no, type
)

SELECT no AS no
FROM averages_by_type avg, loans_count lc
WHERE lc.type = avg.type
  AND lc.loanCount > avg.avg