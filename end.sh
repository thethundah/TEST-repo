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


git add .
current=$(git branch --show-current &2>/dev/null)
mess1=$(echo -e "Ajouter un commentaire a votre billet Tufin")
display_message"$mess1"
mess2=$(echo -e $mess1 $current "\n")
display_message"$mess2"
echo -e "[DESCRIPTION], [COUPE_FEUX], [BILLET_TUFIN] \n"
read -p "commentaire > " commentaire
echo "vous avez ajouter un commentaire pour" $current
git commit -m "$commentaire"
git push --set-upstream origin $current
