#!/bin/bash
git add .
current=$(git branch --show-current &2>/dev/null)
mess1="ajouter un commentaire au billet"
echo $mess1 $current
read commentaire
echo "vous avez ajouter un commentaire pour" $current
git commit -m "$commentaire"
git push --set-upstream origin $current