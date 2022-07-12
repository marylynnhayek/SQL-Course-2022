-- SP_5.sql: Ecrire une procédure stockée qui permet de sortir la facture
-- d'une commande de la facon suivante en paramètre de numéro de commande
-- et la valeur de la taxe (voir gallery for format): 
create PROCEDURE Facture_taxe(@ord int, @Taxe decimal(4,2))
AS
BEGIN
    SELECT ord_id, product_id, nom, price, quantity, price*quantity as 'Total HT',
    quantity*price*(Taxe+1) as "Total TTC"
    from s_item i, s_product p
    where i.product_id=p.id and @ord=ord_id;
END;

EXEC Facture_taxe(100,18%);