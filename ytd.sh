#!/bin/bash

# Πρόγραμμα για λήψη mp3 αρχείων του Youtube

read -rp "Youtube URL: " url
echo "############## youtubedl101 ###############"
echo "#  Το script ανεξαρτήτου τοποθεσίας       #"
echo "#    αποθηκεύει τα mp3 αρχεία             #"
echo "#           στο Path:                     #"
echo "#    /home/username/Music                 #"
echo "###########################################"

cd 
cd Music

if [[ $url = 'https://www.youtube.com/watch?'*v=* ]] || [[ $url == 'https://youtube.com/watch?'*v=* ]] || [[ $url == 'https://youtu.be'*/* ]] || [[ $url == 'm.youtube.com'** ]]
   then
	youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --output "%(title)s.%(ext)s" $url
   exit 0
else 
  echo "This is not a youtube link"
fi

exit 0
