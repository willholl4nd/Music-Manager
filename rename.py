import os

def rename(path, name):
    return os.rename(path, 'opus/' + name)


files = []
names = []
with open('paths.txt') as it:
    for i in it:
        files.append(i.split('\n')[0])
with open('titles.txt') as f:
    for i in f:
        names.append(i.split('\n')[0])

for k,v in enumerate(files):
    print(f'File = {v}, new name = {names[k]}')
    try:
        rename(v, names[k])
    except:
        pass

