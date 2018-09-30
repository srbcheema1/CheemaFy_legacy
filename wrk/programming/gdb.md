# first command:- gdb a.out
# second command:- b main
# third command:- r

l 1,99 to print whole
l n to print lines arount n

### print l again and again to print more and more
### or even simple enter key does repeat the upper command

======================================================
# p <var_name>
# p *<array_name>@<len_upto_print>


=======================================================
# break points
b <line number>

======================================================
# travarsal
s for one step
c for contining till next breakpoint

======================================================
# info
i b
i locals - print local variables
i args   - print args of a function
show all breakpoints

you can delete n-th breakpoint using
del n
=====================================================
# Setting Variables And Calling Functions
print x     - Print current value of variable x.
set x = 3
set x = y
call myfunction()
call myotherfunction(x)
call strlen(mystring)
    - Call user-defined or system functions. This is extremely useful, but beware calling buggy functions.
display x
undisplay x
    - Constantly display value of variable x, which is shown after every step or pause.
    - Useful if you are constantly checking for a certain value. Use undisplay to remove the constant display.

======================================================
# misc
create a file ~/.gdbinit
in it write:
```
set auto-load safe-path /
set print pretty on
set listsize 20
set print pretty on
set print array-indexes on

```
you can make your own .gdbinit in working dir
in it write
```
file a.out
b main
r
```


=======================================================
# terms
step        - line by line
            - go into fxns
next        - don't go into functions
            - similar to step
until       - loop only once
            - similar to next
until <loc> - continue till that location
finish      - finish the current fxn also step out of it
            - good when you by mistake stepped in to a fxn
            - it will stop at break points

return <v>  - return a function forcefully with given val


breakpoints - location to halt the program
watchpoints - set condition where to break. condition may be value of some vaiable
            - monitor variable for changes
            - require variable to be in scope
clear       - remove all breakpoints

checkpoint  - stores state of program
            - can be started anythime from here


continue    - continue till next breakpoint

backtrace   - back trace
    up
    down
    frame <number>


# sexy
there is a gdbtui that helps us to visualize what is happeing in the code with gui in terminal.
you can switch between gdb and gdbtui using `Ctrl + x Ctrl +a` strokes combination.
