
#Autoplist Sauvegarde
/Users/admin/Documents/Autopkg/Script/Sauvegarde.sh 

rm '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
touch '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'


#Entête du fichier Plist
Echo '<?xml version="1.0" encoding="UTF-8"?>' >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
Echo '<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
Echo '<plist version="1.0">' >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
Echo '<dict>' >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
Echo '	<key>recipes</key>' >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
Echo '	<array>' >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
#Pour chaque ligne du fichier 
for lines in $(cat /Users/admin/Documents/Autopkg/Récupération/Autoplist.txt); do
    Echo "		<string> $lines </string>" >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
    autopkg update-trust-info $lines
done


#finalisation du fichier plist
Echo "	</array>" >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
Echo "</dict>" >> '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'
Echo "</plist>" >>  '/Users/admin/Documents/Autopkg/Récupération/Autoplist.plist'

#
Echo "Mise à jour du repo"

