#!/bin/bash
#Song format = ARTIST - TITLE

#First step: Copy all of newly downloaded music to current directory

#Second: Clear all of the ID3 Tags
id3v2 -D *.mp3

#Third step: Uses the below command to grab the artist name and create folders
ls *-* | awk -F ' - ' '{ print $1 }' | xargs -I {} -L 1 mkdir "{}"

#Fourth: Run python script to add corrected id3v2 tags
python redoId3v2.py

#Fifth: Move all songs to correct folder
python moveSongs.py

