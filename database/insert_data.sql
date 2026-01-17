INSERT INTO countries VALUES (101, 'Australia');
INSERT INTO countries VALUES (102, 'China');
INSERT INTO countries VALUES (103, 'Japan');
INSERT INTO countries VALUES (104, 'Bahrain');
INSERT INTO countries VALUES (105, 'Saudi Arabia');
INSERT INTO countries VALUES (106, 'United States');
INSERT INTO countries VALUES (107, 'Italy');
INSERT INTO countries VALUES (108, 'Monaco');
INSERT INTO countries VALUES (109, 'Spain');
INSERT INTO countries VALUES (110, 'Canada');
INSERT INTO countries VALUES (111, 'Austria');
INSERT INTO countries VALUES (112, 'United Kingdom');
INSERT INTO countries VALUES (113, 'Belgium');
INSERT INTO countries VALUES (114, 'Hungary');
INSERT INTO countries VALUES (115, 'Netherlands');
INSERT INTO countries VALUES (116, 'Azerbaijan');
INSERT INTO countries VALUES (117, 'Singapore');
INSERT INTO countries VALUES (118, 'Mexico');
INSERT INTO countries VALUES (119, 'Brazil');
INSERT INTO countries VALUES (120, 'Qatar');
INSERT INTO countries VALUES (121, 'United Arab Emirates');
INSERT INTO countries VALUES (122, 'Argentina');
INSERT INTO countries VALUES (123, 'France');
INSERT INTO countries VALUES (124, 'Germany');
INSERT INTO countries VALUES (125, 'New Zeeland');
INSERT INTO countries VALUES (126, 'Thailand');
INSERT INTO countries VALUES (127, 'Switzerland');
commit;

-------------------

INSERT INTO addresses VALUES (101, '12 Aughtie Dr', '3206', 'Albert Park', 101);
INSERT INTO addresses VALUES (102, 'Yining Rd. 2000', '201814', 'Shanghai', 102);
INSERT INTO addresses VALUES (103, '7992 Inoucho', '510-0295', 'Suzuka', 103);
INSERT INTO addresses VALUES (104, 'Gate 255, Avenue Umm Jidar', '1062', 'Sakhir', 104);
INSERT INTO addresses VALUES (105, 'Jeddah Corniche Circuit', '23512', 'Jeddah', 105);
INSERT INTO addresses VALUES (106, '347 Don Shula Drive', '33056', 'Miami Gardens', 106);
INSERT INTO addresses VALUES (107, 'Piazza Ayrton Senna de Silva, 1', '40026', 'Imola', 107);
INSERT INTO addresses VALUES (108, '11 Bd Albert 1er', '98000', 'Monaco', 108);
INSERT INTO addresses VALUES (109, 'Mas La Moreneta s/n', '08160', 'Montmelo', 109);
INSERT INTO addresses VALUES (110, 'Parc Jean-Drapeau', 'H3C 6A1', 'Montreal', 110);
INSERT INTO addresses VALUES (111, 'Red Bull Ring Str. 1', '8724', 'Spielberg', 111);
INSERT INTO addresses VALUES (112, 'Silverstone Circuit', 'NN12 8TN', 'Silverstone', 112);
INSERT INTO addresses VALUES (113, 'Rte du Circuit 55', '4970', 'Stavelot', 113);
INSERT INTO addresses VALUES (114, 'Hungaroring Circuit', '2146', 'Mogyorod', 114);
INSERT INTO addresses VALUES (115, 'Burgemeester van Alphenstraat 108', '2041 JA', 'Zandvoort', 115);
INSERT INTO addresses VALUES (116, 'Viale di Vedano, 5', '20900', 'Monza', 107);
INSERT INTO addresses VALUES (117, '93 Zarifa Aliyeva', NULL, 'Baku', 116);
INSERT INTO addresses VALUES (118, '50 Cuscaden Road', '249724', 'Singapore', 117);
INSERT INTO addresses VALUES (119, '9201 Circuit of the Americas Blvd', '78617', 'Del Valle', 106);
INSERT INTO addresses VALUES (120, 'Viad. Rio de la Piedad S/n', '08400', 'Ciudad de Mexico', 118);
INSERT INTO addresses VALUES (121, 'Av. Sen. Teotonio Vilela 261', '04801-000', 'Sao Paulo', 119);
INSERT INTO addresses VALUES (122, '260 E Harmon Ave', '89119', 'Las Vegas', 106);
INSERT INTO addresses VALUES (123, 'North Relief Road', NULL, 'Doha', 120);
INSERT INTO addresses VALUES (124, 'Yas Leisure Dr', 'YS1', 'Abu Dhabi', 121);
INSERT INTO addresses VALUES (125, 'Whiteways Technical Centre', 'OX7 4EE', 'Chipping Norton', 112);
INSERT INTO addresses VALUES (126, 'Dadford Rd', 'NN12 8TJ', 'Silverstone', 112);
INSERT INTO addresses VALUES (127, 'Via Enzo Ferrari, 27', '41053', 'Maranello', 107);
INSERT INTO addresses VALUES (128, 'Overthorpe Rd', 'OX16 4PN', 'Banbury', 112);
INSERT INTO addresses VALUES (129, 'Wildbachstrasse 9', '8340', 'Hinwil', 127);
INSERT INTO addresses VALUES (130, 'Chertsey Rd', 'GU21 4YH', 'Woking', 112);
INSERT INTO addresses VALUES (131, 'Lauda Dr', 'NN13 7BD', 'Brackley', 112);
INSERT INTO addresses VALUES (132, 'Via della Boaria, 229', '48018', 'Faenza', 107);
INSERT INTO addresses VALUES (133, 'Bradbourne Dr', 'MK7 8AT', 'Milton Keynes', 112);
INSERT INTO addresses VALUES (134, 'Station Rd', '0X12 0DQ', 'Grove', 112);
commit;

---------------------

INSERT INTO team_status VALUES (101, 'Active');
INSERT INTO team_status VALUES (102, 'Inactive');
commit;

---------------------

ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

INSERT INTO teams VALUES (101, 'BWT Alpine F1 Team', 'Renault', 'Flavio Briatore', '01/09/2020', 101, 125);
INSERT INTO teams VALUES (102, 'Aston Martin Aramco F1 Team', 'Mercedes', 'Adrian Newey', '01/01/2021', 101, 126);
INSERT INTO teams VALUES (103, 'Scuderia Ferrari HP', 'Ferrari', 'Frederic Vasseur', '16/11/1929', 101, 127);
INSERT INTO teams VALUES (104, 'MoneyGram Haas F1 Team', 'Ferrari', 'Ayao Komatsu', '01/04/2014', 101, 128);
INSERT INTO teams VALUES (105, 'Stake F1 Team Kick Sauber', 'Ferrari', 'Jonathan Wheatley', '01/01/1979', 101, 129);
INSERT INTO teams VALUES (106, 'McLaren Formula 1 Team', 'Mercedes', 'Zak Brown', '01/01/1963', 101, 130);
INSERT INTO teams VALUES (107, 'Mercedes-AMG Petronas F1 Team', 'Mercedes', 'Toto Wolff', '25/01/2010', 101, 131);
INSERT INTO teams VALUES (108, 'Visa Cash App Racing Bulls F1 Team', 'Honda RBPT', 'Alan Permane', '01/11/2005', 101, 132);
INSERT INTO teams VALUES (109, 'Oracle Red Bull Racing', 'Honda RBPT', 'Laurent Mekies', '15/11/2004', 101, 133);
INSERT INTO teams VALUES (110, 'Atlassian Williams Racing', 'Mercedes', 'James Vowles', '08/03/1997', 101, 134);

---------------------

INSERT INTO drivers VALUES (101, 'Jack', 'Doohan', '20/01/2003', 'M', 101, 7);
INSERT INTO drivers VALUES (102, 'Franco', 'Colapinto', '27/05/2003', 'M', 122, 43);
INSERT INTO drivers VALUES (103, 'Pierre', 'Gasly', '07/02/1996', 'M', 123, 10);
INSERT INTO drivers VALUES (104, 'Fernando', 'Alonso', '29/07/1981', 'M', 109, 14);
INSERT INTO drivers VALUES (105, 'Lance', 'Stroll', '29/10/1998', 'M', 110, 18);
INSERT INTO drivers VALUES (106, 'Charles', 'Leclerc', '16/10/1998', 'M', 108, 16);
INSERT INTO drivers VALUES (107, 'Lewis', 'Hamilton', '07/01/1985', 'M', 112, 44);
INSERT INTO drivers VALUES (108, 'Esteban', 'Ocon', '17/09/1996', 'M', 123, 31);
INSERT INTO drivers VALUES (109, 'Oliver', 'Bearman', '08/05/2005', 'M', 112, 87);
INSERT INTO drivers VALUES (110, 'Gabriel', 'Bortoleto', '14/10/2004', 'M', 119, 5);
INSERT INTO drivers VALUES (111, 'Nico', 'Hulkenberg', '19/08/1987', 'M', 124, 27);
INSERT INTO drivers VALUES (112, 'Lando', 'Norris', '13/11/1999', 'M', 112, 4);
INSERT INTO drivers VALUES (113, 'Oscar', 'Piastri', '06/04/2001', 'M', 101, 81);
INSERT INTO drivers VALUES (114, 'Kimi', 'Antonelli', '25/08/2006', 'M', 107, 12);
INSERT INTO drivers VALUES (115, 'George', 'Russell', '15/02/1998', 'M', 112, 63);
INSERT INTO drivers VALUES (116, 'Isack', 'Hadjar', '28/09/2004', 'M', 123, 6);
INSERT INTO drivers VALUES (117, 'Yuki', 'Tsunoda', '11/05/2000', 'M', 103, 22);
INSERT INTO drivers VALUES (118, 'Liam', 'Lawson', '11/02/2002', 'M', 125, 30);
INSERT INTO drivers VALUES (119, 'Max', 'Verstappen', '30/09/1997', 'M', 115, 3);
INSERT INTO drivers VALUES (120, 'Alex', 'Albon', '23/03/1996', 'M', 126, 23);
INSERT INTO drivers VALUES (121, 'Carlos', 'Sainz', '01/09/1994', 'M', 109, 55);
commit;

--------------------

INSERT INTO seasons VALUES (65, 2014, 'Hybrid Era');
INSERT INTO seasons VALUES (66, 2015, 'Hybrid Era');
INSERT INTO seasons VALUES (67, 2016, 'Hybrid Era');
INSERT INTO seasons VALUES (68, 2017, 'Hybrid Era');
INSERT INTO seasons VALUES (69, 2018, 'Hybrid Era');
INSERT INTO seasons VALUES (70, 2019, 'Hybrid Era');
INSERT INTO seasons VALUES (71, 2020, 'Hybrid Era');
INSERT INTO seasons VALUES (72, 2021, 'Hybrid Era');
INSERT INTO seasons VALUES (73, 2022, 'Ground Effect Era');
INSERT INTO seasons VALUES (74, 2023, 'Ground Effect Era');
INSERT INTO seasons VALUES (75, 2024, 'Ground Effect Era');
INSERT INTO seasons VALUES (76, 2025, 'Ground Effect Era');
commit;

---------------------

INSERT INTO circuits VALUES (101, 'Albert Park Circuit', 101, 5.278, 14);
INSERT INTO circuits VALUES (102, 'Shanghai International Circuit', 102, 5.451, 16);
INSERT INTO circuits VALUES (103, 'Suzuka International Circuit', 103, 5.807, 18);
INSERT INTO circuits VALUES (104, 'Bahrain International Circuit', 104, 5.412, 15);
INSERT INTO circuits VALUES (105, 'Jeddah Corniche Circuit', 105, 6.174, 27);
INSERT INTO circuits VALUES (106, 'Miami International Autodrome', 106, 5.412, 19);
INSERT INTO circuits VALUES (107, 'Autodromo Enzo e Dino Ferrari', 107, 4.909, 19);
INSERT INTO circuits VALUES (108, 'Circuit de Monaco', 108, 3.337, 19);
INSERT INTO circuits VALUES (109, 'Circuit de Barcelona-Catalunya', 109, 4.657, 14);
INSERT INTO circuits VALUES (110, 'Circuit Gilles Villeneuve', 110, 4.361, 14);
INSERT INTO circuits VALUES (111, 'Red Bull Ring', 111, 4.318, 10);
INSERT INTO circuits VALUES (112, 'Silverstone Circuit', 112, 5.891, 18);
INSERT INTO circuits VALUES (113, 'Circuit de Spa-Francorchamps', 113, 7.004, 19);
INSERT INTO circuits VALUES (114, 'Hungaroring', 114, 4.381, 14);
INSERT INTO circuits VALUES (115, 'Circuit Zandvoort', 115, 4.259, 14);
INSERT INTO circuits VALUES (116, 'Autodromo Nazionale Monza', 116, 5.793, 11);
INSERT INTO circuits VALUES (117, 'Baku City Circuit', 117, 6.003, 20);
INSERT INTO circuits VALUES (118, 'Marina Bay Street Circuit', 118, 4.940, 19);
INSERT INTO circuits VALUES (119, 'Circuit of the Americas', 119, 5.513, 20);
INSERT INTO circuits VALUES (120, 'Autodromo Hermanos Rodriguez', 120, 4.304, 17);
INSERT INTO circuits VALUES (121, 'Interlagos Circuit', 121, 4.309, 15);
INSERT INTO circuits VALUES (122, 'Las Vegas Strip Circuit', 122, 6.201, 17);
INSERT INTO circuits VALUES (123, 'Lusail International Circuit', 123, 5.419, 16);
INSERT INTO circuits VALUES (124, 'Yas Marina Circuit', 124, 5.281, 16);
commit;

---------------------------

INSERT INTO races_results_status VALUES (1, 'Finished');
INSERT INTO races_results_status VALUES (2, 'DNF');
INSERT INTO races_results_status VALUES (3, 'DNS');
INSERT INTO races_results_status VALUES (4, 'DSQ');
commit;

--------------------------

INSERT INTO races VALUES (101, 76, 'Australian Grand Prix', '16/03/2025', 101);
INSERT INTO races VALUES (102, 76, 'Chinese Grand Prix', '23/03/2025', 102);
INSERT INTO races VALUES (103, 76, 'Japanese Grand Prix', '06/04/2025', 103);
commit;

---------------------------

INSERT INTO races_qualifying VALUES (101, 101, 113, 106, INTERVAL '0 00:01:17.500' DAY TO SECOND, INTERVAL '0 00:01:16.800' DAY TO SECOND, INTERVAL '0 00:01:16.100' DAY TO SECOND, 1);
INSERT INTO races_qualifying VALUES (102, 101, 119, 109, INTERVAL '0 00:01:17.400' DAY TO SECOND, INTERVAL '0 00:01:16.900' DAY TO SECOND, INTERVAL '0 00:01:16.150' DAY TO SECOND, 2);
INSERT INTO races_qualifying VALUES (103, 101, 107, 103, INTERVAL '0 00:01:17.600' DAY TO SECOND, INTERVAL '0 00:01:17.000' DAY TO SECOND, INTERVAL '0 00:01:16.300' DAY TO SECOND, 3);
INSERT INTO races_qualifying VALUES (104, 101, 112, 106, INTERVAL '0 00:01:17.550' DAY TO SECOND, INTERVAL '0 00:01:16.950' DAY TO SECOND, INTERVAL '0 00:01:16.400' DAY TO SECOND, 4);
INSERT INTO races_qualifying VALUES (105, 101, 106, 103, INTERVAL '0 00:01:17.700' DAY TO SECOND, INTERVAL '0 00:01:17.100' DAY TO SECOND, INTERVAL '0 00:01:16.500' DAY TO SECOND, 5);
INSERT INTO races_qualifying VALUES (106, 101, 115, 107, INTERVAL '0 00:01:17.800' DAY TO SECOND, INTERVAL '0 00:01:17.200' DAY TO SECOND, INTERVAL '0 00:01:16.700' DAY TO SECOND, 6);
INSERT INTO races_qualifying VALUES (107, 101, 114, 107, INTERVAL '0 00:01:17.900' DAY TO SECOND, INTERVAL '0 00:01:17.400' DAY TO SECOND, INTERVAL '0 00:01:17.000' DAY TO SECOND, 7);
INSERT INTO races_qualifying VALUES (108, 101, 121, 110, INTERVAL '0 00:01:18.000' DAY TO SECOND, INTERVAL '0 00:01:17.500' DAY TO SECOND, INTERVAL '0 00:01:17.200' DAY TO SECOND, 8);
INSERT INTO races_qualifying VALUES (109, 101, 104, 102, INTERVAL '0 00:01:18.100' DAY TO SECOND, INTERVAL '0 00:01:17.600' DAY TO SECOND, INTERVAL '0 00:01:17.400' DAY TO SECOND, 9);
INSERT INTO races_qualifying VALUES (110, 101, 120, 110, INTERVAL '0 00:01:18.050' DAY TO SECOND, INTERVAL '0 00:01:17.550' DAY TO SECOND, INTERVAL '0 00:01:17.600' DAY TO SECOND, 10);
commit;

-----------------------

INSERT INTO races_results VALUES (101, 101, 113, 106, 1, 25, 1);
INSERT INTO races_results VALUES (102, 101, 119, 109, 2, 18, 1);
INSERT INTO races_results VALUES (103, 101, 107, 103, 3, 15, 1);
INSERT INTO races_results VALUES (104, 101, 112, 106, 4, 12, 1);
INSERT INTO races_results VALUES (105, 101, 106, 103, 5, 10, 1);
INSERT INTO races_results VALUES (106, 101, 115, 107, 6, 8, 1);
INSERT INTO races_results VALUES (107, 101, 121, 110, 7, 6, 1);
INSERT INTO races_results VALUES (108, 101, 104, 102, 8, 4, 1);
INSERT INTO races_results VALUES (109, 101, 111, 105, 9, 2, 1);
INSERT INTO races_results VALUES (110, 101, 118, 109, 10, 1, 1);
INSERT INTO races_results VALUES (111, 101, 114, 107, 11, 0, 1);
INSERT INTO races_results VALUES (112, 101, 120, 110, 12, 0, 1);
INSERT INTO races_results VALUES (113, 101, 117, 108, 13, 0, 1);
INSERT INTO races_results VALUES (114, 101, 105, 102, 14, 0, 1);
INSERT INTO races_results VALUES (115, 101, 109, 104, 15, 0, 1);
INSERT INTO races_results VALUES (116, 101, 108, 104, 16, 0, 1);
INSERT INTO races_results VALUES (117, 101, 110, 105, 17, 0, 1);
INSERT INTO races_results VALUES (118, 101, 101, 101, 18, 0, 1);
INSERT INTO races_results VALUES (119, 101, 103, 101, 19, 0, 1);
INSERT INTO races_results VALUES (120, 101, 116, 108, 20, 0, 2);
commit;