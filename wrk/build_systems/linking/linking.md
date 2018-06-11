# static library
ar rcs libclass.a class1.o class2.o class3.o
we can force compiler to use static linking by using flag "-static"



to link some files dynamically and others non-dynamically we can use
https://stackoverflow.com/a/938947/9212547

we can use command ldd to check dynamically linked libraries and also we can check if it is static

# dynamic
g++ -fpic -shared -o lib<>.so <>.cpp

now we will have to specify its path so that linker may know
there are two ways
    1. export LD_LIBRARY_PATH=./
    2. while compile time embedd the path in binary
        g++ -o hello hello.cpp -lname -rpath=./
        g++ -o hello hello.cpp -lname -Wl,-rpath=./


NOTE: libraries are to be named after file.cpp
this is wrong
    g++ -o hello -lname hello.cpp
this is correct
    g++ -o hello.cpp -lname


NOTE: using -l:libname.a
https://stackoverflow.com/a/20728782/9525551

NOTE: phases of compiler and commands
http://faculty.cs.niu.edu/~mcmahon/CS241/Notes/compile.html

STATIC LIBRARY MAKING

