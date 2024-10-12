SELECT substring(title, 1, 3) FROM books;

SELECT * FROM books
WHERE substring(title, 1, 3) = 'The'
ORDER BY cost ASC;

SELECT * ,CASE author_id
	WHEN 1 THEN 'Recommended for beginners'
    WHEN 7 THEN 'Recommended for advanced'
    ELSE 'All audience'
    END AS newcol FROM books;

SELECT replace(title, 'The', '***' ) AS new_title FROM books;

SELECT replace(title, 'Shades', '******') AS new_title FROM books;

SELECT LENGTH(title) FROM books
WHERE substring(title, 1, 3) = 'The'
ORDER BY cost ASC;

SELECT CHAR_LENGTH(title) FROM books
WHERE substring(title, 1, 3) = 'The'
ORDER BY cost ASC;

SELECT LEFT(title, 3) FROM books;

SELECT RIGHT(title, 3) FROM books;

SELECT LEFT(title, 3) FROM books
WHERE LOWER(LEFT(title, 3)) = 'The';

SELECT repeat(author_id, 5) FROM books
WHERE LOWER(LEFT(title, 3)) = 'The';

SELECT LOCATE('Big', title) FROM books;

SELECT *, INSERT(title, 5, 3, 'Small') FROM books
WHERE title LIKE '%Big%';

SELECT *, INSERT(title, 5, 0, 'Small') FROM books
WHERE title LIKE '%Big%';

SELECT *, INSERT(title, LOCATE('Big', title), 3, 'Small') FROM books
WHERE title LIKE '%Big%';

SELECT *, INSERT(title, LOCATE('Big', title), 0, 'Small') FROM books
WHERE title LIKE '%Big%';

SELECT POW(2, 16);

SELECT PI();

SELECT NOW();

SELECT CONV(123, 10, 2);

SELECT ROUND(PI(), 2);

SELECT RAND();

SELECT born FROM authors;

SELECT EXTRACT(year FROM born) AS y FROM authors;

SELECT TIMESTAMPDIFF(day, born, died) AS diff , born FROM authors
WHERE died IS NOT NULL AND born IS NOT NULL
ORDER BY diff DESC;

SELECT concat(first_name, ' ' , last_name) AS fullName, TIMESTAMPDIFF(day,born,died) AS lived FROM authors;

SELECT DATE_FORMAT('2017/05/31', '%Y %b %D');

SELECT * FROM books
WHERE title LIKE '%Big%';

SELECT title FROM books
WHERE title LIKE 'Harry_Potter%';

SELECT ROUND(SUM(cost), 2) FROM books;

SELECT * FROM books
WHERE title REGEXP '[HP][a-z]*'