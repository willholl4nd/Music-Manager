import os

for i in os.scandir():
    if i.is_file():
        song = i.name.split(" - ")
        if len(song) < 2:
            continue

        os.rename(i.name, f'{song[0]}/{i.name}')


