#!/usr/bin/env zsh
# NASA Astronomy Picture of the Day Wallpaper dump
# Options:
# - (true|false) override todays file

set -x

force_override=${1:-false}

today=`date +"%d-%m-%Y"`

dir_pix=~/Bilder/Wallpaper
file_link=nasa-actual.jpg
file_actual=`readlink ${file_link}`
file_today=nasa-${today}.jpg

mkdir -p ${dir_pix}
cd ~/Bilder/Wallpaper

if [[ -f ${file_today} && ${force_override} == "false" ]]
then
    echo "Shuffle pic list and choose randomly ..."
    file_actual=`shuf -n1 -e $(ls --ignore=${file_link} --ignore=astropix.html .)`
else
    wget -N http://apod.nasa.gov/apod/astropix.html
    wget -O ${file_today} http://apod.nasa.gov/apod/$(grep -o "image.*\.jpg" astropix.html | head -n1);
    file_actual=${file_today}
fi

ln -sfn ${file_actual} ${file_link}
feh --bg-fill ${dir_pix}/${file_link}
