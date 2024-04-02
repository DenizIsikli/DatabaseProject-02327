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
                                                           ('Politiken', '2020-01-01', 1),
                                                           ('Jyllands-Posten', '2020-01-01', 5),
                                                           ('Ekstra Bladet', '2020-01-01', 2),
                                                           ('BT', '2020-01-01', 8),
                                                           ('Børsen', '2020-01-01', 4),
                                                           ('Berlingske', '2020-01-01', 1),
                                                           ('Information', '2020-01-01', 3),
                                                           ('Weekendavisen', '2020-01-01', 4),
                                                           ('Kristeligt Dagblad', '2020-01-01', 6),
                                                           ('Dagbladet Information', '2020-01-01', 5),
                                                           ('JydskeVestkysten', '2020-01-01', 9),
                                                           ('Fyens Stiftstidende', '2020-01-01', 6),
                                                           ('Nordjyske Stiftstidende', '2020-01-01', 2),
                                                           ('Sjællandske', '2020-01-01', 7),
                                                           ('Horsens Folkeblad', '2020-01-01', 2),
                                                           ('Vejle Amts Folkeblad', '2020-01-01', 1),
                                                           ('Randers Amtsavis', '2020-01-01', 8),
                                                           ('Helsingør Dagblad', '2020-01-01', 5),
                                                           ('Silkeborg Folkeblad', '2020-01-01', 2),
                                                           ('Kolding Folkeblad', '2020-01-01', 9);

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
                                                          ('COVID-19', '2023-09-07', 3001),
                                                          ('Politik', '2021-06-12', 3002),
                                                          ('Sport', '2022-01-24', 3003),
                                                          ('Kultur', '2018-010-27', 3004),
                                                          ('Infrastruktur', '2019-03-29', 3005),
                                                          ('Debat', '2021-01-09', 3006),
                                                          ('Nyheder', '2023-07-03', 3007),
                                                          ('Superliga', '2021-02-12', 3008),
                                                          ('TV2', '2022-05-15', 3009),
                                                          ('Yousee', '2019-10-21', 3010);

-- Insert into Edition
INSERT INTO Edition (Date, Newspaper_title, Editor_CPR) VALUES
                                                            ('2020-01-01', 'Politiken', 3001),
                                                            ('2020-01-01', 'Jyllands-Posten', 3002),
                                                            ('2020-01-01', 'Ekstra Bladet', 3003),
                                                            ('2020-01-01', 'BT', 3004),
                                                            ('2020-01-01', 'Børsen', 3005),
                                                            ('2020-01-01', 'Berlingske', 3006),
                                                            ('2020-01-01', 'Information', 3007),
                                                            ('2020-01-01', 'Weekendavisen', 3008),
                                                            ('2020-01-01', 'Kristeligt Dagblad', 3009),
                                                            ('2020-01-01', 'Dagbladet Information', 3010);

-- Insert into Article
INSERT INTO Article (Title, Text, Topic, Times_read, Journalist_CPR, Photo_title) VALUES
                                                                                      ('COVID-19', 'CODID-19 dødsfald', 'COVID-19', 537, 3001, 'COVID-19'),
                                                                                      ('Politik Venstre', 'Ny regering', 'Politik', 1541, 3002, 'Politik'),
                                                                                      ('Superliga', 'Fodbold', 'Sport', 492, 3003, 'Sport'),
                                                                                      ('Kultur', 'Ny film', 'Kultur', 1782, 3004, 'Kultur'),
                                                                                      ('COVID-19 vaccine', 'Mulig vaccine', 'COVID-19', 231, 3005, 'COVID-19'),
                                                                                      ('Amerikansk fodbold', 'Jets V Packers', 'Sport', 731, 3006, 'Sport'),
                                                                                      ('TV2', 'Klovn', 'TV', 382, 3007, 'TV2'),
                                                                                      ('COVID-19 smittetal', 'Smittetal for 2021', 'COVID-19', 85, 3008, 'COVID-19'),
                                                                                      ('Tennis', 'Tennis', 'Sport', 1255, 3009, 'Sport'),
                                                                                      ('Yousee', 'Ny serie', 'Kultur', 3446, 3010, 'Yousee'),
                                                                                      ('Storm', 'Storm børge', 'Nyheder', 133, 3011, 'Nyheder'),
                                                                                      ('BIF v FCK', 'Fodbold derby', 'Sport', 7342, 3012, 'Sport'),
                                                                                      ('Teater', 'Ny teaterstykke', 'Kultur', 1377, 3013, 'Kultur'),
                                                                                      ('Malaria', 'Mugig vaccine', 'Nyheder', 361, 3014, 'Nyheder'),
                                                                                      ('OL', '100M løb', 'Sport', 746, 3015, 'Sport'),
                                                                                      ('Kanye West', 'Store vega', 'Kultur', 25, 3016, 'Kultur'),
                                                                                      ('COVID-19 Mutation', 'COVID-19 mutation', 'COVID-19', 842, 3017, 'COVID-19'),
                                                                                      ('Golf', 'Tiger Woods', 'Sport', 8932, 3018, 'Sport'),
                                                                                      ('Dune Part 2', 'Ny film', 'Kultur', 935, 3019, 'Kultur'),
                                                                                      ('Ebola', 'Ethiopia', 'Nyheder', 152, 3020, 'Nyheder');

SELECT * FROM Address;
SELECT * FROM Journalist;
SELECT * FROM Newspaper;
SELECT * FROM Edition;
SELECT * FROM Article;
SELECT * FROM Photo;
