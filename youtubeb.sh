#!/bin/bash

# Πρόγραμμα για λήψη mp3 αρχείων του Youtube

read -rp "Youtube URL:" video

if [[ -z $video ]] 
   then
   echo "Σφάλμα URL"
   exit 0
else 
  youtube-dl -x --audio-format mp3 $video 
fi

exit 0
