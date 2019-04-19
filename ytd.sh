#!/bin/bash

# Πρόγραμμα για λήψη mp3 αρχείων του Youtube

read -rp "Youtube URL:" url

echo  "############## youtubedl101 ###############
#  Το script ανεξαρτήτου τοποθεσίας       #
#    μεταφέρει το Path στο:               #
#    /home/your_name/Music                #
###########################################"

cd 
cd Music

if [[ $url = 'https://www.youtube.com/watch?'*v=* ]] || [[ $url == 'https://youtube.com/watch?'*v=* ]] || [[ $url == 'https://youtu.be'*/* ]] || [[ $url == 'm.youtube.com'** ]]
   then
   youtube-dl --extract-audio --audio-format mp3 --embed-thumbnail --output "%(title)s.%(ext)s" $url 
   exit 0
else 
  echo "This is not a youtube link"
fi

exit 0
