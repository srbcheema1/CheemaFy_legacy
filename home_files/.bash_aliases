#it is confirmed you cannot create alias with arguments

#move to particulat locations
alias de='cd ~/Desktop'
alias mf='cd ~/programs/myfiles/'

#to create alias with arguments create a alias of function
alias cpmf='function _cpmf(){ cp $1 ~/programs/myfiles/; };_cpmf'
alias mvfd='function _mvfd(){ mv ~/Desktop/$1 ./; };_mvfd'
alias cpfd='function _cpfd(){ cp ~/Desktop/$1 ./; };_cpfd'
alias cptd='function _cptd(){ cp ./$1 ~/Desktop/; };_cptd'

#commands for compiler versions 
alias g++11='g++ -std=c++11'

#to copy file to clipboard
#you must have install xsel using sudo apt-get install xsel
alias cpcb='xsel -b <'

#to run octave interactively
alias octavei='octave --no-gui'

#whatsapp web
alias whatsapp='firefox https://web.whatsapp.com/🌐/en'

#to set virtual env
alias venv='
#venv should be installed using sudo apt-get install python3-venv
function _venv(){
    if [ -d "venv" ]
    then
        source ./venv/bin/activate;
    else
        pyvenv venv;
        source ./venv/bin/activate;
    fi
};_venv'

#to set default screenshot saving location
alias sshot_loc='
function _sshot_loc(){
    if [ "$#" -eq 0 ]
    then
        sshot_a=`pwd`; 
    elif [ "$#" -eq 1 ]
    then
        sshot_a=$(cd $1;pwd);
    fi
    gsettings set org.gnome.gnome-screenshot auto-save-directory $sshot_a; 
    echo "default screen shot dir set to "$sshot_a;
};_sshot_loc'

#my bad habbit to type vim again and again
alias vim='
function _vim(){
    if [ -d "$1" ]
    then
        cd "$1";
    else
        vim $1;
    fi
};_vim'

#my bad habbit to type rm 
alias rm='
function _rm(){
    echo "do you want to delete : ";
    read ans;
    if [ $ans = "y" ]
    then
        echo "rm $1 $2 $3 $4 $5"
        rm $1 $2 $3 $4 $5;
    fi
};_rm'

#default programs
alias catc='cat ~/programs/myfiles/default_codes/default.cpp >>'
alias catj='cat ~/programs/myfiles/default_codes/default.java >>'
alias catp='cat ~/programs/myfiles/default_codes/default.py >>'
alias catb='cat ~/programs/myfiles/default_codes/default.sh >>'
alias catr='cat ~/programs/myfiles/default_codes/default.c >>'
alias cats='cat ~/programs/myfiles/default_codes/default.simple >>'
