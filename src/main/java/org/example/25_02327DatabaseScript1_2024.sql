DROP DATABASE IF EXISTS DKAvisDB;
CREATE DATABASE DKAvisDB;
USE DKAvisDB;

DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Newspaper;
DROP TABLE IF EXISTS Journalist;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS Edition;
DROP TABLE IF EXISTS Article;

-- Address table.
CREATE TABLE Address (
                         Address_id INT AUTO_INCREMENT,
                         Street_name VARCHAR(255),
                         Civic_number INT,
                         City VARCHAR(100),
                         Zip_code VARCHAR(20),
                         Country VARCHAR(100),
                         PRIMARY KEY (Address_id)
);

-- Newspaper table.
CREATE TABLE Newspaper (
                           Title VARCHAR(255) PRIMARY KEY,
                           Found_date DATE,
                           Periodicity INT
);

-- Journalist table.
CREATE TABLE Journalist (
                            CPR INT PRIMARY KEY,
                            First_name VARCHAR(100),
                            Last_name VARCHAR(100),
                            Address_id INT,
                            Telephone_num VARCHAR(20),
                            Email VARCHAR(100),
                            FOREIGN KEY (Address_id) REFERENCES Address(Address_id) ON DELETE SET NULL
);

-- Photo table.
CREATE TABLE Photo (
                       Title VARCHAR(255) PRIMARY KEY,
                       Date_taken DATE,
                       Journalist_CPR INT,
                       FOREIGN KEY (Journalist_CPR) REFERENCES Journalist(CPR)
);

-- Edition table.
CREATE TABLE Edition (
                         Edition_id INT AUTO_INCREMENT,
                         Date DATE,
                         Newspaper_title VARCHAR(255),
                         Editor_CPR INT,
                         PRIMARY KEY (Edition_id),
                         FOREIGN KEY (Newspaper_title) REFERENCES Newspaper(Title),
                         FOREIGN KEY (Editor_CPR) REFERENCES Journalist(CPR)
);

-- Article table.
CREATE TABLE Article (
                         Title VARCHAR(255) PRIMARY KEY,
                         Text TEXT,
                         Topic VARCHAR(100),
                         Times_read INT,
                         Journalist_CPR INT,
                         Photo_title VARCHAR(255),
                         Edition_id INT,
                         FOREIGN KEY (Journalist_CPR) REFERENCES Journalist(CPR),
                         FOREIGN KEY (Photo_title) REFERENCES Photo(Title),
                         FOREIGN KEY (Edition_id) REFERENCES Edition(Edition_id)
);

-- Insert into Address
INSERT INTO Address (Street_name, Civic_number, City, Zip_code, Country) VALUES
                                                                             ('Ryesgade', 24, 'Aarhus', '8000', 'Denmark'),
                                                                             ('Vesterbrogade', 68, 'København', '1620', 'Denmark'),
                                                                             ('Algade', 55, 'Aalborg', '9000', 'Denmark'),
                                                                             ('Brogade', 29, 'Odense', '5000', 'Denmark'),
                                                                             ('Østergade', 12, 'Esbjerg', '6700', 'Denmark'),
                                                                             ('Nørregade', 3, 'Horsens', '8700', 'Denmark'),
                                                                             ('Søndergade', 7, 'Vejle', '7100', 'Denmark'),
                                                                             ('Vestergade', 1, 'Roskilde', '4000', 'Denmark'),
                                                                             ('Østergade', 5, 'Fredericia', '7000', 'Denmark'),
                                                                             ('Nørregade', 9, 'Randers', '8900', 'Denmark'),
                                                                             ('Søndergade', 11, 'Herning', '7400', 'Denmark'),
                                                                             ('Vestergade', 13, 'Helsingør', '3000', 'Denmark'),
                                                                             ('Østergade', 15, 'Silkeborg', '8600', 'Denmark'),
                                                                             ('Nørregade', 17, 'Kolding', '6000', 'Denmark'),
                                                                             ('Søndergade', 19, 'Hillerød', '3400', 'Denmark'),
                                                                             ('Vestergade', 21, 'Næstved', '4700', 'Denmark'),
                                                                             ('Østergade', 23, 'Holstebro', '7500', 'Denmark'),
                                                                             ('Nørregade', 25, 'Slagelse', '4200', 'Denmark'),
                                                                             ('Søndergade', 27, 'Taastrup', '2630', 'Denmark'),
                                                                             ('Vestergade', 29, 'Frederikshavn', '9900', 'Denmark');

-- Insert into Newspaper
INSERT INTO Newspaper (Title, Found_date, Periodicity) VALUES
                                                           ('Politiken', '2021-07-13', 1),
                                                           ('Jyllands-Posten', '2019-11-02', 5),
                                                           ('Ekstra Bladet', '2020-12-25', 2),
                                                           ('BT', '2018-01-08', 8),
                                                           ('Børsen', '2022-05-17', 4),
                                                           ('Berlingske', '2017-03-22', 1),
                                                           ('Information', '2021-09-14', 3),
                                                           ('Weekendavisen', '2019-10-03', 4),
                                                           ('TVsporten', '2020-08-19', 6),
                                                           ('Dagbladet Information', '2023-02-20', 5),
                                                           ('JydskeVestkysten', '2021-06-14', 9),
                                                           ('Fyens Stiftstidende', '2019-12-22', 6),
                                                           ('Nordjyske Stiftstidende', '2020-10-31', 2),
                                                           ('Sjællandske', '2018-02-17', 7),
                                                           ('Horsens Folkeblad', '2022-04-21', 2),
                                                           ('Vejle Amts Folkeblad', '2017-05-29', 1),
                                                           ('Randers Amtsavis', '2021-08-11', 8),
                                                           ('Helsingør Dagblad', '2019-07-30', 5),
                                                           ('Silkeborg Folkeblad', '2020-09-15', 2),
                                                           ('Kolding Folkeblad', '2023-01-07', 9);

-- Insert into Journalist
INSERT INTO Journalist (CPR, First_name, Last_name, Address_id, Telephone_num, Email) VALUES
                                                                                          (3001, 'Anders', 'Hansen', 1, '31234567', 'anders.hansen@email.dk'),
                                                                                          (3002, 'Birgitte', 'Larsen', 2, '32345678', 'birgitte.larsen@email.dk'),
                                                                                          (3003, 'Christoffer', 'Christensen', 3, '33456789', 'christoffer.christensen@email.dk'),
                                                                                          (3004, 'Dorthe', 'Jørgensen', 4, '34567890', 'dorthe.jorgensen@email.dk'),
                                                                                          (3005, 'Emil', 'Mortensen', 5, '35678901', 'emil.mortensen@email.dk'),
                                                                                          (3006, 'Freja', 'Jensen', 6, '36789012', 'freja.jensen@email.dk'),
                                                                                          (3007, 'Gustav', 'Kristensen', 7, '37890123', 'gustav.kristensen@email.dk'),
                                                                                          (3008, 'Hanne', 'Nielsen', 8, '38901234', 'hanne.nielsen@email.dk'),
                                                                                          (3009, 'Ib', 'Pedersen', 9, '39012345', 'ib.pedersen@email.dk'),
                                                                                          (3010, 'Jakob', 'Andersen', 10, '40123456', 'jakob.andersen@email.dk'),
                                                                                          (3011, 'Lærke', 'Rasmussen', 11, '41234567', 'laerke.rasmussen@email.dk'),
                                                                                          (3012, 'Magnus', 'Kjær', 12, '42345678', 'magnus.kjaer@email.dk'),
                                                                                          (3013, 'Nanna', 'Møller', 13, '43456789', 'nanna.moller@email.dk'),
                                                                                          (3014, 'Oliver', 'Svendsen', 14, '44567890', 'oliver.svendsen@email.dk'),
                                                                                          (3015, 'Pernille', 'Thomsen', 15, '45678901', 'pernille.thomsen@email.dk'),
                                                                                          (3016, 'Rasmus', 'Knudsen', 16, '46789012', 'rasmus.knudsen@email.dk'),
                                                                                          (3017, 'Sara', 'Lund', 17, '47890123', 'sara.lund@email.dk'),
                                                                                          (3018, 'Thomas', 'Clausen', 18, '48901234', 'thomas.clausen@email.dk'),
                                                                                          (3019, 'Ulla', 'Poulsen', 19, '49012345', 'ulla.poulsen@email.dk'),
                                                                                          (3020, 'Viktor', 'Johansen', 20, '50123456', 'viktor.johansen@email.dk');

-- Insert into Photo
INSERT INTO Photo (Title, Date_taken, Journalist_CPR) VALUES
                                                          ('Dødsfald', '2023-09-07', 3001),
                                                          ('Venstre', '2021-06-12', 3002),
                                                          ('Superliga', '2022-01-24', 3003),
                                                          ('Napoleon', '2018-010-27', 3004),
                                                          ('COVID-19 Vaccine', '2019-03-29', 3005),
                                                          ('Amerikansk fodbold JP', '2021-01-09', 3006),
                                                          ('Klovn', '2023-07-03', 3010),
                                                          ('Smittetal', '2021-02-12', 3013),
                                                          ('Tennis', '2022-05-15', 3013),
                                                          ('Shogun', '2019-10-21', 3010),
                                                          ('Børge', '2022-12-07', 3005),
                                                          ('Derby', '2021-03-22', 3001),
                                                          ('Mormons', '2019-01-11', 3001),
                                                          ('Malaria Vaccine', '2018-010-27', 3004),
                                                          ('100m løb', '2017-06-19', 3005),
                                                          ('Kanye', '2023-04-15', 3004),
                                                          ('Mutation', '2022-02-08', 3001),
                                                          ('Tiger Woods', '2021-11-20', 3018),
                                                          ('Dune Part 2', '2019-03-28', 3007),
                                                          ('Ebola', '2019-09-21', 3002);

-- Insert into Edition
INSERT INTO Edition (Date, Newspaper_title, Editor_CPR) VALUES
                                                            ('2021-07-13', 'Politiken', 3001),
                                                            ('2019-11-02', 'Jyllands-Posten', 3002),
                                                            ('2020-12-25', 'Ekstra Bladet', 3003),
                                                            ('2018-01-08', 'BT', 3004),
                                                            ('2022-05-17', 'Børsen', 3005),
                                                            ('2017-03-22', 'Berlingske', 3006),
                                                            ('2021-09-14', 'Information', 3007),
                                                            ('2019-10-03', 'Weekendavisen', 3008),
                                                            ('2020-08-19', 'TVsporten', 3009),
                                                            ('2023-02-20', 'Dagbladet Information', 3010),
                                                            ('2021-06-14', 'JydskeVestkysten', 3001),
                                                            ('2019-12-22', 'Fyens Stiftstidende', 3002),
                                                            ('2020-10-31', 'Nordjyske Stiftstidende', 3003),
                                                            ('2018-02-17', 'Sjællandske', 3004),
                                                            ('2022-04-21', 'Horsens Folkeblad', 3005),
                                                            ('2017-05-29', 'Vejle Amts Folkeblad', 3006),
                                                            ('2021-08-11', 'Randers Amtsavis', 3007),
                                                            ('2019-07-30', 'Helsingør Dagblad', 3008),
                                                            ('2020-09-15', 'Silkeborg Folkeblad', 3009),
                                                            ('2023-01-07', 'Kolding Folkeblad', 3010);

-- Insert into Article
INSERT INTO Article (Title, Text, Topic, Times_read, Journalist_CPR, Photo_title, Edition_id) VALUES
                                                                                                  ('COVID-19 Dødsfald', 'CODID-19 dødsfald for 2021', 'COVID-19', 537, 3001, 'Dødsfald', 4),
                                                                                                  ('Politik Venstre', 'Ny reformation', 'Politik', 1541, 3002, 'Venstre', 1),
                                                                                                  ('Superliga', 'Fodbold', 'Sport', 492, 3003, 'Superliga', 2),
                                                                                                  ('Kultur', 'Napoleon', 'Kultur', 1782, 3004, 'Napoleon', 3),
                                                                                                  ('COVID-19 Vaccine', 'Mulig vaccine', 'COVID-19', 231, 3005, 'COVID-19 Vaccine', 5),
                                                                                                  ('Amerikansk fodbold JP', 'Jets v Packers', 'Sport', 731, 3006, 'Amerikansk fodbold JP', 9),
                                                                                                  ('TV2 Klovn', 'Klovn', 'TV', 382, 3007, 'Klovn', 6),
                                                                                                  ('COVID-19 Smittetal', 'Smittetal for 2021', 'COVID-19', 85, 3008, 'Smittetal', 7),
                                                                                                  ('Tennis', 'Nadal v Djokovic', 'Sport', 1255, 3009, 'Tennis', 8),
                                                                                                  ('Yousee Shogun', 'Shogun', 'Kultur', 3446, 3010, 'Shogun', 16),
                                                                                                  ('Storm', 'Storm Børge', 'Nyheder', 133, 3011, 'Børge', 10),
                                                                                                  ('BIF v FCK', 'Fodbold derby', 'Sport', 7342, 3012, 'Derby', 12),
                                                                                                  ('København teater', 'Mormons', 'Kultur', 1377, 3013, 'Mormons', 17),
                                                                                                  ('Malaria', 'Potentiel vaccine', 'Nyheder', 361, 3014, 'Malaria Vaccine', 20),
                                                                                                  ('OL', '100m løb', 'Sport', 746, 3015, '100m løb', 11),
                                                                                                  ('Kanye West', 'Store vega', 'Kultur', 25, 3016, 'Kanye', 13),
                                                                                                  ('COVID-19 Mutation', 'COVID-19 mutation', 'COVID-19', 842, 3017, 'Mutation', 14),
                                                                                                  ('Golf', 'Tiger Woods', 'Sport', 8932, 3018, 'Tiger Woods', 18),
                                                                                                  ('Dune Part 2', 'Cinemax', 'Kultur', 1135, 3019, 'Dune Part 2', 15),
                                                                                                  ('Ebola', 'Ethiopia', 'Nyheder', 152, 3020, 'Ebola', 19);

SELECT * FROM Address;
SELECT * FROM Journalist;
SELECT * FROM Newspaper;
SELECT * FROM Edition;
SELECT * FROM Article;
SELECT * FROM Photo;
