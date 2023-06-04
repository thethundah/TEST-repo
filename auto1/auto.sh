#!/bin/bash

git checkout master
git pull
echo "quel est le numero du billet tufin?"
read tufin
git checkout -b SC-$tufin
mkdir SC-$tufin
touch SC-$tufin/SC-$tufin.txt
echo -e "\n | Vous pouvez maintenant aller directement    | \n | dans le fichier  cree dans la branch        | \n | et le dossier qui on le nom du billet Tufin |"