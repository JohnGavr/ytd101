#!/bin/bash

# Συνάρτηση ελέγχου Youtube Url
function url_check {
    if [[ $url = 'https://www.youtube.com/watch?'*v=* ]] || [[ $url == 'https://youtube.com/watch?'*v=* ]] || [[ $url == 'https://youtu.be'*/* ]] || [[ $url == 'm.youtube.com'** ]]
        then
            folder=$(head -n 1 destination)
            home=""/home/""$USER""/""$folder""
            cd "$home"
            echo "########    Ytd101    ########"
            echo "## Η λήψη πραγματοποιείται. ##"
            echo "########   Υπομονή!   ########"
            
    else
            echo "Αυτό δεν είναι Youtube Url." 
            exit
    fi
}
# Συνάρτηση μετατροπής σε mp3
function mp3 {
	youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --output "%(title)s.%(ext)s" $url
}

# Συνάρτηση μετατροπής σε mp4
function mp4 {
    youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' $url
}

# Έλεγχος αν ο χρήστης πρόσθεσε δεύτερο όρισμα
function check_flag {
    if [[ "$url" != "" ]]; then
        url_check
    else
        echo "Δεν πρόσθεσες url."
        exit 0
    fi
}

# Βασικό scipt με flags

if [[ "$#" == "0" ]];
then
    echo "Δε δόθηκε παράμετρος"
    echo "Τρέξτε το script με την παράμετρο --help"
    exit 0
else
    if [[ $1 == "--help" ]];
        then 
            echo "--------------    Ytd101    --------------"
            echo "   Το script δουλεύει με την εξής μορφή   "
            echo "           ./ytd --format url           "
            echo "              Διαθέσιμα format            "
            echo "  mp3: Μετατρέπει το url σε mp3 format  "
            echo "  mp4: Μετατρέπει το url σε mp4 format  "
            echo "------------------------------------------"
    elif [[ $1 == "--mp3" ]]; then
            url="$2"
            check_flag url
            mp3 url
    elif [[ $1 == "--mp4" ]]; then
            url="$2"
            check_flag url
            mp4 url 
    fi
    
fi    

exit 0
