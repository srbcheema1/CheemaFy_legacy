hell = 1
debug = True

def read_only():
    # here we are not writing it so no need of global keyword
    read_debug = debug # works fine
    if(debug): print("debug") # works fine

def strange():
    bad_debug = debug # error
    debug = True # maybe it thinks it is local
    # it is to be declared global if we try to write it. else it is regarded as local
    if(debug): print("debug")

def global_change():
    global num
    num = 3
def local_change():
    num = 5

global_change() # works as expected
print(num)
local_change() # works as expected
print(num)

read_only()
strange() # explain why it dows so
