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

for i in range(len(files)):
    print("\n\ncomparing "+files[i][0])
    os.system("comp_files "+files[i][1]+" "+files[i][2])

