#it is confirmed you cannot create alias with arguments
alias catc='cat ~/programs/myfiles/default_codes/default.cpp >>'
alias catj='cat ~/programs/myfiles/default_codes/default.java >>'
alias catp='cat ~/programs/myfiles/default_codes/default.py >>'
alias catb='cat ~/programs/myfiles/default_codes/default.sh >>'

alias de='cd ~/Desktop'
alias mf='cd ~/programs/myfiles/'
#to create alias with arguments create a alias of function
alias cpmf='function _cpmf(){ cp $1 ~/programs/myfiles/; };_cpmf'

alias g++11='g++ -std=c++11'

#to copy file to clipboard
alias cpcb='xsel -b <'
