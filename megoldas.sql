/* 1. feladat:  */
CREATE DATABASE centrum
CHARACTER SET utf8mb4
COLLATE utf8mb4_hungarian_ci;

/* 3. feladat:  */

/* 4. feladat:  */
SELECT nev,kerulet
FROM gazda
WHERE kerulet=17 OR kerulet=18
GROUP BY nev
ORDER BY kerulet ASC,nev ASC;

/* 5. feladat:  */
SELECT kezelestipus.jelleg,COUNT(kezeles.kezelestipusId)
FROM kezelestipus
JOIN kezeles
ON kezelestipus.id=kezeles.kezelestipusId
GROUP BY kezelestipus.jelleg;

/* 6. feladat:  */
SELECT kezelestipus.jelleg,kezeles.kezdet,kezeles.veg,kezeles.dij
FROM kezelestipus
JOIN kezeles
ON kezelestipus.id=kezeles.kezelestipusId
WHERE kezelestipus.jelleg LIKE '%gyógy%' AND YEAR(kezeles.veg)=2017 AND MONTH(kezeles.veg)>=9;

/* 7. feladat:  */
SELECT gazda.nev AS 'név',COUNT(kezeles.kutyaId) AS 'alkalom',SUM(kezeles.dij) AS 'összesen'
FROM gazda

INNER JOIN kutya
ON gazda.id=kutya.gazdaId

INNER JOIN kezeles
ON kezeles.kutyaId=kutya.id

WHERE gazda.nev LIKE 'Medgyessy_%'
GROUP BY név
ORDER BY név ASC;
