-- Implémentation des tables:
create table Avion(
  NA int NOT NULL,
  Nom varchar(12),
  Capacité int,
  Localité varchar(10),
  Primary Key(NA)
  );

create table Pilote(
  NP int NOT NULL,
  Nom varchar(25),
  Adress varchar(10),
  Primary Key(NP)
  );
  
create table Vol(
  NV varchar(6) NOT NULL,
  NP int NOT NULL, 
  NA int NOT NULL,
  VD varchar(10),
  VA varchar(10),
  HD int,
  HA int, 
  Foreign Key(NP) references Pilote(NP),
  Foreign Key(NA) references Avion(NA),
  Primary Key(NV,NP,NA)
  );

-- Insertion de valeurs:
insert into Avion values(100, 'AIRBUS', 300, 'RABAT');
insert into Avion values(101,'B737',250,'CASA');
insert into Avion values(101, 'B737',220,'RABAT');

--Queries:

--1)Afficher tous les avions:
select *
from Avion;

--2)Afficher tous les avions par ordre croissant sur le nom:
select *
from Avion
order by Nom Asc;

--3)Afficher les noms et les capacités des avions:
select Nom, Capacité
from Avion;

--4)Afficher les localités des avions sans redondance:
select distinct Localité
from Avion;

--5)Afficher les avions dans la localité et Rabat ou Casa:
select *
from Avion
where Localité='Rabat' OR Localité='Casa';

--6)Modifier la capacité de l’avion numéro 101, la nouvelle capacité et 220:
Update Avion
set Capacité=220
where NA=101;

--7)Supprimer les avions dont la capacité et inférieure à 200:
delete from Avion
where Capacité<200;

--8)Afficher la capacité maximale, minimale, moyenne des avions:
select max(Capacité), min(Capacité), avg(Capacité)
from Avion;

--9)Afficher les données des avions dont la capacité et la plus basse:
select *
from Avion
where Capacité=(select min(Capacité) from Avion);

--10)Afficher les données des avions dont la capacité et supérieure à la capacité moyenne:
select * 
from Avion
where Capacité>(select avg(Capacité) from Avion);

--11)Afficher le nom et l’adresse des pilotes assurant les vols IT100 et IT104:
select Nom, Adress
from Pilote P, Vol V
where P.NP=V.NP AND NV='IT100' AND NV='IT104';

--12)Afficher les numéros des pilotes qui sont en service:
select *
from Vol;

--13)Afficher les numéros des pilotes qui ne sont pas en service:
select NP
from Pilote
where P.NP NOT IN(select NP from Vol);

--14)Afficher les noms des pilotes qui conduisent un AIRBUS:
select P.Nom
from Pilote P, Vol V, Avion A
where P.NP=V.NP AND V.NA=A.NA AND A.Nom='AIRBUS';


