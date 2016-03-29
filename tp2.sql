--Créer une table (notée rbb) de même schéma que bons_buveurs et qui contient les tuples sélectionnés dans bons_buveurs par :
    CREATE TABLE RBB AS SELECT * FROM BONS_BUVEURS;
--Mise à jour de la table buveurs : mettre le type des buveurs à 'gros' si la somme des quantites bues est supérieure à 100.
    UPDATE buveurs SET TYPE = 'gros' where NB in (select NB from achats GROUP BY NB HAVING SUM(qte)>100); 
--Comparer les contenus de la table rbb et la vue bons_buveurs.Qu'observez-vous? expliquez ce qui c'est passé.
    SELECT distinct * from rbb, bons_buveurs where (rbb.NB=bons_buveurs.NB and rbb.type != bons_buveurs.type);
    - !On a défini le vue bons_buveurs par buveurs, donc quand buveurs est changé, bons_buveurs est changé. Mais on a copié le contenu de bons_buveurs à la table rbb, qui va garder la value comme un table independence, et ne peut pas être modifiée par la vue.

--Insérez dans bons_buveurs un buveur qui porte votre nom et votre prénom, un numéro égale au max(nb) + 1 et un type 'moyen'. Est ce que ce buveur est visible à travers la vue ?
    INSERT INTO bons_buveurs VALUES ((select max(NB) from bons_buveurs)+100,'YANG','Xuecan','moyen');
    -! On ne peut pas utilisé max(NB)+1. Parce que max(NB)+1 (soit 100 ici) n'exist pas dans la vue bons_buveurs mais il est exist dans la table Buveurs. Donc on modifie la NB et la nouvelle buveurs est registré dans la table.'

--Insérez dans la même vue un autre buveur de type 'petit'. Est ce que ce buveur est visible ? expliquez ce qui c'est passé.
--Détruisez puis recréez la vue bons_buveurs en spécifiant la clause WITH CHECK OPTION à la fin de la commande. Recommencez l'insertion d'un autre petit buveur. Est ce que ce buveur est maintenant visible ? expliquez ce que fait la clause ajoutée.
--Re-créer les vues buveurs_achats et buveurs_achats2 en précisant la clause WITH CHECK OPTION. Insérer un nouveau buveur à travers chacune de ces vues. Expliquez le comportement d'Oracle.
--Insérez dans q83pl le tuple ('PARIS', 'Cotes du Jura', 300). Tentez de retirer les tuples tels que QTE_BUE>100. Expliquez le comportement d'Oracle
