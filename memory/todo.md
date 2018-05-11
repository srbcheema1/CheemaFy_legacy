uname -s
    to check linux or mac

make plugin for all syntaxes

we should use
    if [ "$1" = "--help" ]
instead of
    if [ $1 = "--help" ]

or we may use
    if [[ $1 == "--help" ]]
        not yet confirmed
