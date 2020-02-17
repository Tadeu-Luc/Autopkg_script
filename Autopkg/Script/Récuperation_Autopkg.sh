
#récuperation de es
var1=$(autopkg list-recipes)

echo "Création du fichier recipe.txt en cours "
#Création d'un fichier texte 
rm '/Users/admin/Documents/Autopkg/Récupération/list-recipes.txt'
touch '/Users/admin/Documents/Autopkg/Récupération/list-recipes.txt'
rm '/Users/admin/Documents/Autopkg/Récupération/Autoplist.txt'
touch '/Users/admin/Documents/Autopkg/Récupération/Autoplist.txt'

#Mise en cache de la date pour savoir quand a été mis à jour le fichier
Echo "Nouveau_Recipe du `date` " >> '/Users/admin/Documents/Autopkg/Récupération/list-recipes.txt'
Echo " " >> '/Users/admin/Documents/Autopkg/Récupération/list-recipes.txt'
Echo " " >> '/Users/admin/Documents/Autopkg/Récupération/list-recipes.txt'
Echo "Liste des PKGS" >>'/Users/admin/Documents/Autopkg/Récupération/list-recipes.txt'
Echo " " >> '/Users/admin/Documents/Autopkg/Récupération/list-recipes.txt'

#Ecriture dans le fichier texte créer
echo "$var1" >> '/Users/admin/Documents/Autopkg/Récupération/list-recipes.txt'


#Ecriture dasn le fichier texte créer pour le transmettre au script  
echo "$var1" >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.txt'

sleep 3

Echo "Le fichier est crée et disponible vers /Users/admin/Documents/Autopkg/Récupération/list-recipes.txt"
Echo " "
Sleep 5
#Mise à jour Munki
Echo "-------------------------------------------------------------"
Echo " "
Echo "Mise à jour des logiciels du recipe de Munki en cours"
Echo "Veuillez patientez !"
/Users/admin/Documents/Autopkg/Script/Creation_Plist.sh

#Mise à jour des paquets dans munki (répertoire repo /Users/admin/Documents/OREO/pkgs)
#EN CAS DE CHANGEMENT defaults write com.github.autopkg MUNKI_REPO /chemin/vers/munki_repo
Sleep 10

#Autopkg lance le recipe qui a été créer avec le script Création_Plist.sh
autopkg run --recipe-list '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'