select NOM from producteurs where NP IN ((select NP from producteurs) except (select NP from recoltes));
