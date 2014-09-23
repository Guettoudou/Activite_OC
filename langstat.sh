#!/bin/bash

# $0 langstat.sh
# $1 dico.txt
# $2 nbvoyel.sh

# On teste la présence du fichier dictionnaire
if [ -e "$1" ]; then
echo -e "\nLe dictionnaire \"$1\" existe\n"
else echo -e "\nPas de dictionnaire !\n";fi

# MISSION 1
# A partir du dictionnaire, on extrait le nombre de fois que chaque lettre de l'alphabet est utilisée.
echo -e "Lettres de l'alphabet, par importance d'usage, dans \"$1\" :\n"

for i in {A..Z};do # on crée une boucle sur une variable i qui balaye l'alphabet de A à Z
n=`grep -c $i $1` # on compte le nombre de fois que chaque lettre est employée dans le fichier passé en paramètre $1, càd dico.txt
echo "$n - $i">>nbusealpha.txt # on édite le nombre et la lettre correspondante dans un fichier temporaire
done # on sort de la boucle
sort -nr nbusealpha.txt # on trie les lignes du fichier temporaire par nombres décroissants et on affiche le nombre de fois que chaque lettre est utilisée dans la console

echo -e "\nSuppression du fichier temporaire : " `rm -v nbusealpha.txt` # on supprime le fichier temporaire et on affiche cette supression dans la console avec -v

# MISSION 2
# on compte le nombre total de voyelles ($2) utilisées dans la rédaction de dico.txt
for j in {'A','E','I','O','U','Y'};do # on exporte le nombre de chaque voyelle utilisée
m=`grep -c $j $1`                     # pour le dictionnaire
echo "$j=$m">>$2                      # dans un shell temporaire nommé voyel.sh 
done
echo 'let "v=A+E+I+O+U+Y"'>>$2 # on additionne les nombres renvoyés par la boucle
echo 'echo "$v voyelles ont servi à la rédaction de \"'$1'\""'>>$2 # on affiche le total
echo `chmod +x $2` # on donne les droits d'exécution du shell temporaire
echo `./$2` # on l'exécute
rm $2 # on le supprime pour la prochaine exécution de langstat.sh
echo -e "\nFin"

