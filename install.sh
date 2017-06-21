#!/bin/bash -xe

function pout(){
    local out=$1
    echo -e "\033[34m==>\033[0m \033[1m${out}\033[0m"
}

function save(){
    local fl=$1

    pout "The following files will be saved"
    [ -f $HOME/$1 ] && mv -v $HOME/${1}{,.save}
}
function mklnk(){
    local fl=$1

    dotdir=$(pwd)
    pushd $HOME
    pout "The following files will be installed"
    ln -vs ${dotdir}/$1 $1
    popd
}

# copy over bash profiles and rc
save .bash_profile
mklnk .bash_profile
save .bashrc
mklnk .bashrc

# copy over .emacs
save .emacs
mklink .emacs

# copy over git files
for g in git/.git*;do
    save $g
    mklnk $g
done
