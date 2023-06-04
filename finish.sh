#!/bin/bash

git add .
current=git rev-parse --abbrev-ref HEAD
read commentaire
echo "ajouter un commentaire au billet" $current
echo "vous avez ajouter un commentaire pour" $current
git commit -m "$commentaire"
git push --set-upstream origin $current