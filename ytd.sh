#!/bin/bash

# Συνάρτηση ελέγχου Youtube Url
function url_check {
    if [[ "$1" = 'https://www.youtube.com/watch?'*v=* ]] || [[ "$1" == 'https://youtube.com/watch?'*v=* ]] || [[ "$1" == 'https://youtu.be'*/* ]] || [[ "$1" == 'm.youtube.com'** ]] || [[ "$1" == 'https://music.youtube.com/watch?'*v=* ]] || [[ "$1" == 'https://youtube.com/playlist?'*list=* ]] || [[ "$1" == 'https://www.youtube.com/playlist?'*list=* ]]
        then
            home="/home/""$USER""/Music"
            if [[ -d "$home" ]]; then
                cd "$home" || return
            else
                mkdir -p "$home"
                cd "$home" || return
            fi
            echo "########    Ytd101    ########"
            echo "# The download just started! #"
            
    else
            echo "This is not a Youtube Url." 
            exit
    fi
}

# Συνάρτηση μετατροπής σε mp3
function mp3 {
	youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --output "%(title)s.%(ext)s" "$1"
}

# Συνάρτηση μετρατοπής μεμονομένου αρχείου λίστας σε mp3
function mp3_solo_list {
    youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --no-playlist --output "%(title)s.%(ext)s" "$1"
}

#Συνάρτηση μετρατοπής ολόκληρης λίστας σε mp3 (for music.youtube)
function mp3_whole_list {
    youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --yes-playlist --output "%(title)s.%(ext)s" "$1"
}

# Συνάρτηση μετατροπής σε mp4
function mp4 {
    youtube-dl --embed-thumbnail -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "$1"
}

# Συνάρτηση μετατροπής μεμονομένου αρχείου λίστας σε mp4
function mp4_solo_list {
    youtube-dl --embed-thumbnail --no-playlist --no-playlist -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "$1"
}

# Συνάρτηση μετρατοπής ολόκληρης λίστας σε mp4 (for music.youtube)
function mp4_whole_list {
    youtube-dl --embed-thumbnail --yes-playlist --no-playlist -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "$1"
}

#Συνάρτηση ερώτησης Y/N
function YN_Q {
	while true; do
		read -rp "$1" yes_no
		case "$yes_no" in
			y|yes|Y|Yes|YES )
				return 0;
				break;;
			n|no|N|No|NO )
				return 1;
				break;;
			* )
				echo -e "${2:-"${IYellow}μη έγκυρη απάντηση${NC}"}";;
		esac
	done
}

# Συνάρτηση ελέγχου ύπαρξης λίστας
function check_list {
    if [[ "$url" == *"watch?v="* ]] && [[ "$url" == *"list="* ]]
        then
        echo "That url contains a list"
        if YN_Q "Do you want to download the whole list? (y/n) " "Please insert y or n: " 
            then
                if [[ "$url" == *"music.youtube"* ]]
                    then
                        "${2}_whole_list" "$1"
                else
                    "${2}_solo_list" "$1"
                fi 
            else
                "${2}_solo_list" "$1"
        fi
    else
        "$2" "$1"
    fi           
}
# Βασικό scipt με flags
if [[ "$#" == "0" ]];
then
    echo "No parameter given."
    echo "Run ytd --help to see the available options."
    exit 0
else
    if [[ $1 == "--help" ]];
        then 
            echo "--------------    Ytd101    ---------------"
            echo "               Script Format               "
            echo "             ytd --options url             "
            echo "             Available Options             "
            echo "        mp3: Convert the url to mp3        "
            echo "        mp4: Convert the url to mp4        "
            echo "-------------------------------------------"
    elif [[ $1 == "--mp3" ]]; then
            if [[ "$2" == "" ]]; then
                echo "-----------------------"
                echo "   Add url!   "
                echo "    ./ytd --mp3 url    "
            else    
                url="$2"
                url_check "$url"
                check_list "$url" "mp3"
            fi
    elif [[ $1 == "--mp4" ]]; then
            if [[ "$2" == "" ]]; then
                echo "-----------------------"
                echo "   Add url!   "
                echo "    ./ytd --mp4 url    "
            else    
                url="$2"
                url_check "$url"
                check_list "$url" "mp4"
            fi 
    else
        echo "--------------- Ytd ----------------"
        echo " Give one of the available options! "
        echo "             ytd --help             "
    fi
    
    
    
fi    

exit 0
