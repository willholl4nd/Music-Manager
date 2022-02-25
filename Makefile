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
	mv commands.sh mp3&
	mv redoId3v2.py mp3&
	mv moveSongs.py mp3&
	cd mp3 && ./commands.sh
	mv mp3/commands.sh .&
	mv mp3/redoId3v2.py .&
	mv mp3/moveSongs.py .&


clean:
	rm titles.txt paths.txt bitrates.txt& 
	rm -rf opus mp3
	mkdir opus mp3
	touch opus/.gitkeep
	touch mp3/.gitkeep
