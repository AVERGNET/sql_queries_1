-- 1a) Customers’ credit rating may decrease after they got a loan. 
        -- Find (customer,loan) pairs where the customer no longer satisfies 
        -- the minimum credit required by the loan. The output schema 
        -- should be (name, no).
-- Handles NULL for credit

SELECT DISTINCT c.name AS name, l.no AS no
FROM borrower b, customer c, loan l
WHERE b.cname = c.name AND l.no = b.lno
  AND c.credit < l.minCredit

  -- test