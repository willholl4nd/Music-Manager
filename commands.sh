#!/bin/bash
#Song format = ARTIST - TITLE

#First step: Move three scripts to mp3 folder via Makefile

#Second: Clear all of the ID3 Tags
id3v2 -D *.mp3

#Third step: Uses the below command to grab the artist name and create folders
#ls *-* | awk -F ' - ' '{ print $1 }' | xargs -I {} -L 1 mkdir "{}"
ls *-* | awk -F ' - ' '{print $1}' | xargs -I '{}' mkdir '{}'

#Fourth: Run python script to add corrected id3v2 tags
python3 redoId3v2.py

#Fifth: Move all songs to correct folder
python3 moveSongs.py

#Sixth: Move three scripts back to main folder via Makefile
