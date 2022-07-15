create procedure sp_commande_par_numCommande(@numcommande Nvarchar(50))
As
select s_product.id AS [num Produit], s_Product.name As [nom Produit],s_item.price AS [prix],s_item.quantity AS Quantite,
s_item.Price*s_item.quantity AS [Total HT],s_item.Price*s_item.quantity+s_item.Price*s_item.quantity*0.18 AS [Total TTC]
From Product p,s_item i,S_ord o
where o.id=i.order_id and p.id=i.product_id and o.id=@numcommande