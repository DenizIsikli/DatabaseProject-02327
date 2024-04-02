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
-- Function 1
DELIMITER //
DROP FUNCTION IF EXISTS AvgReadsByJournalist;
CREATE FUNCTION AvgReadsByJournalist(journalistCPR INT) RETURNS FLOAT
BEGIN
    DECLARE avgReads FLOAT;
SELECT AVG(Times_read) INTO avgReads FROM Article WHERE Journalist_CPR = journalistCPR;
RETURN IFNULL(avgReads, 0);
END//
DELIMITER ;
SELECT First_name, Last_name, AvgReadsByJournalist(CPR) AS Avg_Article_Reads
FROM Journalist;

-- Function 2
DELIMITER //
DROP PROCEDURE IF EXISTS TotalReadsByJournalist;
CREATE PROCEDURE TotalReadsByJournalist(IN journalistCPR INT)
BEGIN
SELECT
    J.First_name,
    J.Last_name,
    -- COALESCE returns first non-null value
    COALESCE(SUM(A.Times_read), 0) AS Total_Reads
FROM Journalist J
         LEFT JOIN Article A ON J.CPR = A.Journalist_CPR
WHERE J.CPR = journalistCPR
GROUP BY J.First_name, J.Last_name;
END //
DELIMITER ;
CALL TotalReadsByJournalist(3002);
CALL TotalReadsByJournalist(3018);

-- Procedure 1
DELIMITER //
DROP PROCEDURE IF EXISTS AddJournalist;
CREATE PROCEDURE AddJournalist(
    IN p_cpr INT,
    IN p_first_name VARCHAR(100),
    IN p_last_name VARCHAR(100),
    IN p_street_name VARCHAR(255),
    IN p_civic_number INT,
    IN p_city VARCHAR(100),
    IN p_zip_code VARCHAR(20),
    IN p_country VARCHAR(100),
    IN p_telephone_num VARCHAR(20),
    IN p_email VARCHAR(100)
)
BEGIN
    DECLARE v_address_id INT;

    -- Insert into Address table and get the inserted ID
INSERT INTO Address(Street_name, Civic_number, City, Zip_code, Country)
VALUES(p_street_name, p_civic_number, p_city, p_zip_code, p_country);
SET v_address_id = LAST_INSERT_ID();

    -- Insert into Journalist table with the new Address ID
INSERT INTO Journalist(CPR, First_name, Last_name, Address_id, Telephone_num, Email)
VALUES(p_cpr, p_first_name, p_last_name, v_address_id, p_telephone_num, p_email);

SELECT J.*, A.Street_name, A.Civic_number, A.City, A.Zip_code, A.Country
FROM Journalist J
         JOIN Address A ON J.Address_id = A.Address_id
WHERE J.CPR = p_cpr;
END//
DELIMITER ;
SET @random_cpr = FLOOR(RAND(UNIX_TIMESTAMP(CURTIME(4))) * (3030 - 3021 + 1)) + 3021;
CALL AddJournalist(@random_cpr, 'John', 'Doe', 'Main St', 123, 'Copenhagen', '1000', 'Denmark', '20812345', CONCAT('john.doe', '@email.com'));

DELETE FROM Journalist WHERE CPR BETWEEN 3021 AND 3030;
DELETE FROM Address WHERE Address_id BETWEEN 3021 AND 3030;

-- Trigger 1
DELIMITER //
DROP TRIGGER IF EXISTS BeforeInsertArticle;
CREATE TRIGGER BeforeInsertArticle
    BEFORE INSERT ON Article FOR EACH ROW
BEGIN
    IF NEW.Times_read IS NULL OR NEW.Times_read = 0 THEN
        SET NEW.Times_read = 1;
END IF;
END//
DELIMITER ;
INSERT INTO Article (Title, Text, Topic, Times_read, Journalist_CPR, Photo_title)
VALUES('Test Article', 'Contents of the test article', 'Tech', 426, 3011, 'Børge');
SELECT * FROM Article WHERE Journalist_CPR = 3011;
DELETE FROM Article WHERE Title = 'Test Article';
