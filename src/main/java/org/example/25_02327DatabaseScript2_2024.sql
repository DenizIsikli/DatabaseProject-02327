-- -- -- 5. SQL Table Modifications
-- INSERT a new journalist with CPR 3021
INSERT INTO Journalist (CPR, First_name, Last_name, Address_id, Telephone_num, Email) 
VALUES (3021, 'Mette', 'Frederiksen', 11, '41234568', 'mette.frederiksen@email.dk');

-- Show result after INSERT
SELECT * FROM Journalist WHERE CPR = 3021;

-- UPDATE the journalist's email
UPDATE Journalist 
SET Email = 'mette.f@email.dk' 
WHERE CPR = 3021;

-- Show result after UPDATE
SELECT * FROM Journalist WHERE CPR = 3021;

-- DELETE the journalist
DELETE FROM Journalist 
WHERE CPR = 3021;

-- Show result after DELETE to confirm it's gone
SELECT * FROM Journalist WHERE CPR = 3021;

-- -- Example 2 of task 5
-- INSERT a new journalist with CPR 3022
INSERT INTO Journalist (CPR, First_name, Last_name, Address_id, Telephone_num, Email) 
VALUES (3022, 'Lars', 'Løkke', 12, '41334567', 'lars.lokke@email.dk');

-- Show result after INSERT
SELECT * FROM Journalist WHERE CPR = 3022;

-- UPDATE the journalist's last name
UPDATE Journalist 
SET Last_name = 'Rasmussen' 
WHERE CPR = 3022;

-- Show result after UPDATE
SELECT * FROM Journalist WHERE CPR = 3022;

-- DELETE the journalist with CPR 3022
DELETE FROM Journalist 
WHERE CPR = 3022;

-- Show result after DELETE to confirm it's gone
SELECT * FROM Journalist WHERE CPR = 3022;


-- -- -- 6. SQL Data Queries
-- For each topic, show the most read news article.
SELECT Topic, Title, MAX(Times_read) AS Most_Read
FROM Article
GROUP BY Topic;

-- Show the top 10 journalists whose articles, overall, attracted the highest number of reads.
SELECT j.First_name, j.Last_name, SUM(a.Times_read) AS Total_Reads
FROM Journalist j
JOIN Article a ON j.CPR = a.Journalist_CPR
GROUP BY j.CPR
ORDER BY Total_Reads DESC
LIMIT 10;

-- Show reporters whose photos were never used more than once.
SELECT p.Journalist_CPR, j.First_name, j.Last_name
FROM Photo p
JOIN Journalist j ON p.Journalist_CPR = j.CPR
GROUP BY p.Journalist_CPR
HAVING COUNT(p.Title) = 1;

-- Identify which topics, overall, attracted less reads than the average.
SELECT Topic
FROM Article
GROUP BY Topic
HAVING AVG(Times_read) < (SELECT AVG(Times_read) FROM Article);

-- Identify which journalists were both writers and reporters, having shot at least a photo that was used for a news article they wrote.
SELECT DISTINCT j.First_name, j.Last_name
FROM Journalist j
JOIN Article a ON j.CPR = a.Journalist_CPR
JOIN Photo p ON j.CPR = p.Journalist_CPR
WHERE a.Photo_title = p.Title;





-- -- -- 7. SQL Programming