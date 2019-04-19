#!/bin/bash

# Πρόγραμμα για λήψη mp3 αρχείων του Youtube

read -rp "Youtube URL:" video

if [[ $video = 'https://www.youtube.com/watch?'*v=* ]] 
   then
   youtube-dl --extract-audio --audio-format mp3 --embed-thumbnail --output "%(title)s.%(ext)s" $video 
   exit 0
else 
  echo "This is not a youtube link"
fi



exit 0
