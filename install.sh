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
    ln -fvs ${dotdir/${HOME}/.}/$1 $1
    popd >/devn/null
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
for g in git/.git*;do
    save $g
    mklnk $(basename $g)
done
