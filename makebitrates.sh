#!/bin/zsh
for i in opus/*; 
do 
    mediainfo $i | grep bit >> bitrates.txt;
    realpath $i >> bitrates.txt;
done
