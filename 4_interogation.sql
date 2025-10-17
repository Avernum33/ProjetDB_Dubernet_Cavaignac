USE projetdb;

-- 1. Liste des pilotes avec leur équipe et leur pays
SELECT p.Nom, p.Prenom, e.Nom AS Equipe, pa.Nom AS Pays
FROM Pilote p
JOIN Equipe e ON p.eq_id = e.eq_id
JOIN Pays pa ON p.pays_id = pa.pays_id
ORDER BY e.Nom, p.Nom;

-- 2. Pilotes britanniques
SELECT Nom, Prenom
FROM Pilote
WHERE pays_id IN (SELECT pays_id FROM Pays WHERE Nom LIKE '%Royaume%')
ORDER BY Prenom;

-- 3. Circuits de plus de 6000 mètres
SELECT Nom, Longueur
FROM Circuit
WHERE Longueur > 6000
ORDER BY Longueur DESC;

-- 4. Équipes dont le budget est compris entre 200 et 300 M€
SELECT Nom, Budget
FROM Equipe
WHERE Budget BETWEEN 200 AND 300
ORDER BY Budget DESC;

-- 5. Noms de circuits contenant le mot "Italie" ou "Monaco"
SELECT Nom
FROM GrandPrix
WHERE Nom LIKE '%Italie%' OR Nom LIKE '%Monaco%'
ORDER BY Nom;

-- 6. Nombre de pilotes par équipe
SELECT e.Nom AS Equipe, COUNT(p.pil_id) AS NbPilotes
FROM Pilote p
JOIN Equipe e ON p.eq_id = e.eq_id
GROUP BY e.Nom
ORDER BY NbPilotes DESC;

-- 7. Budget total et moyen des équipes par pays
SELECT pa.Nom AS Pays, SUM(e.Budget) AS BudgetTotal, ROUND(AVG(e.Budget),2) AS BudgetMoyen
FROM Equipe e
JOIN Pays pa ON e.pays_id = pa.pays_id
GROUP BY pa.Nom
ORDER BY BudgetTotal DESC;

-- 8. Équipes ayant plus de 2 pilotes
SELECT e.Nom, COUNT(p.pil_id) AS NbPilotes
FROM Equipe e
JOIN Pilote p ON e.eq_id = p.eq_id
GROUP BY e.Nom
HAVING COUNT(p.pil_id) > 2;

-- 9. Moyenne de points par équipe
SELECT e.Nom AS Equipe, ROUND(AVG(r.Points),2) AS MoyPoints
FROM Resultat r
JOIN Pilote p ON r.pil_id = p.pil_id
JOIN Equipe e ON p.eq_id = e.eq_id
GROUP BY e.Nom
ORDER BY MoyPoints DESC;

-- 10. Nombre de circuits par longueur moyenne (catégories)
SELECT 
  CASE 
    WHEN Longueur < 5000 THEN 'Court'
    WHEN Longueur BETWEEN 5000 AND 6000 THEN 'Moyen'
    ELSE 'Long'
  END AS TypeCircuit,
  COUNT(*) AS NbCircuits
FROM Circuit
GROUP BY TypeCircuit;

-- 11. Liste des Grands Prix avec le circuit et la saison correspondante
SELECT gp.Nom AS GrandPrix, c.Nom AS Circuit, s.Annee
FROM GrandPrix gp
INNER JOIN Circuit c ON gp.cir_id = c.cir_id
INNER JOIN Saison s ON gp.saison_id = s.saison_id
ORDER BY s.Annee DESC;

-- 12. Liste des équipes avec leur pays (LEFT JOIN pour inclure pays sans équipes)
SELECT pa.Nom AS Pays, e.Nom AS Equipe
FROM Pays pa
LEFT JOIN Equipe e ON pa.pays_id = e.pays_id
ORDER BY pa.Nom;

-- 13. Pilotes et leur voiture (JOIN multiples)
SELECT p.Nom, p.Prenom, v.Modele, m.Nom AS Moteur
FROM Pilote p
JOIN Equipe e ON p.eq_id = e.eq_id
JOIN Voiture v ON e.eq_id = v.eq_id
JOIN Moteur m ON v.mot_id = m.mot_id
ORDER BY e.Nom;

-- 14. Équipes ayant participé à la saison 2025
SELECT e.Nom AS Equipe, s.Annee
FROM Equipe e
JOIN Participe pa ON e.eq_id = pa.eq_id
JOIN Saison s ON pa.saison_id = s.saison_id
WHERE s.Annee = 2025;

-- 15. Circuits avec Grands Prix (RIGHT JOIN pour montrer circuits utilisés ou non)
SELECT c.Nom AS Circuit, gp.Nom AS GrandPrix
FROM Circuit c
RIGHT JOIN GrandPrix gp ON c.cir_id = gp.cir_id
ORDER BY c.Nom;


-- 16. Pilotes appartenant à une équipe ayant gagné au moins un GP
SELECT Nom, Prenom
FROM Pilote
WHERE eq_id IN (
    SELECT DISTINCT p.eq_id
    FROM Pilote p
    JOIN Resultat r ON p.pil_id = r.pil_id
    WHERE r.Position = 1
);

-- 17. Pays sans équipe
SELECT Nom
FROM Pays
WHERE pays_id NOT IN (SELECT pays_id FROM Equipe);

-- 18. Pilotes dont le temps de course est inférieur à la moyenne
SELECT p.Nom, p.Prenom
FROM Pilote p
JOIN Resultat r ON p.pil_id = r.pil_id
WHERE (TIME_TO_SEC(r.TempsFinCourse) - TIME_TO_SEC(r.TempsDebutCourse))
      < (SELECT AVG(TIME_TO_SEC(TempsFinCourse) - TIME_TO_SEC(TempsDebutCourse)) FROM Resultat WHERE TempsFinCourse IS NOT NULL);

-- 19. Équipes avec budget supérieur à toutes les équipes françaises
SELECT Nom, Budget
FROM Equipe
WHERE Budget > ALL (SELECT Budget FROM Equipe e JOIN Pays p ON e.pays_id = p.pays_id WHERE p.Nom='France');

-- 20. Pilotes appartenant à des équipes ayant participé à la saison 2025
SELECT p.Nom, p.Prenom
FROM Pilote p
WHERE EXISTS (
    SELECT 1 FROM Participe pa
    JOIN Saison s ON pa.saison_id = s.saison_id
    WHERE s.Annee = 2025 AND pa.eq_id = p.eq_id
);
