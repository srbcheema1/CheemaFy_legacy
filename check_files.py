#/usr/bin/env python 
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

#reactify the list
def reactify_list(vec):
    arr = []
    vec = sorted(vec)
    for item in vec:
        if(len(item)>3 and item[-3]=='s' and item[-2]=='w' and item[-1]=='p'):
            continue
        arr.append(item)
    return arr

#check if lists are same
def make_same(items1,items2):
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
        notin2.append[items1[i]]
    while(j<len(items2)):
        notin1.append[items2[j]]

    if(len(notin1) > 0 or len(notin2)>0):
        print("files not in pc : ",end=" ")
        for item in notin1:
            print(item,end=" ")
        print()
        print("files not in myfiles : ",end=" ")
        for item in notin2:
            print(item,end=" ")
        print()
        print()

    return inboth


for i in range(len(folders)):
    print("\n\ncomparing folder "+folders[i][0])
    items1 = os.listdir(abs_path(folders[i][1])); 
    items2 = os.listdir(abs_path(folders[i][2]));
    items = make_same(items1,items2)

    for j in range(len(items)):
        print(" comparing "+items[j])
        os.system("comp_files "+folders[i][1]+"/"+items[j]+" "+folders[i][2]+"/"+items[j]);
