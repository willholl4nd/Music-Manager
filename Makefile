SHELL := bash

download:
	yt-dlp -i $(link) -N 16 -x
	mv *.opus opus
	ls opus > titles.txt
	./makepaths.sh

rename:
	python3 rename.py

bitrates:
	./makebitrates.sh
	python3 ffmpeg.py
	mv opus/*.mp3 mp3

tags:
	./commands.sh


clean:
	rm titles.txt paths.txt bitrates.txt& 
	rm -rf opus mp3
	mkdir opus mp3
