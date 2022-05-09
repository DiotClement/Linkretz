<label for="nom">Nom  </label>
            	<input type="text" placeholder="Saisissez votre nom" name="txt_nom" id="nom" value="<?php echo $txt_nom;?>" required>

				<label for="prenom">Prénom  </label>
            	<input type="text" placeholder="Saisissez votre prénom" name="txt_prenom" id="prenom" value="<?php echo $txt_prenom;?>" required>

            	<label for="tel">Téléphone  </label>
            	<input type="tel" placeholder="Saississez votre téléphone" name="txt_tel" id="teleph" pattern=^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$ value="<?php echo $txt_tel;?>" required/>
            	<br><br>

            	<label for="fonction">Fonction de l'employé </label><br> 
				<?php 
					include '../../include/connexion_bd.php';

					// éxecution de la requête (avec la méthode query) dans un bloc try pour obtenir le contenu
        			// de la table fonction. On récupère le resultat de la requête dans le tableau $lesEnregs
    				try { 
                        $lesEnregs=$bdd->query("SELECT id, libelle FROM fonction");
                    }catch (PDOException $e) {
                        die ("Err BDSelect : erreur de lecture table employe_ajout.php<br/>Message d'erreur :" . $e->getMessage());
                    }
        			//on teste si le SELECT a retourné des enregistrements
					if($lesEnregs->rowCount () > 0) {
                        
				
				?>
							<select name = "lst_fonction">
				<?php
							//pour chaque enregistrement retourné par la requête SQL, on creé une option dans la liste
							//l'attribut value contiendra l'id (l'identifiant de la fonction)
							//et le libellé de la fonction sera affiché
                        	foreach ($lesEnregs as $enreg) {
                                if ($lst_fonction == $enreg->id){
                                    echo "<option selected value='$enreg->id'>$enreg->libelle</option>";
                                } else {
                                    echo "<option value='$enreg->id'>$enreg->libelle</option>"; 
                                }
                       		}
				?>
							</select><br><br>
				<?php
					}
				?>

            	<label>Profil de l'employé</label>
                <?php
                if ($rbt_profil == 'E') {
                    echo "<input type='radio' checked name='rbt_profil' id='employe' value='employe'>Employé";
                } else {
                    echo "<input type='radio' name='rbt_profil' id='employe' value='employe'>Employé";
                }
                if ($rbt_profil == 'A'){
                    echo "<input type='radio' checked name='rbt_profil' id='admin' value='administrateur'>Administrateur"; 
                } else {
                    echo "<input type='radio' name='rbt_profil' id='admin' value='administrateur'>Administrateur";
                }
            	?>
            	<input type ="submit" name="btn_valider" id="valider" value= "Enregistrer" />
                <?php
                echo $msg;
                ?>