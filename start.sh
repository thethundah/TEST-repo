#!/bin/bash
git add .
current=$(git branch --show-current &2>/dev/null)
mess1="Ajouter un commentaire a votre billet Tufin"
echo -e $mess1 $current "\n"
echo -e "[DESCRIPTION], [COUPE_FEUX], [BILLET_TUFIN] \n"
read -p "commentaire > " commentaire
echo "vous avez ajouter un commentaire pour" $current
git commit -m "$commentaire"
git push --set-upstream origin $current
