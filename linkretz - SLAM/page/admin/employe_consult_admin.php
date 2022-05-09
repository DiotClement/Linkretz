<!DOCTYPE html>
<html lang="fr-FR">
<head>
	<meta charset="UTF-8">
	<meta name ="viewport" content="width=device-width, initial-scale-1.0">
	<meta name="description" content="Site de l'agence Linkretz">
	<link rel="stylesheet" href="../../css/style.css">
	<title>Site de l'agence Linkretz - Gestion des employés</title>
</head>
<body>	

	<?php
		include $_SERVER['DOCUMENT_ROOT'].'/include/header.html';
	?>	
    <?php 
        include $_SERVER['DOCUMENT_ROOT'].'/include/menu_admin.html'; 
    ?>

		<section class="gestion employes">
			<h2>Gestion des employés</br></br> 
				<a href='employe_ajout_insert.php'>
					<input type='button' name='AjoutEmp' value='Ajouter un employé'/>
				</a>
			</h2>	
		</section>
		<section>
			<div class="sec">
            	<?php
					include "../../include/connexion_bd.php";
					// exécution de la requête : on récupère le résultat
					try {
						$lesEnregs=$bdd->query("SELECT id, nom, prenom, libelle FROM employe JOIN fonction ON idfonction = fonction.id;");
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
									<th>Modifier</th>
									<th>Supprimer</th>
                        		</tr>    
                        	';
                        	foreach ($lesEnregs as $enreg) {
                            	echo "<tr><td>$enreg->nom</td><td>$enreg->prenom</td><td>$enreg->libelle</td><td><a href='employe_modifier.php?id=$enreg->id'>
								<input type='button' name='ModifEmp' value='Modifier'/></a></td><td><a href='employe_supprimer.php'>
								<input type='button' name='SupprEmp' value='Supprimer'/></a></td></tr>";               
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