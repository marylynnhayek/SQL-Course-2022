-- SP_4.sql: Ecrire une procédure stockée qui récupère la facture d'une
-- commande donnée:
create PROCEDURE facture_commande(@ord int)
AS
BEGIN   
    select ord_id, product_id, nom, price, quantity, price*quantity
    from s_item i, s_product p
    where i.product_id=o.id and ord_id=@ord;
END;

EXEC facture_commande(100);