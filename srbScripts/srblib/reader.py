from sys import argv , exit

args = argv[1:]

def readerd():
    args = argv[1:]
    dist = {}
    simple = []
    i = 0
    while i < len(args):
        if(args[i][0]=='-'):
            dist[args[i][1:]] = args[i+1]
            i+=1
        else:
            simple.append(args[i])
        i+=1
    return dist,simple

def reader():
    dist,simple = readerd()
    if(len(dist)==0):
        return simple
    else:
        return dist,simple

argd,argl = readerd()
'''
import argd and argl into your file
using
    from reader import argd , argl
'''
