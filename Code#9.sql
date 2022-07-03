-- Exo CIN:
-- 1- Affichez les personnes qui possèdent de voitures mais pas de Motos:
select nom, prenom
from personnes
where CIN IN(
select CIN from voiture) 
AND p.CIN NOT IN(select CIN from Moto);

-- Methode 2:
select nom, pernom
from personnes
where CIN IN(
select CIN from voiture
EXCEPT
select CIN from Moto
);

-- 2- Affichez les personnes qui possèdent de Motos et de Voitures:
select nom, prenom
from personnes
where CIN in(select CIN from voiture)
INTERSECT
select nom, prenom
from personnes
where CIN in(select CIN from moto);

-- 3- Affichez les personnes qui possèdent ni voitures ni motos:
select CIN
from personnes
where CIN NOT IN (
select CIN from voiture
UNION
select CIN from moto);