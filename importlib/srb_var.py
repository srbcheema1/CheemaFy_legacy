import os

srb_home = os.getenv("HOME")
srb_pass = open(srb_home+"/.pass").readlines()[0][:-1]
