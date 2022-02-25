from pydub import AudioSegment as AS

def reformat(bitrate, file):
    AS.from_file(file).export(file.split('.opus')[0]+'.mp3', bitrate=bitrate)


b = []
f = []

with open('bitrates.txt') as file:
    for k,v in enumerate(file):
        if k % 2 == 0:
            b.append(v.split('\n')[0].split(": ")[-1].split("b/s")[0])
        else:
            f.append(v.split('\n')[0])
        
if len(b) != len(f):
    print("An error occurred. Number of files and bitrates don't match")
    exit()

for i in range(len(b)):
    print(f'Working on ... filename = {f[i]} and bitrate = {b[i]}')
    reformat(b[i], f[i])
    
