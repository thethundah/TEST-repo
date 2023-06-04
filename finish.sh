#!/bin/bash
git add .
current= git branch --show-current
echo $current
echo "ajouter un commentaire au billet $current"
read commentaire
echo "vous avez ajouter un commentaire pour" $current
git commit -m "$commentaire"
git push --set-upstream origin $current