select * from vins ORDER BY CRU ASC, MILL DESC
/
select region from producteurs,recoltes,vins where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru = 'Pommard'


select region from producteurs,recoltes,vins where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru='Pommard')  vins.cru='brouilly');

select NP,NV from producteurs,recoltes,vins where vins.cru='Pommard'


select NP from  (select NP from vins,recoltes where recoltes.NV=vins.NV and vins.cru='Pommard') P, (select NP from vins,recoltes where recoltes.NV=vins.NV and vins.cru='Brouilly') B where P=B;

select region from producteurs,recoltes,vins where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru = 'Pommard'

select * from producteurs,vins,recoltes where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru='Brouilly';   
select * from producteurs,vins,recoltes where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru='Pommard'; 



select * from (select * from producteurs,vins,recoltes where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru='Pommard') p,(select * from producteurs,vins,recoltes where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru='Brouilly') b where p.REGION=b.REGION;


select p.* from (select * from producteurs,vins,recoltes where producteurs.NP=recoltes.NP and recoltes.NV=vins.NV and vins.cru='Pommard') p
