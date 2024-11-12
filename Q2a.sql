UPDATE loan 
SET type='temp_jumbo'
WHERE type = 'student';

UPDATE loan 
SET type='student'
WHERE type = 'jumbo';

UPDATE loan 
SET type='jumbo'
WHERE type = 'temp_jumbo';
