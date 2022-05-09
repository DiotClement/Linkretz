<!DOCTYPE html>
<html lang="fr-FR">
<head>
	<meta charset="UTF-8">
	<meta name ="viewport" content="width=device-width, initial-scale-1.0">
	<meta name="description" content="Site de l'agence Linkretz">
	<link rel="stylesheet" href="../../css/style.css">
	<title>Site de l'agence Linkretz - Listes des employés</title>
</head>
<body>	

	<?php
		include $_SERVER['DOCUMENT_ROOT'].'/include/header.html';
	?>	
    <?php 
        include $_SERVER['DOCUMENT_ROOT'].'/include/menu_employe.html'; 
    ?>

		<section class="liste employes">
			<h2>Liste des employés</h2>
		</section>
		<div class="sec">
            <?php
				include "../../include/connexion_bd.php";
				// exécution de la requête : on récupère le résultat
				try {
					$lesEnregs=$bdd->query("SELECT nom, prenom, telephone, libelle FROM employe JOIN fonction ON idfonction = fonction.id;");
				}catch (PDOException $e) {
					die ("Err BDSelect : erreur de lecture table employe_consult_client dans employe_consult_client.php<br>Message d'erreur :" . $e->getMessage());
				}
				// on teste si le SELECT a retourné des enregistrements
				if($lesEnregs->rowCount () ==0) {
					echo ("Aucun tour-opérateur n'a été enregistré");
				} else {
					// on lit le tableau retourné et pour chaque enregistrement, on affiche le nom et la description
                     echo'<table>
                        <tr>
                            <th>Nom</th>
							<th>Prénom</th>
							<th>Fonction</th>
                            <th>Téléphone</th>
                        </tr>    
                        ';
                        foreach ($lesEnregs as $enreg) {
                            echo "<tr><td>$enreg->nom</td><td>$enreg->prenom</td><td>$enreg->libelle<td>$enreg->telephone</td></tr>";               
                        }
                    echo '</table>';
				}
				
			?>		
		</div>
	</section>
	<?php
		include $_SERVER['DOCUMENT_ROOT'].'/include/footer_admin.html';
	?>	
</body>
</html>     