#!/usr/bin/env python3

from sys import argv,exit
import os
import json

from abs_path import abs_path
from srbColour import Colour
from srbFiles import parent_dir,file_name,relative_path


help2 = '''
'''

def create_file(fille):
    template =                                      \
    {                                               \
        "paths":{                                   \
            "srbScripts":{                          \
                "path":"~/programs/srbScripts"      \
            }                                       \
        }                                           \
    }
    jfile = open(fille, 'w')
    json.dump(template,jfile,indent = 4,ensure_ascii = False)
    jfile.close()


def extract_data():
    fille = abs_path('~/.CheemaFy/bookmarks.json')
    try:
        jfile = open(fille)
    except FileNotFoundError:
        create_file(fille)
    jfile = open(fille)
    data = json.load(jfile)
    if(not 'paths' in data.keys()):
        create_file(fille)
        jfile = open(fille)
        data = json.load(jfile)
    return data


def print_indexed(mapp):
    dictt = [""]
    i = 1
    for key,value in mapp.items():
        print(Colour.CYAN,i,":",Colour.GREEN,key,Colour.END,":",value['path'])
        dictt.append(value['path'])
        i+=1
    return dictt

def bookmark_read():
    data = extract_data()
    paths = data['paths']

    # print(json.dumps(paths,indent=4))
    mapp = print_indexed(paths)
    print("enter number of path : ",end='')
    index = int(input())

    if(index <= 0 or index >= len(mapp)):
        print("invalid index")
        return
    command = abs_path(mapp[index])
    print()
    print(command)
    return command
    # we cant change directory of shell from within a program
    # https://stackoverflow.com/a/35832594/6799074


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
    bookmark_read()

