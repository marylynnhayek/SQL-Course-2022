-- Creation d'un trigger qui permet la mise a jour de la quantité en stock aprè l'insertion d'une commande:
CREATE TRIGGER Mise_A_Jour_Stock 
ON commands
AFTER INSERT
AS 
BEGIN
    DECLARE @Qtt_Stock int;
    SET @Qtt_Stock=(select qtc from produit);
    DECLARE @New_Stock int;
    DECLARE @Qtt_Commandee int;
    set @Qtt_Commandee=select(qtc from inserted);
    UPDATE produit
        set New_Stock=@Qtt_Stock-@Qtt_Commandee;
        where NumP=select NumP from inserted;
END;

