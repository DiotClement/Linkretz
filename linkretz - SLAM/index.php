<!DOCTYPE html>
<html lang="fr-FR">
<head>
	<meta charset="UTF-8">
	<meta name ="viewport" content="width=device-width, initial-scale-1.0">
	<meta name="description" content="Site de l'agence Linkretz">
	<link rel="stylesheet" href="css/style.css">
	<title>Site de l'agence Linkretz - Page d'accueil</title>
</head>
<body>	

	<?php
		include $_SERVER['DOCUMENT_ROOT'].'/include/header.html';
	?>	
	<?php include $_SERVER['DOCUMENT_ROOT'].'/include/menu_client.html'; ?>

		<section class="accueil">
			<h2>Qui sommes-nous ?</h2>
			<div class = "sec">
				<p>Une agence familiale située à Chantilly, spécialisée dans la vente de séjours conçus par des tour-opérateurs.<br>
				Nous vous proposons également les services suivants :</p>
				<ul>
					<li>la vente de billets d'avion ou de train ;</li>
					<li>la location de voitures, de villas ou d'appartements, </li>
					<li>la réservation de chambres d'hôtel ;</li>
					<li>l'organisation de voyage à la carte.</li>
				</ul>
			</div>
		</section>
		<section>
			<h2>Coordonnées</h2><br><br>
			<p class="table">
				6, rue du connétable<br>
				Batiment B<br>
				60500 Chantilly<br><br>
				<strong>+33 3 44 58 52 59</strong><br>
				agence@linkretz.com
			</p>
		</section>
		<section class="table">
		    <p class="table">
			    <h2>Horaires d'ouverture</h2><br>
			    <table>
			        <?php
				         include "include/connexion_bd.php";
                         // exécution de la requête : on récupère le résultat
                        try {
                            $lesEnregs=$bdd->query("SELECT jour, matin, apres_midi FROM horaire_ouverture");   
                        } catch (PDOException $e) {
                           die ("Err BDSelect : erreur de lecture table horaire_ouverture dans index.php<br>Message d'erreur :" . $e->getMessage());
                        }
                          // on teste si le SELECT a retourné des enregistrements
                        if($lesEnregs->rowCount () ==0) {
                          echo ("Aucun horaire_opérateur n'a été enregistré");
                        } else {
                                echo'<table>
                                    <tr>
                                        <th>Jour</th>
                                        <th>Matin</th>
                                        <th>Après-Midi</th>
                                    </tr>    
                                ';
                                foreach ($lesEnregs as $enreg) {
                                    echo "<tr><td>$enreg->jour</td><td>$enreg->matin</td><td>$enreg->apres_midi</td></tr>";               
                                }
                                echo '</table>';
                        }
                    ?>    
			        
			    </table> 
		    </p>
		</section>
	<?php
		include $_SERVER['DOCUMENT_ROOT'].'/include/footer.html';
	?>	
</body>
</html>
