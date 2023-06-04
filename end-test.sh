#!/bin/bash

display_message() {
    local message="$1"
    local line_length=${#message}
    local max_line_length=38  # Maximum number of characters per line

    # Split the message into multiple lines
    local formatted_message=""
    while [[ $line_length -gt $max_line_length ]]; do
        formatted_message+="| ${message:0:$max_line_length} |\n"
        message="${message:$max_line_length}"
        line_length=${#message}
    done
    formatted_message+="| $message$(printf ' %.0s' $(seq 1 $((max_line_length - line_length)))) |\n"

    local horizontal_line=$(printf '%*s' "$max_line_length" | tr ' ' '-')
    
    echo "+$horizontal_line+"
    printf "$formatted_message"
    echo "+$horizontal_line+"
}


git add .
current=$(git branch --show-current &2>/dev/null)
mess1=$(echo "Ajouter un commentaire a votre billet Tufin")
mess2=$(echo $mess1 $current)
display_message "$mess2"
echo -e "\n Exemple : [DESCRIPTION], [COUPE_FEUX], [BILLET_TUFIN] \n"
read -p "commentaire > " commentaire

while [[ -z $commentaire ]]; do
	message3=$(echo "Le commentaire ne peut rester vide!")
	display_message "$message3"
	read -p "commentaire > " commentaire
	if [[ -z $commentaire ]]; then
		message4=$(echo -e "Le commentaire ne peut rester vide.")
		display_message "$message4"
		echo "---------------Exemple--------------------"
		message5=$(echo "ajout regle, AZC-HUB-PROD, SC-17509")
		display_message "$message5"
		read -p "commentaire > " commentaire
	fi
done


message6=$(echo "vous avez ajouter un commentaire pour" $current)
displau_message "$message6"
git commit -m "$commentaire"
git push --set-upstream origin $current
