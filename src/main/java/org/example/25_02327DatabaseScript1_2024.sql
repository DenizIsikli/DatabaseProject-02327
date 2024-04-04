DROP DATABASE IF EXISTS DKAvisDB;
CREATE DATABASE DKAvisDB;
USE DKAvisDB;

DROP TABLE IF EXISTS Newspaper;
DROP TABLE IF EXISTS Journalist;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS Edition;
DROP TABLE IF EXISTS Article;


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
                            Street_name VARCHAR(255),
                            Civic_number INT,
                            City VARCHAR(100),
                            Zip_code VARCHAR(20),
                            Country VARCHAR(100),
                            Telephone_num VARCHAR(20),
                            Email VARCHAR(100)
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
INSERT INTO Journalist (CPR, First_name, Last_name, Street_name, Civic_number, City, Zip_code, Country, Telephone_num, Email) VALUES
                                                                                                                                  (3001, 'Anders', 'Hansen', 'Ryesgade', 24, 'Aarhus', '8000', 'Denmark', '31234567', 'anders.hansen@email.dk'),
                                                                                                                                  (3002, 'Birgitte', 'Larsen', 'Vesterbrogade', 68, 'København', '1620', 'Denmark', '32345678', 'birgitte.larsen@email.dk'),
                                                                                                                                  (3003, 'Christoffer', 'Christensen', 'Algade', 55, 'Aalborg', '9000', 'Denmark', '33456789', 'christoffer.christensen@email.dk'),
                                                                                                                                  (3004, 'Dorthe', 'Jørgensen', 'Brogade', 29, 'Odense', '5000', 'Denmark', '34567890', 'dorthe.jorgensen@email.dk'),
                                                                                                                                  (3005, 'Emil', 'Mortensen', 'Østergade', 12, 'Esbjerg', '6700', 'Denmark', '35678901', 'emil.mortensen@email.dk'),
                                                                                                                                  (3006, 'Freja', 'Jensen', 'Nørregade', 3, 'Horsens', '8700', 'Denmark', '36789012', 'freja.jensen@email.dk'),
                                                                                                                                  (3007, 'Gustav', 'Kristensen', 'Søndergade', 7, 'Vejle', '7100', 'Denmark', '37890123', 'gustav.kristensen@email.dk'),
                                                                                                                                  (3008, 'Hanne', 'Nielsen', 'Vestergade', 1, 'Roskilde', '4000', 'Denmark', '38901234', 'hanne.nielsen@email.dk'),
                                                                                                                                  (3009, 'Ib', 'Pedersen', 'Østergade', 5, 'Fredericia', '7000', 'Denmark', '39012345', 'ib.pedersen@email.dk'),
                                                                                                                                  (3010, 'Jakob', 'Andersen', 'Nørregade', 9, 'Randers', '8900', 'Denmark', '40123456', 'jakob.andersen@email.dk'),
                                                                                                                                  (3011, 'Lærke', 'Rasmussen', 'Søndergade', 11, 'Herning', '7400', 'Denmark', '41234567', 'laerke.rasmussen@email.dk'),
                                                                                                                                  (3012, 'Magnus', 'Kjær', 'Vestergade', 13, 'Helsingør', '3000', 'Denmark', '42345678', 'magnus.kjaer@email.dk'),
                                                                                                                                  (3013, 'Nanna', 'Møller', 'Østergade', 15, 'Silkeborg', '8600', 'Denmark', '43456789', 'nanna.moller@email.dk'),
                                                                                                                                  (3014, 'Oliver', 'Svendsen', 'Nørregade', 17, 'Kolding', '6000', 'Denmark', '44567890', 'oliver.svendsen@email.dk'),
                                                                                                                                  (3015, 'Pernille', 'Thomsen', 'Søndergade', 19, 'Hillerød', '3400', 'Denmark', '45678901', 'pernille.thomsen@email.dk'),
                                                                                                                                  (3016, 'Rasmus', 'Knudsen', 'Vestergade', 21, 'Næstved', '4700', 'Denmark', '46789012', 'rasmus.knudsen@email.dk'),
                                                                                                                                  (3017, 'Sara', 'Lund', 'Østergade', 23, 'Holstebro', '7500', 'Denmark', '47890123', 'sara.lund@email.dk'),
                                                                                                                                  (3018, 'Thomas', 'Clausen', 'Nørregade', 25, 'Slagelse', '4200', 'Denmark', '48901234', 'thomas.clausen@email.dk'),
                                                                                                                                  (3019, 'Ulla', 'Poulsen', 'Søndergade', 27, 'Taastrup', '2630', 'Denmark', '49012345', 'ulla.poulsen@email.dk'),
                                                                                                                                  (3020, 'Viktor', 'Johansen', 'Vestergade', 29, 'Frederikshavn', '9900', 'Denmark', '50123456', 'viktor.johansen@email.dk');

-- Insert into Photo
INSERT INTO Photo (Title, Date_taken, Journalist_CPR) VALUES
                                                          ('COVID-19 Dødsfald', '2023-09-07', 3001),
                                                          ('Tsunami Dødsfdald', '2021-11-24', 3001),
                                                          ('Venstre', '2021-06-12', 3008),
                                                          ('DF', '2019-01-04', 3002),
                                                          ('Superliga', '2022-01-24', 3003),
                                                          ('Håndbold', '2024-08-12', 3019),
                                                          ('Napoleon', '2018-10-27', 3004),
                                                          ('Godzilla', '2024-02-22', 3004),
                                                          ('COVID-19 Vaccine', '2019-03-29', 3005),
                                                          ('COVID-19 PCR-Test', '2021-07-19', 3005),
                                                          ('Amerikansk fodbold JP', '2021-01-09', 3006),
                                                          ('Amerikansk fodbold G49', '2023-12-12', 3006),
                                                          ('Klovn', '2023-07-03', 3010),
                                                          ('Luksusfælden', '2018-06-23', 3010),
                                                          ('Smittetal 2021', '2021-02-12', 3013),
                                                          ('Smittetal 2024', '2024-12-23', 3013),
                                                          ('Tennis finale', '2022-05-15', 3013),
                                                          ('Tennis kamp', '2024-09-30', 3013),
                                                          ('Shogun', '2019-10-21', 3010),
                                                          ('Breaking Bad', '2017-04-11', 3010),
                                                          ('Børge', '2022-12-07', 3005),
                                                          ('Sven', '2024-07-13', 3005),
                                                          ('Derby', '2021-03-22', 3001),
                                                          ('Premier League', '2019-09-05', 3001),
                                                          ('Mormons', '2019-01-11', 3001),
                                                          ('Karazhan', '2021-05-24', 3001),
                                                          ('Malaria Vaccine', '2018-10-27', 3004),
                                                          ('Kvantefysik', '2024-03-19', 3004),
                                                          ('100m løb', '2017-06-19', 3005),
                                                          ('200m løb', '2017-07-25', 3005),
                                                          ('Kanye', '2023-04-15', 3009),
                                                          ('Kid Cudi', '2024-08-28', 3007),
                                                          ('Mutation', '2022-02-08', 3001),
                                                          ('Wuhan', '2019-08-16', 3001),
                                                          ('Tiger Woods', '2021-11-20', 3018),
                                                          ('Scottie Scheffler', '2024-02-14', 3018),
                                                          ('Dune Part 2', '2019-03-28', 3007),
                                                          ('Opera', '2019-03-28', 3007),
                                                          ('Ebola', '2019-09-21', 3002),
                                                          ('SpaceX', '2023-10-03', 3002);

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
                                                                                                  ('COVID-19 Dødsfald', 'COVID-19 dødsfald for 2021', 'COVID-19', 537, 3001, 'COVID-19 Dødsfald', 4),
                                                                                                  ('Tsunami Dødsfdald', 'COVID-19 dødsfald for 2021', 'COVID-19', 3537, 3001, 'Tsunami Dødsfdald', 2),
                                                                                                  ('Politik Venstre', 'Ny reformation', 'Politik', 1541, 3002, 'Venstre', 1),
                                                                                                  ('DF vinder', 'Dansk Folkeparti 28 mandater', 'Politik', 2905, 3002, 'DF', 1),
                                                                                                  ('Superliga', 'Fodbold', 'Sport', 492, 3003, 'Superliga', 2),
                                                                                                  ('Håndbold', 'Håndbold kamp', 'Sport', 1924, 3003, 'Håndbold', 2),
                                                                                                  ('Napoleon', 'Napoleon', 'Kultur', 1782, 3004, 'Napoleon', 3),
                                                                                                  ('Godzilla', 'Godzilla', 'Kultur', 6911, 3004, 'Godzilla', 3),
                                                                                                  ('COVID-19 Vaccine', 'Mulig vaccine', 'COVID-19', 231, 3005, 'COVID-19 Vaccine', 5),
                                                                                                  ('COVID-19 PCR-Test', 'PCR-Test', 'COVID-19', 911, 3005, 'COVID-19 PCR-Test', 5),
                                                                                                  ('Amerikansk fodbold JP', 'Jets v Packers', 'Sport', 731, 3006, 'Amerikansk fodbold JP', 9),
                                                                                                  ('Amerikansk fodbold G49', 'Giants v 49ers', 'Sport', 5816, 3006, 'Amerikansk fodbold G49', 9),
                                                                                                  ('TV2 Klovn', 'Klovn', 'TV', 382, 3007, 'Klovn', 6),
                                                                                                  ('Luksusfælden', 'Luksusfælden', 'TV', 5981, 3007, 'Luksusfælden', 6),
                                                                                                  ('COVID-19 Smittetal 2021', 'Smittetal for 2021', 'COVID-19', 85, 3008, 'Smittetal 2021', 7),
                                                                                                  ('COVID-19 Smittetal 2024', 'Smittetal for 2024', 'COVID-19', 2154, 3008, 'Smittetal 2024', 7),
                                                                                                  ('Tennis finale', 'Nadal v Djokovic', 'Sport', 1255, 3009, 'Tennis finale', 8),
                                                                                                  ('Tennis kamp', 'Federer v Djokovic', 'Sport', 1951, 3009, 'Tennis kamp', 8),
                                                                                                  ('Yousee Shogun', 'Shogun', 'Kultur', 3446, 3010, 'Shogun', 16),
                                                                                                  ('Yousee Breaking Bad', 'Breaking Bad', 'Kultur', 9231, 3010, 'Breaking Bad', 16),
                                                                                                  ('Storm Børge', 'Storm Børge', 'Nyheder', 133, 3011, 'Børge', 10),
                                                                                                  ('Storm Sven', 'Storm Sven', 'Nyheder', 5912, 3011, 'Sven', 10),
                                                                                                  ('BIF v FCK', 'Fodbold Derby', 'Sport', 7342, 3012, 'Derby', 12),
                                                                                                  ('Man U v Man City', 'Fodbold Premier League', 'Sport', 12851, 3012, 'Premier League', 12),
                                                                                                  ('København teater', 'Mormons', 'Kultur', 1377, 3013, 'Mormons', 17),
                                                                                                  ('Karazhan teater', 'Karazhan', 'Kultur', 8278, 3013, 'Karazhan', 17),
                                                                                                  ('Malaria', 'Potentiel vaccine', 'Nyheder', 361, 3014, 'Malaria Vaccine', 20),
                                                                                                  ('Kvantefysik', 'Kvantefysik opdagelse', 'Nyheder', 2391, 3014, 'Kvantefysik', 20),
                                                                                                  ('OL 100m', '100m løb', 'Sport', 746, 3015, '100m løb', 11),
                                                                                                  ('OL 200m', '200m løb', 'Sport', 1518, 3015, '200m løb', 11),
                                                                                                  ('Kanye West', 'Store vega', 'Kultur', 2125, 3016, 'Kanye', 13),
                                                                                                  ('Kid Cudi', 'Store vega', 'Kultur', 1518, 3016, 'Kid Cudi', 13),
                                                                                                  ('COVID-19 Mutation', 'COVID-19 mutation', 'COVID-19', 842, 3017, 'Mutation', 14),
                                                                                                  ('COVID-19 Wuhan', 'COVID-19 Wuhan', 'COVID-19', 4518, 3017, 'Wuhan', 14),
                                                                                                  ('Golf Tiger Woods', 'Tiger Woods', 'Sport', 8232, 3018, 'Tiger Woods', 18),
                                                                                                  ('Golf Scottie Scheffler', 'Scottie Scheffler', 'Sport', 2913, 3018, 'Scottie Scheffler', 18),
                                                                                                  ('Dune Part 2', 'Cinemax', 'Kultur', 1135, 3019, 'Dune Part 2', 15),
                                                                                                  ('Opera', 'Københavns Teater', 'Kultur', 6571, 3019, 'Opera', 15),
                                                                                                  ('Ebola', 'Ethiopia', 'Nyheder', 152, 3020, 'Ebola', 19),
                                                                                                  ('SpaceX', 'SpaceX Falcon', 'Nyheder', 1935, 3020, 'SpaceX', 19);

SELECT * FROM Journalist;
SELECT * FROM Newspaper;
SELECT * FROM Edition;
SELECT * FROM Article;
SELECT * FROM Photo;
