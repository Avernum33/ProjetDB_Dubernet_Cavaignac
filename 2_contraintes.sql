
ALTER TABLE Pays
ADD CONSTRAINT uq_pays_nom UNIQUE (Nom);

ALTER TABLE Equipe
ADD CONSTRAINT chk_budget_pos CHECK (Budget >= 0),
ADD CONSTRAINT uq_equipe_nom UNIQUE (Nom, pays_id);

ALTER TABLE Moteur
ADD CONSTRAINT chk_volume_pos CHECK (VolumeCylindre > 0),
ADD CONSTRAINT chk_nb_cylindre_pos CHECK (NombreCylindre > 0);

ALTER TABLE Voiture
ADD CONSTRAINT uq_modele_equipe UNIQUE (Modele, eq_id);

ALTER TABLE Pilote
ADD CONSTRAINT uq_numero_pilote UNIQUE (NumeroPilote),
ADD CONSTRAINT chk_numero_pilote_pos CHECK (NumeroPilote > 0);

ALTER TABLE Saison
ADD CONSTRAINT uq_saison_annee UNIQUE (Annee),
ADD CONSTRAINT chk_saison_annee CHECK (Annee >= 1950);

ALTER TABLE Circuit
ADD CONSTRAINT chk_nb_tour_pos CHECK (NbTour > 0),
ADD CONSTRAINT chk_longueur_pos CHECK (Longueur > 0);

ALTER TABLE GrandPrix
ADD CONSTRAINT uq_gp_nom_saison UNIQUE (Nom, saison_id);

ALTER TABLE Resultat
ADD CONSTRAINT chk_position_pos CHECK (Position > 0),
ADD CONSTRAINT chk_points_pos CHECK (Points >= 0);
