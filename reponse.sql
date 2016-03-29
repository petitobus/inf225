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

Créez la vue bons_buveurs des buveurs de type 'gros' ou 'moyen'.
 create view bons_buveurs as select * from buveurs where type ='gros' or type='moyen';
Créez la vue buveurs_asec des buveurs qui n'ont jamais rien acheté.
create view buveurs_asec as select * from buveurs where buveurs.NB not in (select NB from achats);
Créez la vue buveurs_achats complémentaire de la précédente.
create view buveurs_achats as (select NB from achats UNION select NB from buveurs);
Créez une vue q83pl (LIEU, CRU, QTE_BUE) qui donne par LIEU et CRU les quantités totales achetées en 1983 par tous les buveurs.
create view q83pl as select p.region,v.cru,a.qte from producteurs p,recoltes r,vins v,achats a,buveurs b where p.NP = r.NP and r.NV=v.NV and v.NV=a.NV and a.NB=b.NB and (a.dates like '%83'); 
Peut on définir la même vue avec un ordre croissant sur l'attribut QTE ? Proposez une explication ?
create view q83plqq as select p.region,v.cru,a.qte from producteurs p,recoltes r,vins v,achats a,buveurs b where p.NP = r.NP and r.NV=v.NV and v.NV=a.NV and a.NB=b.NB and (a.dates like '%83') ORDER BY a.qte; 
Ecrivez une requête qui donne le cru ayant le de degré le plus élevé ? Avez vous besoin d'une vue pour réaliser cette requête ?
select cru from vins where vins.degre = (select MAx(degre) from vins);
