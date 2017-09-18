#it is confirmed you cannot create alias with arguments

#move to particulat locations
alias de='cd ~/Desktop'
alias mf='cd ~/programs/myfiles/'

#to create alias with arguments create a alias of function
alias cpmf='function _cpmf(){ cp $1 ~/programs/myfiles/; };_cpmf'
alias mvfd='function _mvfd(){ mv ~/Desktop/$1 ./; };_mvfd'

#commands for compiler versions 
alias g++11='g++ -std=c++11'

#to copy file to clipboard
#you must have install xsel using sudo apt-get install xsel
alias cpcb='xsel -b <'

#to run octave interactively
alias octavei='octave --no-gui'

#to set proxy
alias proxyfire='
function _proxyfire(){
    if [ "$#" -eq 0 ]
    then
        proxx='';
    elif [ "$#" -eq 1 ]
    then
        proxx='172.16.20.2:3128';
    fi
    export http_proxy=$proxx;
    export https_proxy=$proxx;
    export ftp_proxy=$proxx;
    echo "proxy set to $http_proxy";
};_proxyfire'

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
alias sshot_loc='gsettings set org.gnome.gnome-screenshot auto-save-directory'
alias sshot_loc_pwd='
function _sshot_loc_pwd(){
    if [ "$#" -eq 0 ]
    then
        sshot_a=`pwd`; 
    elif [ "$#" -eq 1 ]
    then
        sshot_a=$(cd $1;pwd);
    fi
    gsettings set org.gnome.gnome-screenshot auto-save-directory $sshot_a; 
    echo "default screen shot dir set to "$sshot_a;
};_sshot_loc_pwd'

#default programs
alias catc='cat ~/programs/myfiles/default_codes/default.cpp >>'
alias catj='cat ~/programs/myfiles/default_codes/default.java >>'
alias catp='cat ~/programs/myfiles/default_codes/default.py >>'
alias catb='cat ~/programs/myfiles/default_codes/default.sh >>'
