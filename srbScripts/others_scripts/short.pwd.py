import os
from socket import gethostname
hostname = gethostname()
username = os.environ['USER']
pwd = os.getcwd()
homedir = os.path.expanduser('~')
pwd = pwd.replace(homedir, '~', 1)
if len(pwd) > 33:
    pwd = pwd[:10]+'...'+pwd[-20:] # first 10 chars+last 20 chars
print '[%s@%s:%s] ' % (username, hostname, pwd)





# write it in .bashrc
# export PROMPT_COMMAND='PS1="$(python path_to_This_file)"'
# https://askubuntu.com/questions/17723/trim-the-terminal-command-prompt-working-directory

# if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
# else
    # PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
# fi




# best way is to paste this in directory
# PROMPT_DIRTRIM=3
