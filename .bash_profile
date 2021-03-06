# .bash_profile
#
# Alistair Y. Lewars

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH=$HOME/bin:$HOME/usr/local/bin:/usr/local/bin:$PATH
export CDPATH=":~/git"
export PIP_REQUIRE_VIRTUALENV=true
export PAGER=less
export LESS=iXMR
export EDITOR=emacs
export VISUAL=$EDITOR
export LSCOLORS=exgxcxfxbxegedabagacad
export CLICOLOR=1
# export PS1='[\h \w \$] ' # simple version
# export PS1="\w\n\u@\h [\$?] \\$ \[$(tput sgr0)\]"

# create tmp dir if not present
export TMPDIR=$HOME/tmp
[ ! -d $TMPDIR ] && mkdir -p $TMPDIR

# load gcloud setting
[ -f "~/._gcloud" ] && source ~/._gcloud

export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
