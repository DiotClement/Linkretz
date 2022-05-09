<?php
$msg = "";
$txt_nom= "";
$txt_prenom="";
$lst_fonction="1";
$txt_tel="";
$rbt_profil="";

// si le tableau $_POST est vide alors on affiche une erreur
if (count($_POST)!=0){
    
    include "../../include/employe_controle_saisie.php";

    // s'il n'y a pas d'erreur de saisie on va ajouter l'enregistrement
    if ($msg == "")
    {
        // on passe le nom et le prénom en minuscules
        $nom_min = strtolower ($txt_nom);
        $prenom_min = strtolower ($txt_prenom);

        // on génère le compte composé du nom suivi du premier caractère  du prénom
        $compte = $nom_min.substr ($prenom_min, 0, 1);

        // on récupère l'année en cours
        $annee = date("Y");

        // on génère le mot de passe composé des 2 premiers caractères du nom
        // suivis de l'année en cours suivie 2 premiers caractères du prénom
        $mot_de_passe_en_clair = substr($nom_min, 0, 2).$annee.substr($prenom_min, 0, 2);

        // on appelle la fonction sha1 pour crypter le mot de passe avec le grain de sel
        $mot_de_passe_crypte = sha1 ($compte.$mot_de_passe_en_clair);

        include "../../include/connexion_bd.php";
        var_dump($_POST);
        try {
            // on prépare la requête INSERT dans la table client
            $req = $bdd->prepare("insert into employe  values(0, :par_nom, :par_prenom, :par_fonction, :par_telephone, :par_profil, :par_identifiant, :par_mot_de_passe )");
            // on affecte une valeur à chacun des paramètres déclarés dans la requête INSERT
            $req->bindValue(':par_nom', $_POST['txt_nom'], PDO::PARAM_STR);
            $req->bindValue(':par_prenom', $_POST['txt_prenom'], PDO::PARAM_STR);
            $req->bindValue(':par_fonction', $_POST['lst_fonction'], PDO::PARAM_STR);
            $req->bindValue(':par_telephone', $_POST['txt_tel'], PDO::PARAM_STR);
            $req->bindValue(':par_profil', $_POST['rbt_profil'], PDO::PARAM_STR);
            $req->bindValue(':par_identifiant', $compte, PDO::PARAM_STR);
            $req->bindValue(':par_mot_de_passe', $mot_de_passe_crypte, PDO::PARAM_STR);
    
            // on demande l'exécution de la requête INSERT
            $req->execute();
            $id_employe = $bdd->lastInsertId();
 
            // on vérifie que l’on a bien ajouté un client
            if ($req->rowCount() == 0) {
                echo("Erreur grave : Les caractéristiques de l'employé n'ont pas bien été enregistrées.") ;
            } else {
                echo("Les caractéristiques de l'employé ont bien été enregistrées.") ;
            }												
        } catch(PDOException $err){
            die("BDIns01: erreur lors de l’insert dans la table employe – script employe_ajout_insert.php<br>Erreur :" . $err->getMessage());
        }
    }

}
?>
<!DOCTYPE html>
<html lang="fr-FR">
<head>
	<meta charset="UTF-8">
	<meta name ="viewport" content="width=device-width, initial-scale-1.0">
	<meta name="description" content="Site de l'agence Linkretz">
	<link rel="stylesheet" href="../../css/style.css">
	<link rel="stylesheet" href="../../css/style_formulaire.css">
	<title>Site de l'agence Linkretz - ajout d'un employés</title>
</head>
<body>
<?php include $_SERVER['DOCUMENT_ROOT'].'/include/header.html';?>
    
<?php include $_SERVER ['DOCUMENT_ROOT'].'/include/menu_admin.html';?>
	<section class="empl">
        <section class="com">
			<h2>Ajout d'un employé</h2>
			<div class="sec">
        	<form method="POST">
                <?php include '../../include/employe_composant_graph.php'; ?>
        	</form>  	
		</section>

    <?php
		include $_SERVER['DOCUMENT_ROOT'].'../include/footer.html';
    ?>
</body>
</html>