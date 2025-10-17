-- ======================================================================
-- Insertion des données
-- ======================================================================

-- 1) Pays
INSERT INTO Pays (Nom) VALUES
('Royaume-Uni'),
('Allemagne'),
('Italie'),
('Autriche'),
('France'),
('Espagne'),
('Japon'),
('États-Unis'),
('Suisse'),
('Monaco'),
('Finlande'),
('Mexique'),
('Australie'),
('Canada'),
('Pays-Bas');

-- 2) Équipes (10 équipes de F1 2025)
INSERT INTO Equipe (Nom, Budget, pays_id) VALUES
('Red Bull Racing', 310.0, (SELECT pays_id FROM Pays WHERE Nom='Autriche')),
('Ferrari', 300.0, (SELECT pays_id FROM Pays WHERE Nom='Italie')),
('Mercedes', 295.0, (SELECT pays_id FROM Pays WHERE Nom='Allemagne')),
('McLaren', 250.0, (SELECT pays_id FROM Pays WHERE Nom='Royaume-Uni')),
('Aston Martin', 240.0, (SELECT pays_id FROM Pays WHERE Nom='Royaume-Uni')),
('Alpine', 220.0, (SELECT pays_id FROM Pays WHERE Nom='France')),
('Williams', 200.0, (SELECT pays_id FROM Pays WHERE Nom='Royaume-Uni')),
('RB (Visa Cash App RB)', 190.0, (SELECT pays_id FROM Pays WHERE Nom='Italie')),
('Kick Sauber', 180.0, (SELECT pays_id FROM Pays WHERE Nom='Suisse')),
('Haas F1 Team', 170.0, (SELECT pays_id FROM Pays WHERE Nom='États-Unis'));

-- 3) Moteurs
INSERT INTO Moteur (Nom, VolumeCylindre, Materiaux, Constructeur, NombreCylindre) VALUES
('Honda RBPT', 1600, 'alliage', 'Honda', 6),
('Ferrari Power Unit', 1600, 'alliage', 'Ferrari', 6),
('Mercedes-AMG F1', 1600, 'alliage', 'Mercedes', 6),
('Renault E-Tech', 1600, 'alliage', 'Renault', 6),
('Honda RBPT (RB)', 1600, 'alliage', 'Honda', 6),
('Mercedes-AMG Aston', 1600, 'alliage', 'Mercedes', 6),
('Mercedes-AMG McLaren', 1600, 'alliage', 'Mercedes', 6),
('Ferrari Haas', 1600, 'alliage', 'Ferrari', 6),
('Ferrari Sauber', 1600, 'alliage', 'Ferrari', 6),
('Mercedes Williams', 1600, 'alliage', 'Mercedes', 6);

-- 4) Voitures
INSERT INTO Voiture (Modele, Frein, Pneu, Suspension, Volant, Chassis, mot_id, eq_id) VALUES
('RB21', 'Brembo', 'Pirelli', 'Pushrod', 'Volant Red Bull', 'Carbone', 1, 1),
('SF-24', 'Brembo', 'Pirelli', 'Pushrod', 'Volant Ferrari', 'Carbone', 2, 2),
('W15', 'Brembo', 'Pirelli', 'Pullrod', 'Volant Mercedes', 'Carbone', 3, 3),
('MCL38', 'Brembo', 'Pirelli', 'Pushrod', 'Volant McLaren', 'Carbone', 7, 4),
('AMR25', 'Brembo', 'Pirelli', 'Pushrod', 'Volant Aston Martin', 'Carbone', 6, 5),
('A524', 'Brembo', 'Pirelli', 'Pushrod', 'Volant Alpine', 'Carbone', 4, 6),
('FW47', 'Brembo', 'Pirelli', 'Pushrod', 'Volant Williams', 'Carbone', 10, 7),
('VCARB 01', 'Brembo', 'Pirelli', 'Pushrod', 'Volant RB', 'Carbone', 5, 8),
('C45', 'Brembo', 'Pirelli', 'Pushrod', 'Volant Sauber', 'Carbone', 9, 9),
('VF-25', 'Brembo', 'Pirelli', 'Pushrod', 'Volant Haas', 'Carbone', 8, 10);

-- 5) Pilotes principaux 2025
INSERT INTO Pilote (Nom, Prenom, DateNaissance, NumeroPilote, eq_id, pays_id) VALUES
('Verstappen', 'Max', '1997-09-30', 1, 1, (SELECT pays_id FROM Pays WHERE Nom='Pays-Bas')),
('Pérez', 'Sergio', '1990-01-26', 11, 1, (SELECT pays_id FROM Pays WHERE Nom='Mexique')),
('Leclerc', 'Charles', '1997-10-16', 16, 2, (SELECT pays_id FROM Pays WHERE Nom='Monaco')),
('Sainz', 'Carlos', '1994-09-01', 55, 2, (SELECT pays_id FROM Pays WHERE Nom='Espagne')),
('Hamilton', 'Lewis', '1985-01-07', 44, 3, (SELECT pays_id FROM Pays WHERE Nom='Royaume-Uni')),
('Russell', 'George', '1998-02-15', 63, 3, (SELECT pays_id FROM Pays WHERE Nom='Royaume-Uni')),
('Norris', 'Lando', '1999-11-13', 4, 4, (SELECT pays_id FROM Pays WHERE Nom='Royaume-Uni')),
('Piastri', 'Oscar', '2001-04-06', 81, 4, (SELECT pays_id FROM Pays WHERE Nom='Australie')),
('Alonso', 'Fernando', '1981-07-29', 14, 5, (SELECT pays_id FROM Pays WHERE Nom='Espagne')),
('Stroll', 'Lance', '1998-10-29', 18, 5, (SELECT pays_id FROM Pays WHERE Nom='Canada')),
('Gasly', 'Pierre', '1996-02-07', 10, 6, (SELECT pays_id FROM Pays WHERE Nom='France')),
('Ocon', 'Esteban', '1996-09-17', 31, 6, (SELECT pays_id FROM Pays WHERE Nom='France')),
('Albon', 'Alexander', '1996-03-23', 23, 7, (SELECT pays_id FROM Pays WHERE Nom='Royaume-Uni')),
('Sargeant', 'Logan', '2000-12-31', 2, 7, (SELECT pays_id FROM Pays WHERE Nom='États-Unis')),
('Tsunoda', 'Yuki', '2000-05-11', 22, 8, (SELECT pays_id FROM Pays WHERE Nom='Japon')),
('Lawson', 'Liam', '2002-02-11', 30, 8, (SELECT pays_id FROM Pays WHERE Nom='Nouvelle-Zélande')),
('Bottas', 'Valtteri', '1989-08-28', 77, 9, (SELECT pays_id FROM Pays WHERE Nom='Finlande')),
('Zhou', 'Guanyu', '1999-05-30', 24, 9, (SELECT pays_id FROM Pays WHERE Nom='Chine')),
('Magnussen', 'Kevin', '1992-10-05', 20, 10, (SELECT pays_id FROM Pays WHERE Nom='Danemark')),
('Hülkenberg', 'Nico', '1987-08-19', 27, 10, (SELECT pays_id FROM Pays WHERE Nom='Allemagne'));

-- 6) Saisons (2005–2025)
INSERT INTO Saison (Annee) VALUES
(2005),(2006),(2007),(2008),(2009),(2010),(2011),(2012),(2013),(2014),
(2015),(2016),(2017),(2018),(2019),(2020),(2021),(2022),(2023),(2024),(2025);

-- 7) Participe : 10 équipes dans la saison 2025
INSERT INTO Participe (eq_id, saison_id)
SELECT eq_id, (SELECT saison_id FROM Saison WHERE Annee=2025) FROM Equipe;

-- 8) Circuits emblématiques
INSERT INTO Circuit (Nom, NbTour, Longueur) VALUES
('Circuit de Monaco', 78, 3377),
('Silverstone', 52, 5891),
('Spa-Francorchamps', 44, 7004),
('Monza', 53, 5793),
('Circuit of the Americas', 56, 5513),
('Suzuka', 53, 5807),
('Interlagos', 71, 4309),
('Yas Marina', 58, 5281),
('Barcelona-Catalunya', 66, 4655),
('Bahrain International Circuit', 57, 5412),
('Singapore', 62, 4927);

-- 9) Grands Prix (saison 2024 pour l’exemple)
INSERT INTO GrandPrix (Nom, gp_Date, cir_id, saison_id) VALUES
('Grand Prix de Bahreïn 2024', '2024-03-02', (SELECT cir_id FROM Circuit WHERE Nom='Bahrain International Circuit'), (SELECT saison_id FROM Saison WHERE Annee=2024)),
('Grand Prix de Monaco 2024', '2024-05-26', (SELECT cir_id FROM Circuit WHERE Nom='Circuit de Monaco'), (SELECT saison_id FROM Saison WHERE Annee=2024)),
('Grand Prix de Grande-Bretagne 2024', '2024-07-07', (SELECT cir_id FROM Circuit WHERE Nom='Silverstone'), (SELECT saison_id FROM Saison WHERE Annee=2024)),
('Grand Prix de Belgique 2024', '2024-07-28', (SELECT cir_id FROM Circuit WHERE Nom='Spa-Francorchamps'), (SELECT saison_id FROM Saison WHERE Annee=2024)),
('Grand Prix d’Italie 2024', '2024-09-08', (SELECT cir_id FROM Circuit WHERE Nom='Monza'), (SELECT saison_id FROM Saison WHERE Annee=2024));

-- 10) Résultats fictifs et cohérents
INSERT INTO Resultat (Position, Points, TempsDebutCourse, TempsFinCourse, Abandon, pil_id) VALUES
(1, 25, '14:00:00', '15:35:12', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Verstappen')),
(2, 18, '14:00:00', '15:36:45', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Leclerc')),
(3, 15, '14:00:00', '15:38:05', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Norris')),
(4, 12, '14:00:00', '15:39:40', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Hamilton')),
(5, 10, '14:00:00', '15:41:10', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Russell')),
(6, 8, '14:00:00', '15:43:30', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Alonso')),
(7, 6, '14:00:00', '15:44:00', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Pérez')),
(8, 4, '14:00:00', '15:45:15', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Gasly')),
(9, 2, '14:00:00', '15:46:50', FALSE, (SELECT pil_id FROM Pilote WHERE Nom='Sainz')),
(10, 1, '14:00:00', NULL, TRUE, (SELECT pil_id FROM Pilote WHERE Nom='Ocon'));

-- ======================================================================
-- FIN DU SCRIPT
-- ======================================================================
