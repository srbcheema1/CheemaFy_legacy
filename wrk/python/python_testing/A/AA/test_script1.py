import os
import sys

'''
    level 1 gives folder of file
    level 2 gives parent directory
'''
def parent_dir(level=1):
    here = str(os.path.abspath(__file__))
    while(level>0):
        here = os.path.abspath(os.path.join(here, os.pardir))
        level -= 1
    return here

print("in test_script1 :: \n")
print("-"*3,os.path.abspath(__file__))
print("-"*3,os.getcwd())
print("in test_script1 __name__",__name__)
print()

sys.path.append(parent_dir(2))
from test_script import __file__ as me , test_script as you , __name__ as naam
print("location from ts1 of ts ",me)
print("in test_script __name__",naam)


you()
