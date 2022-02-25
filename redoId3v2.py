import os

for i in os.scandir():
    if i.is_file():
        song = i.name.split(" - ") 
        if len(song) < 2:
            continue

        artist_command = f'id3v2 -a \"{song[0]}\" \"{i.name}\"'
        track_command = f'id3v2 -t \"{i.name.split(".mp3")[0]}\" \"{i.name}\"'
        os.system(artist_command)
        os.system(track_command)

