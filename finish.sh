#!/bin/bash

git add .
current= git branch --show-current
read commentaire
echo "ajouter un commentaire au billet" $current
echo "vous avez ajouter un commentaire pour" $current
git commit -m "$commentaire"
git push --set-upstream origin $current