-- Autre exo Triggers:

-- We already have the ERD, donc we create the table directly:
create table Animal(
    id int PRIMARY KEY,
    sexe VARCHAR(1),
    date_naissance DATE,
    nom VARCHAR(50),
    commentaire VARCHAR(500),
    espece_id int,
    race_id int,
    mere_id int,
    pere_id int
);

create table client(
    client_id int primary key,
    NomClient varchar(50),
    Tel VARCHAR(10)
);

create table Adoption(
    Client_id int,
    animal_id int,
    date_reservation date,
    prix int,
    paye VARCHAR(1),
    FOREIGN KEY(animal_id) REFERENCES Animal(id),
    FOREIGN KEY(Client_id) REFERENCES client(Client_id),
    primary KEY(Client_id,animal_id)
);

create table Espece(
    id int NOT NULL,
    nom_courant varchar(50),
    nom_latin varchar(50),
    adescription VARCHAR(50),
    prix int,
    primary key(id)
)

create table Race(
    id int NOT NULL,
    nom varchar(50),
    espece_id int,
    rdescription varchar(50),
    prix int,
    primary key(id),
    FOREIGN KEY(espece_id) REFERENCES Espece(id)
);

-- 1 to many relationship between Espece and Animal tables.
ALTER TABLE Animal
add CONSTRAINT Fk_Espece FOREIGN KEY(espece_id) REFERENCES Espece(id);

-- 1 to many relationship between Race and Animal tables.
ALTER TABLE Animal
add CONSTRAINT FK_Race FOREIGN KEY(espece_id) REFERENCES Espece(id);

-- 1. Trigger #1:
-- The following trigger, after insert or update of an animal in the table animal, this trigger will be launched, it will make sure
-- That the input is correct, meaning it will check the sexe attribute which should take 1 of the 4 following choices: 'F','M','m' or 'f'. 
-- Lors de l'insertion ou la mise a jours de données, la valeur de sexe va etre stockée dans la table temporaire nommée 'Inserted'. If it doesn't match any 
-- of the 4 values, it will be set to null. 

create trigger Tr_verif_input_Animal
    On dbo.Animal
    after insert,update
    As
        Declare @sexe char(1)
        set @sexe=(select sexe from inserted)
        if(@sexe NOT IN('M','m','F','f'))
            begin
                update Animal
                set sexe=Null
                where id=(select id from inserted)
            End
        else
            begin
                update  Animal
                set sexe=upper(sexe)
                where id=(select id from inserted)
            End;

-- 2. Trigger #2: This trigger will be launched on the Adoption table, on every insert or update event,
-- it will place a 1 in the paye attribute section whenever the price attribute has a certain value. 

ALTER trigger [dbo].[VerifPayeAfterInsert1] on [dbo].[Adoption]
After insert,update
AS
BEGIN
    update Adoption
    set Adoption.paye=1
    where adoption.client_id IN(select Client_id from inserted where prix is NOT NULL)
END;