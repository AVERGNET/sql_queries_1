UPDATE loan 
SET type='temp_jumbo_more_stuff_to_make_unique'
WHERE type = 'student';

UPDATE loan 
SET type='student'
WHERE type = 'jumbo';

UPDATE loan 
SET type='jumbo'
WHERE type = 'temp_jumbo_more_stuff_to_make_unique';
