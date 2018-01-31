import os
from srbdir import parent_dir
import sys


print("in test_script :: \n")
print("-"*3,os.path.abspath(__file__))
print("-"*3,os.getcwd())
print()


sys.path.append(parent_dir(__file__,2))
from test_hello import hello_world as hello_world

hello_world()

def test_script():
    print(__name__)
    print("function in test_script :: ",os.getcwd())

vishi_testing = "londa"
