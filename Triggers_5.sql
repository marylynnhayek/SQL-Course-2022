-- Creation d'un trigger qui va vérifier la quantité en stock d'un produit avant l'insertion de la commande:

CREATE TRIGGER Verifier_Stock
ON Commandes
INSTEAD OF INSERT
AS 
BEGIN
    DECLARE @QttStock int;
    set @QttStock=(select QttStock from Produit where NumP=(select NumP from inserted));
    DECLARE @Qtcommandee int;
    set @Qtcommandee=(select qtec from inserted);
    if(@Qtcommandee <= @QttStock)
        BEGIN
            INSERT INTO Commandes
            SELECT * from inserted
        END;
    ELSE
        BEGIN
            PRINT 'La quantité commandée doit etre inférieure a la quantité en stock !';
        END;
END;