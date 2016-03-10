Quels sont les différents types de buveurs ?
 SQL> SELECT DISTINCT TYPE FROM BUVEURS;
    petit moyen gros
Lister les vins triés par crus croissants et millésimes décroissants?
    SQL> select * from vins ORDER BY CRU ASC, MILL DESC;
    ...    
Quelles sont les régions de production de Pommard ou de Brouilly ?
    select region from producteurs,recoltes,vins where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and (vins.cru='Pommard' or vins.cru='brouilly'); 
    Rhone
    Bourgogne
Quelles sont les régions de production de Pommard et de Brouilly ?
    SQL> (select region from producteurs,recoltes,vins where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru='Pommard') INTERSECT (select region from producteurs,recoltes,vins where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru='Brouilly'); 
Quantités achetées par cru et par millésime ?
    SQL> select cru,mill,qte from vins,Achats where vins.NV=achats.NV;

Retrouver les numéros des vins produits par plus de trois producteurs.
    SQL> select NV from recoltes where qte>3;
Quels sont les producteurs qui ne produisent pas ?
	select distinct NOM from producteurs where NP not in (select NP from recoltes);
    Quels sont les buveurs qui ont acheté au moins un vin de millésime 1980 ?
    select DISTINCT buveurs.NOM  from buveurs,vins,achats where vins.mill=1980 and vins.NV=achats.NV and buveurs.NB=achats.NB and achats.qte>0;
Quels sont les buveurs qui n'ont acheté aucun vin de millésime 1980 ?
select buveurs.NOM from buveurs where buveurs.NB not in (select buveurs.NB from buveurs,vins,achats where vins.mill=1980 and vins.NV=achats.NV and buveurs.NB=achats.NB and achats.qte>0);
Quels sont les buveurs qui n'ont acheté que des vins de millésime 1980 ?
select buveurs.NOM from buveurs where buveurs.NB in (select DISTINCT buveurs.NB  from buveurs,vins,achats where vins.mill=1980 and vins.NV=achats.NV and buveurs.NB=achats.NB and achats.qte>0;) and buveurs.NB not in (select buveurs.NB from buveurs,achacts,vins where vins.mill!=1980 and vins.NV=achats.NV and buveurs.NB=achats.NB and achats.qte>0)
Quels sont les buveurs qui ont acheté tous les vins de millésime 1980 ?
select achats.NB from achats,vins where vins.mill=1980 and vins.NV=achats.NV and (select distinct count(achats.NV) from achat=(

select buveurs.NOM form buveurs where buveurs.NOM in (select buveurs.NOM from (select buveurs.NOM achats.NV as p from buveurs,vins,achats where buveurs.NB=achats.NB and achats.NV=vins.NV and vins.mill==1980) where  and count(achats.NV)=(select distinct count(vins.NV) from vins where vins.mill=1980);
