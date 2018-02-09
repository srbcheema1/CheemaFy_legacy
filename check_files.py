#! /usr/bin/env python
import os
from sys import argv
from comp_files import comp_files as comparer
from abs_path import abs_path
from srbColour import Colour


'''
script to check codes of cheema and other are identical or not
'''

# replace these with your default names
files = [
            ["bashrc", "~/.bashrc", "~/programs/cheemafy/home_files/.bashrc"],
            ["vimrc", "~/.vimrc", "~/programs/cheemafy/home_files/.vimrc"],
            ["bash_aliases", "~/.bash_aliases", "~/programs/cheemafy/home_files/.bash_aliases"],
            ["gitconfig", "~/.gitconfig", "~/programs/cheemafy/home_files/.gitconfig"]
        ]
folders = [
            ["srbScripts", "~/programs/srbScripts", "~/programs/cheemafy/srbScripts"],
            ["importlib", "~/programs/python/importlib", "~/programs/cheemafy/importlib"],
            ["vim_ftdetect", "~/.vim/ftdetect", "~/programs/cheemafy/myPlugins/vim/ftdetect"],
            ["vim_syntax", "~/.vim/syntax", "~/programs/cheemafy/myPlugins/vim/syntax"]
        ]

sp_str = '>'


#reactify the list
def reactify_list(vec):
    arr = []
    vec = sorted(vec)
    for item in vec:
        if(len(item)>3 and item[-3]=='s' and item[-2]=='w' and item[-1]=='p'): #remove swp files
            continue
        if(len(item)>3 and item[-3]=='p' and item[-2]=='y' and item[-1]=='c'):#remove pyc files
            continue
        if(len(item)>3 and item[-3]=='e' and item[-2]=='_' and item[-1]=='_'):#remove pyc files
            continue
        arr.append(item)
    return arr

#check if lists are same
def make_same(items1,items2,folder1,folder2,shift):
    i,j = 0,0
    items1 = reactify_list(items1)
    items2 = reactify_list(items2)
    notin1 = []
    notin2 = []
    inboth = []
    while(i<len(items1) and j<len(items2)):
        if(items1[i]<items2[j]):
            notin2.append(items1[i])
            i+=1
        elif(items1[i]>items2[j]):
            notin1.append(items2[j])
            j+=1
        elif(items1[i]==items2[j]):
            inboth.append(items1[i])
            i = i+1;
            j = j+1;

    while(i<len(items1)):
        notin2.append(items1[i])
        i+=1
    while(j<len(items2)):
        notin1.append(items2[j])
        j+=1

    if(len(notin1) > 0 or len(notin2)>0):
        print(sp_str*shift,"files not in pc : ",end=" ")
        for item in notin1:
            print(item,end=" ")
        print()
        print(sp_str*shift,"files not in cheemafy : ",end=" ")
        for item in notin2:
            print(item,end=" ")
        print()
        print()

    folders = []
    files = []
    for item in inboth:
        if(os.path.isdir(abs_path(folder1+"/"+item))):
            folders.append(item)
        else:
            files.append(item)

    return files,folders

#comp file
def comp_file(file_name,file1,file2,level,shift=0):
    print(sp_str*shift,"comparing "+file_name)
    f1 = abs_path(file1)
    f2 = abs_path(file2)
    ret = comparer(f1,f2,level,shift+1)
    if(ret!=-1):
        if(level==0):
            print(sp_str*shift,"files differ at ",ret)


#comp files
def comp_files(level):
    for i in range(len(files)):
        comp_file(files[i][0],files[i][1],files[i][2],level,0)

#comp folder
def comp_folder(folder_name,folder1,folder2,level,shift=0):
    print(Colour.GREEN + sp_str*shift,"comparing folder "+folder_name + Colour.END)
    items1 = os.listdir(abs_path(folder1));
    items2 = os.listdir(abs_path(folder2));
    files,folders = make_same(items1,items2,folder1,folder2,shift+2)

    for item in files:#files
        comp_file(item,folder1+"/"+item,folder2+"/"+item,level,shift+2)

    if(level==4):#yet to be implemented ... still buggy
        for item in folders:
            comp_folder(item,folder1+"/"+item,folder2+"/"+item,level,shift+1)

#comp folders
def comp_folders(level):
    for i in range(len(folders)):
        print()
        comp_folder(folders[i][0],folders[i][1],folders[i][2],level)

if(__name__=='__main__'):
    level = 1
    if(len(argv)==2):
        level = int(argv[1])
    comp_files(level)
    comp_folders(level)
