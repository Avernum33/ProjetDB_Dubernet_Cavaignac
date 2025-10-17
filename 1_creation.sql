drop schema if exists projetdb;
create schema projetdb;
use projetdb;

DROP TABLE IF EXISTS Resultat ;
DROP TABLE IF EXISTS GrandPrix ;
DROP TABLE IF EXISTS Circuit ;
DROP TABLE IF EXISTS Voiture ;
DROP TABLE IF EXISTS Moteur ;
DROP TABLE IF EXISTS Participe ;
DROP TABLE IF EXISTS Saison ;
DROP TABLE IF EXISTS Pilote ;
DROP TABLE IF EXISTS Equipe ;
DROP TABLE IF EXISTS Pays ;


CREATE TABLE Pays (
    pays_id SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Equipe (
    eq_id SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Budget DOUBLE,
    pays_id INT NOT NULL REFERENCES Pays(pays_id)
);

CREATE TABLE Moteur (
    mot_id SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    VolumeCylindre INT,
    Materiaux VARCHAR(100),
    Constructeur VARCHAR(100),
    NombreCylindre INT
);

CREATE TABLE Voiture (
    voi_id SERIAL PRIMARY KEY,
    Modele VARCHAR(100) NOT NULL,
    Frein VARCHAR(100),
    Pneu VARCHAR(100),
    Suspension VARCHAR(100),
    Volant VARCHAR(100),
    Chassis VARCHAR(100),
    mot_id INT NOT NULL REFERENCES Moteur(mot_id),
    eq_id INT NOT NULL REFERENCES Equipe(eq_id)
);

CREATE TABLE Pilote (
    pil_id SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100) NOT NULL,
    DateNaissance DATE,
    NumeroPilote INT,
    eq_id INT REFERENCES Equipe(eq_id),
    pays_id INT REFERENCES Pays(pays_id)
);

CREATE TABLE Saison (
    saison_id SERIAL PRIMARY KEY,
    Annee INT NOT NULL
);

CREATE TABLE Participe (
    eq_id INT NOT NULL REFERENCES Equipe(eq_id),
    saison_id INT NOT NULL REFERENCES Saison(saison_id),
    PRIMARY KEY (eq_id, saison_id)
);

CREATE TABLE Circuit (
    cir_id SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    NbTour INT,
    Longueur DOUBLE
);

CREATE TABLE GrandPrix (
    gp_id SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    gp_Date DATE NOT NULL,
    cir_id INT NOT NULL REFERENCES Circuit(cir_id),
    saison_id INT NOT NULL REFERENCES Saison(saison_id)
);

CREATE TABLE Resultat (
    res_id SERIAL PRIMARY KEY,
    Position INT,
    Points INT,
    TempsDebutCourse time,
    TempsFinCourse time,
    Abandon BOOLEAN DEFAULT FALSE,
    pil_id INT NOT NULL REFERENCES Pilote(pil_id)
);


