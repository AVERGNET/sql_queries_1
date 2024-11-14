INSERT INTO customer
SELECT '_new_stuff_to_make_this_thing_unique_' || name AS name, credit 
FROM customer
WHERE name IN (
    SELECT cname 
    FROM loan l, borrower b
    WHERE type = 'jumbo'
      AND no = lno
);

DELETE 
FROM borrower 
WHERE cname IN (
    SELECT cname 
    FROM loan l, borrower b
    WHERE type = 'jumbo'
      AND no = lno
);

DELETE
FROM customer
WHERE name IN (
    SELECT c1.name
    FROM customer c1
    WHERE EXISTS (
        SELECT *
        FROM customer c2
        WHERE c2.name = '_new_stuff_to_make_this_thing_unique_' || c1.name
    )
);

DELETE
FROM customer
WHERE name IN (
    SELECT c1.name
    FROM customer c1
    WHERE c1.name LIKE '_new_stuff_to_make_this_thing_unique_%'
);

DELETE
FROM loan
WHERE type = 'jumbo';