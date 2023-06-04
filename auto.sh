#!/bin/bash

git checkout master
git pull
echo "quel est le numero du billet tufin?"
read tufin
git checkout -b SC-$tufin
mkdir SC-$tufin
touch SC-$tufin/SC-$tufin.txt
echo "vous pouvez maintenant aller directement dans le fichier cree dans la branch et le dossier qui on le nom du billet tufin"