-- -- -- 5. SQL Table Modifications
-- INSERT a new journalist with CPR 3021
INSERT INTO Journalist (CPR, First_name, Last_name, Street_name, Civic_number, City, Zip_code, Country, Telephone_num, Email)
VALUES (3021, 'Mette', 'Frederiksen', 'Ryesgade', 24, 'Aarhus', '8000', 'Denmark', '41234568', 'mette.frederiksen@email.dk');

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
INSERT INTO Journalist (CPR, First_name, Last_name, Street_name, Civic_number, City, Zip_code, Country, Telephone_num, Email)
VALUES (3022, 'Lars', 'Løkke', 'Nørregade', 17, 'Kolding', '6000', 'Denmark', '44567890', 'lars.lokke@email.dk');

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
GROUP BY Topic
ORDER BY Most_Read DESC;

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
-- Function
DELIMITER //
DROP FUNCTION IF EXISTS ArticleSummary;
CREATE FUNCTION ArticleSummary(journalistCPR INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE summaryText VARCHAR(255);
    DECLARE totalArticles INT;
    DECLARE avgReads FLOAT;

SELECT COUNT(*) INTO totalArticles FROM Article WHERE Journalist_CPR = journalistCPR;
SELECT AVG(Times_read) INTO avgReads FROM Article WHERE Journalist_CPR = journalistCPR;

SET summaryText = CONCAT('Total Articles: ', totalArticles, ', Avg Reads: ', CAST(avgReads AS CHAR));
RETURN summaryText;
END //
DELIMITER ;
-- Test cases for journalist 3002 & 3018
SELECT ArticleSummary(3002) AS Summary;
SELECT ArticleSummary(3018) AS Summary;

-- Procedure
DELIMITER //
DROP PROCEDURE IF EXISTS AddArticleForJournalistCPR;
CREATE PROCEDURE AddArticleForJournalistCPR(
    IN p_cpr INT,
    IN p_title VARCHAR(255),
    IN p_text TEXT,
    IN p_topic VARCHAR(100),
    IN p_times_read INT,
    IN p_photo_title VARCHAR(255),
    IN p_edition_id INT
)
BEGIN
    DECLARE v_journalist_exists INT;
    DECLARE v_message TEXT;

SELECT COUNT(*) INTO v_journalist_exists FROM Journalist WHERE CPR = p_cpr;

IF v_journalist_exists > 0 THEN
        IF p_times_read > 500 THEN
            INSERT INTO Article(Title, Text, Topic, Times_read, Journalist_CPR, Photo_title, Edition_id)
            VALUES(p_title, p_text, p_topic, p_times_read, p_cpr, p_photo_title, p_edition_id);
            SET v_message = CONCAT('Article "', p_title, '" successfully added for journalist CPR: ', p_cpr, '.');
ELSE
            SET v_message = 'Article times_read must be over 500. No article added.';
END IF;
ELSE
        SET v_message = CONCAT('No journalist found with CPR: ', p_cpr, '.');
END IF;

SELECT v_message AS OperationResult;
END //
DELIMITER ;
-- Test cases for all scenarios possible:
	-- When "Times_read" is over 500
    -- When "Times_read" is under 500
    -- When "Journalist_CPR" is non-existent
CALL AddArticleForJournalistCPR(3001, 'FCM v FCN', 'Nedrykningskamp', 'Superliga', 501, 'Superliga', 1);
CALL AddArticleForJournalistCPR(3001, 'Hobro v AaB', 'Oprykningskamp', 'Superliga', 499, 'Superliga', 1);
CALL AddArticleForJournalistCPR(2001, 'BIF v FCK', 'Finale', 'Superliga', 499, 'Superliga', 1);
-- Don't forget to delete the articles if you're calling new values
DELETE FROM Article WHERE Title = 'FCM v FCN';
DELETE FROM Article WHERE Title = 'Hobro v AaB';

-- Trigger
DELIMITER //
DROP TRIGGER IF EXISTS BeforeInsertArticle;
CREATE TRIGGER BeforeInsertArticle
    BEFORE INSERT ON Article FOR EACH ROW
BEGIN
    IF NEW.Times_read IS NULL OR NEW.Times_read = 0 THEN
        SET NEW.Times_read = 100;
END IF;
END//
DELIMITER ;
INSERT INTO Article (Title, Text, Topic, Times_read, Journalist_CPR, Photo_title)
VALUES('Test Article', 'Contents of the test article', 'Tech', 0, 3011, 'Børge');
-- Notice the value change for "Times_read" when the value is set to 0
SELECT * FROM Article WHERE Journalist_CPR = 3011;
-- Don't forget to delete the article if you're inserting new values
DELETE FROM Article WHERE Title = 'Test Article';
