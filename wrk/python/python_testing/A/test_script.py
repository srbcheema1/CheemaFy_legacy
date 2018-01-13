import os
import sys


def parent_dir(level=1):
    here = str(os.path.abspath(__file__))
    while(level>0):
        here = os.path.abspath(os.path.join(here, os.pardir))
        level -= 1
    return here


print("in test_script :: \n")
print("-"*3,os.path.abspath(__file__))
print("-"*3,os.getcwd())
print()


sys.path.append(parent_dir(2))
from test_hello import hello_world as hello_world

hello_world()

def test_script():
    print(__name__)
    print("function in test_script :: ",os.getcwd())

vishi_testing = "londa"
