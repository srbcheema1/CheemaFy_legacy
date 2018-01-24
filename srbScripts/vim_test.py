#! /usr/bin/env python3
import os
from comp_files import comp_files

os.system("rm .out")
os.system("./a.out < in > .out")

res = comp_files("out",".out")
if(res==-1):
    os.system("echo output matches")
else:
    res = "differ in line "+str(res)
    os.system("echo "+res)

os.system("echo ")
os.system("echo in : ")
os.system("echo ")
os.system("cat in")
os.system("echo ")

os.system("echo out : ")
os.system("echo ")
os.system("cat out")
os.system("echo ")

os.system("echo your output : ")
os.system("echo ")
os.system("cat .out")
os.system("echo ")
