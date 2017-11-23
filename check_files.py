#!/usr/bin/env python 
import os
from sys import argv,exit

'''
script to check codes of cheema and other are identical or not 
'''

#replace these with your default names
files = [
            ["bashrc","~/.bashrc","~/programs/myfiles/home_files/.bashrc"],
            ["vimrc","~/.vimrc","~/programs/myfiles/home_files/.vimrc"],
            ["bash_aliases","~/.bash_aliases","~/programs/myfiles/home_files/.bash_aliases"],
            ["gitconfig","~/.gitconfig","~/programs/myfiles/home_files/.gitconfig"]
        ]
folders = [
            ["srbScripts","~/programs/srbScripts","~/programs/myfiles/srbScripts"]
        ]

#comp files
for i in range(len(files)):
    print("\n\ncomparing "+files[i][0])
    os.system("comp_files "+files[i][1]+" "+files[i][2])



#comp folders
home_path = os.getenv("HOME")
def abs_path(path):
    return home_path + path[1:]

for i in range(len(folders)):
    print("\n\ncomparing folder "+folders[i][0])
    items1 = os.listdir(abs_path(folders[i][1])); 
    items2 = os.listdir(abs_path(folders[i][2]));
    if(len(items1)!=len(items2)):
        print("no of files differ")

    for j in range(len(items2)):
        print("\tcomparing "+items2[j])
        os.system("comp_files "+folders[i][1]+"/"+items1[j]+" "+folders[i][2]+"/"+items2[j]);
