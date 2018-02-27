#!/usr/bin/env python3

from sys import argv,exit
import os

from abs_path import abs_path
from srbColour import Colour
from srbFiles import parent_dir,file_name,relative_path

help2 = '''
'''


help1 = 'require 3 or 4 arguments \n 1 for files1 \n 2 for file 2 \n 3 for level'


def describe():
    print(help1)
    print(help2)

'''
code begins here
'''
if(__name__ == '__main__'):
    if(len(argv)==2 and argv[1]=='--help'):
        describe();
        exit();

