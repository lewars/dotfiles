#!/bin/bash -e

function pout(){
    local out=$1
    echo -e "\033[34m==>\033[0m \033[1m${out}\033[0m"
}

function save(){
    local fl=$1
    if [[ -f $HOME/$1 && ! -h $HOME/$1 ]];then mv -v $HOME/${1}{,.save}; fi
}
function mklnk(){
    local fl=$1

    dotdir=$(pwd)
    pushd $HOME >/dev/null
    ln -fvs ${dotdir/${HOME}/.}/$fl $fl
    popd >/dev/null
}

# copy over bash profiles and rc
pout "The following bash profile files will be saved:"
save .bash_profile
save .bashrc
pout "The following bash profile file will be installed:"
mklnk .bash_profile
mklnk .bashrc

# copy over .emacs
pout "The following emacs config file will be saved:"
save .emacs
pout "The following emacs file will be installed:"
mklnk .emacs

# copy over git files
pout "The following git files will be saved and installed:"
cd git
for g in .git*;do
    save $g
    mklnk $g
done

# fix bug: relative path bug
# install iterm2 config; recommend you put this on a webserver though
# [[ ! -d "${HOME}/._iterm2" ]] && mkdir "${HOME}/._iterm2"
# pout "The following iterm2 config will be saved:"
# save ._iterm2/com.googlecode.iterm2.plist
# pout "The following iterm2 file will be installed:"
# mklnk ._iterm2/com.googlecode.iterm2.plist
