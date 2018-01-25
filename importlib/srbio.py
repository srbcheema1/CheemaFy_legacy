from sys import argv,exit

def printf(a):
    if(type(a)==list):
        for item in a:
            print(item,end=' ')
        print()
        return
    print(a)


