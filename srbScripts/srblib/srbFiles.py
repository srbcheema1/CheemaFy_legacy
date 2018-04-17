from abs_path import abs_path
import os

def file_name(file_path):
    file_path = abs_path(file_path)
    items = file_path.split('/')[-1]
    return items

def file_extension(file_path):
    file_name_ = file_name(file_path)
    if('.' in file_name):
        return file_name.split('.')[-1]
    else:
        return ''

def parent_dir(file_path,level=1):
    here = str(abs_path(file_path))
    while(level>0):
        here = abs_path(os.path.join(here, os.pardir))
        level -= 1
        if(here==''):
            return '/'

    return abs_path(here)

def relative_path(file_path):
    file_path = abs_path(file_path)
    pwd = str(os.getcwd())
    file_path = file_path[len(pwd):len(file_path)]
    return '.'+file_path

