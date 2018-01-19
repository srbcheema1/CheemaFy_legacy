#it is confirmed you cannot create alias with arguments
#you can print all aliases with command alias and tab


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
alias whatsapp='firefox https://web.whatsapp.com/🌐/en & '


#image
alias image='shotwell'

#md reader
alias grip='python3 -m grip -b'
alias mdreader='
function _mdreader(){
    pandoc $1 | lynx -stdin
};_mdreader'

#to set virtual env
help_venv="
if you specify argument 3 it will create venv3 for python3
else it will create venv2 for python2
"
alias venv='
#venv should be installed using sudo apt-get install python3-venv
function _venv(){
    if [ "$1" = "--help" ]
    then
        echo "$help_venv"
        return
    fi
    if [ "$1" = "3" ]
    then
        if [ -d "venv3" ]
        then
            source ./venv3/bin/activate;
        else
            python3 -m virtualenv venv3
            source ./venv3/bin/activate;
        fi
    else
        if [ -d "venv2" ]
        then
            source ./venv2/bin/activate;
        else
            virtualenv venv2
            source ./venv2/bin/activate;
        fi
    fi
};_venv'


#to set default screenshot saving location
help_sshot_loc="
sshot_loc           --- set pwd as your screenshot storing directory
sshot_loc <loc>     --- set given location as location for storing screenshot
"
alias sshot_loc='
function _sshot_loc(){
    if [ "$1" = "--help" ]
    then
        echo "$help_sshot_loc"
        return
    fi

    if [ "$#" -eq 0 ]
    then
        sshot_a=`pwd`; 
    elif [ "$#" -eq 1 ]
    then
        sshot_a=$(cd $1;pwd); #sexy
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
help_rm="
rm file1 file2                      --- will move them to trash 
rm -p file1 file2                   --- will delete them permanemtly and will ask for perission
rm -f file1 file2                   --- will delete all files without asking permission
                                            --- only for development purpose
                                            --- not for daily use

-------------------------------------------------------------------------------------------------

rm -r folder1 folder2                       --- move folder to trash
                                            --- even it works if you dont mention -r
rm -p -r folder1 folder2                    --- remove folder permanently and will ask you permission
rm -f -r folder1 folder2                    --- removes folder permenently .. wont ask for permission
                                            --- only for development purpose
                                            --- not for daily use

---------------------------------------------------------------------------------------------------

rm <file/folder> <folder/file>      --- move to trash whatever it is

NOTE : this commandline utility doesn;t require \"-r\" flag for removing directory
       it is quite smart to detect
"
alias rm='
function _rm(){
    if [ "$1" = "--help" ]
    then
        echo "$help_rm"
        return
    fi

    if [ "$1" = "-p" ] #deleting them permanently
    then
        if [ "$1" = "-r" ]
        then
            shift
        fi

        echo "do you want to delete permanently : $2 $3 $4 $5 ";
        read ans;
        if [ $ans = "y" ]
        then
            for i in `seq 2 $#`
            do
                if [ -d "${!i}" ]
                then
                    echo "rm -r ${!i}"
                    rm -r ${!i}
                elif [ -f "${!i}" ]
                then
                    echo "rm ${!i}"
                    rm ${!i}
                else
                    echo "no such file or directory ${!i}"
                fi
            done
        fi

    elif [ "$1" = "-f" ] #remove without permission ... 
    then
        for i in `seq 2 $#`
        do
            if [ -d "${!i}" ]
            then
                echo "rm -r ${!i}"
                rm -r ${!i}
            elif [ -f "${!i}" ]
            then
                echo "rm ${!i}"
                rm ${!i}
            else
                echo "no such file or directory ${!i}"
            fi
        done

    elif [ "$1" = "-r" ] #if someone gonna delete folder using rm -r
    then
        gvfs-trash $2 $3 $4 $5

    else
        gvfs-trash $1 $2 $3 $4 $5;
    fi
};_rm'


#trash 
help_trash="
trash ls                            --- list items in trash
trash <filename> [<filename> ,]     --- move given files to trash
trash -r <file/folder>              --- recover the file or folder
trash                               --- cd ~/.local/share/Trash/files
trash -d <filename>                 --- delete file permanemtly from trash
trash -empty                        --- clear all the trash
"
alias trash='
function _trash(){
    if  [ "$1" = "--help" ]
    then
        echo "$help_trash"
        return 
    fi

    if [ "$1" = "ls" ]
    then
        cd ~/.local/share/Trash/files/ 
        ls 
        cd - > /dev/null

    elif [ "$1" = "-r" ] #restore
    then
        now=`pwd`
        for i in `seq 2 $#`
        do
            cd ~/.local/share/Trash/files/ 
            mv ${!i} $now
            cd ~/.local/share/Trash/info/
            rm -f ${!i}.trashinfo > /dev/null
        done
        cd $now

    elif [ "$1" = "-d" ]
    then
        echo "do you want to delete permanently : $2 $3 $4 $5 ";
        read ans;
        if [ $ans = "y" ]
        then
            now=`pwd`
            for i in `seq 2 $#`
            do
                cd ~/.local/share/Trash/files/ 
                echo "rm ${!i}"
                rm -f ${!i}
                cd ~/.local/share/Trash/info/
                rm -f ${!i}.trashinfo > /dev/null
            done
            cd $now
        fi

    elif [ "$1" = "--empty" ]
    then
        echo "do you want to delete trash permanently ";
        read ans;
        if [ $ans = "y" ]
        then
            gvfs-trash --empty
        fi

    elif [ "$#" = 0 ] #move to location of trash
    then
        cd ~/.local/share/Trash/files/ 

    else
        gvfs-trash $1 $2 $3 $4 $5
    fi
};_trash'

#terminal
alias term='gnome-terminal & disown'
alias term='
function _term(){
    if [ "$#" -eq 0 ]
    then
        gnome-terminal & disown
    elif [ "$#" -eq 1 ]
    then
        gnome-terminal & disown & exit #sexy
    fi
};_term'

#screenlight
help_night="
"
alias night='
function _night(){
    if [ "$1" = "--help" ]
    then
        echo "$help_night"
        return
    fi

    if [ "$#" -eq 0 ]
    then
        xbacklight -set 1
    else
        xbacklight -set $1;
    fi
};_night'


#nautilous 
help_disk="
disk            -- open location in nautilous
disk desktop    -- open nautilous in desktop
disk disk       -- mounts disk(if not) and opens in nautilous
"
alias disk='
function _disk(){
    if [ "$1" = "--help" ]
    then
        echo "$help_disk"
        return
    fi

    if [ "$#" -eq 0 ]
    then
        loc=`pwd`; 
        nautilus $loc > /dev/null 2>&1 
    fi

    if [ "$#" -eq 1 ]
    then
        if [ "$1" = "desktop" ]
        then
            nautilus ~/Desktop > /dev/null 2>&1;
        elif [ "$1" = "disk" ]
        then
            hell=`mountpoint disk | grep -o not`  
			if [ "$hell" = "not" ]
            then
                echo "disk was not mounted";
                # -S is used to read from STDIN
                disk_name = "/dev/sda5" # change it to own disk 
                sudo -S -k  mount $disk_name /media/srb/disk/ < ~/.pass > /dev/null 2>&1 #sexy
                nautilus /media/srb/disk > /dev/null 2>&1 
            else
                echo "mounted";
                nautilus /media/srb/disk > /dev/null 2>&1
            fi
        fi
    fi
};_disk'

help_search_dir="
search_dir <file> <relative locaton>...    -- search <dir> in given location 
"
alias search_dir='
function _search_dir(){
    if [ "$#" -eq 1 ]
    then
        find . -type d | grep $1
    elif [ "$#" -eq 2 ]
    then
        find $2 -type d | grep $1
    else
        echo "$help_search_dir"
    fi
};_search_dir'

help_search_file="
search_file <file> <relative locaton>...    -- search <file> in given location 
"
alias search_file='
function _search_file(){
    if [ "$#" -eq 1 ]
    then
        find . -type f | grep $1
    elif [ "$#" -eq 2 ]
    then
        find $2 -type f | grep $1
    else
        echo "$help_search_file"
    fi
};_search_file'

help_search_me="
search_me <arg1> <arg2> <arg3> <arg4>...    -- search <arg1> in <arg2> excluding <arg3> <arg4>...
"
alias search_me='
function _search_me(){
    if [ "$1" = "--help" ]
    then
        echo "$help_search_me"
        return
    fi

    grep_cmd="grep -i -nr" 
    # i for ignore casesenstivity
    # I for ignoring binary files
    # n for numbering
    # r for recursive

    if [ "$#" -eq 1 ]
    then 
        grep -i -I -nr "$1" .

    elif [ "$#" -eq 2 ] 
    then
        grep -i -I -nr "$1" "$2"

    else
        excludes=""
        for i in `seq 3 $#` #sexy
        do
            if [ -d "${!i}" ] #sexy
            then
                excludes=$excludes" --exclude-dir=${!i}"
            fi
            if [ -f "${!i}" ]
            then
                excludes=$excludes" --exclude=${!i}"
            fi
        done
        echo "grep -i -I -nr $1 $2 $excludes"
        grep -i -I -nr $1 $2 $excludes
    fi
};_search_me'

#default programs
alias catc='cat ~/programs/myfiles/default_codes/default.cpp >>'
alias catj='cat ~/programs/myfiles/default_codes/default.java >>'
alias catp='cat ~/programs/myfiles/default_codes/default.py >>'
alias catb='cat ~/programs/myfiles/default_codes/default.sh >>'
alias catr='cat ~/programs/myfiles/default_codes/default.c >>'
alias cats='cat ~/programs/myfiles/default_codes/default.simple >>'
