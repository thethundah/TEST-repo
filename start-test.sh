#!/bin/bash

display_message() {
    local message="$1"
    local line_length=${#message}
    local max_line_length=40  # Maximum number of characters per line

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


git checkout master
git pull
message1=$(echo -e "Quel est le numero du billet Tufin?")
display_message "$message1"
read -p "SC-" tufin

while [[ -z $tufin ]]; do
	message3=$(echo "Doit contenir une serie de 5 chiffres!")
	display_message "$message3"
	read -p "SC-" tufin
	if [[ -z $tufin ]]; then
		message4=$(echo "Doit contenir une serie de 5 chiffres!  Exemple : SC-17509")
		display_message "$message4"
		read -p "SC-" tufin
	fi
done


git checkout -b SC-$tufin
mkdir SC-$tufin
touch SC-$tufin/SC-$tufin.txt

message=$(echo -e "Vous pouvez maintenant aller directement dans le fichier cree dans la branch et le dossier qui on le nom du billet Tufin")
display_message "$message"