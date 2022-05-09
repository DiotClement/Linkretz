<?php

    // appel de la fonction extract qui crée automatiquement
    // les variables dont les noms sont les index de $_POST
    // et leur affecte la valeur associée.
    extract($_POST);
    
    // si le nom n'existe pas dans le tableau $_POST
    // ou s'il n'est pas renseigné : on ajoute un message d'erreur
    if (isset($txt_nom)== false || trim($txt_nom) == "")
    {
        $msg = $msg."Le nom est obligatoire<br>";            
    }

    if (isset($txt_prenom)== false || trim($txt_prenom) == "")
    {
        $msg = $msg."Le prénom est obligatoire<br>";            
    }

    if (isset($txt_tel)== false || trim($txt_tel) == "")
    {
        $msg = $msg."Le téléphone est obligatoire<br>";            
    }

    if (isset($rbt_profil)== false || trim($rbt_profil) == "")
    {
        $msg = $msg."Vous devez sélectionner un profil<br>";            
    }
?>