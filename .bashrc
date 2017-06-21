# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
source ~/.git-prompt.sh

export HISTSIZE=1001
shopt -s histappend

# enable feature to cd into directories using variables
shopt -s cdable_vars
#
# e.g.,
#export doc="/home/slams/Documents"

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias ll='ls -lah'
alias l=ls
alias slide='sudo su -'
alias chx='chmod +x'
alias top='top -o cpu'

function u() {
    l=$(printf '../%.0s' $(seq 1 ${1}))
    cd $l
}

function h() {
    history $1
}

# cd to parent directory of file
jump() {
    cd "$(dirname ${1})"
}

function prompt() {
    local ptype=dev

    if [[ -n $1 ]]; then
	ptype=$1
    else
	ENVIRONMENT=$(echo $ENVIRONMENT | tr 'A-Z' 'a-z')
	if [[ $ENVIRONMENT -eq 'prd' ]]; then
	    ptype='prd'
	fi
    fi

    case "$ptype" in
	dev)
	    export PS1="\w\n\u@\h [\$?] $(__git_ps1 " (%s)")\\$ \[$(tput sgr0)\]"
	    ;;
	prd)
	    phost='\[$(tput sgr0)\]\[\033[48;5;1m\]\h\[$(tput sgr0)\]\[\033[48;5;-1m\]'
	    export PROMPT_COMMAND='rc=$?;PS1="\[\033[38;5;4m\]\w\[$(tput sgr0)\]\n\u@"$phost" `[[ $rc == 0 ]] && echo 😎 || echo 😈 `  $(__git_ps1 " (%s)")\\$ \[$(tput sgr0)\]"'
	    ;;
	emoji)
	    phost='\h'
	    export PROMPT_COMMAND='rc=$?;PS1="\[\033[38;5;4m\]\w\[$(tput sgr0)\]\n\u@"$phost" `[[ $rc == 0 ]] && echo 😎 || echo 😈 `  $(__git_ps1 " (%s)")\\$ \[$(tput sgr0)\]"'
	    ;;
	*)
	    export PS1='[\h \w \$] '
	    ;;
    esac
}

prompt emoji

if [ $EUID -eq 0 ]; then
    prompt prd
    export PATH=/sbin:/usr/sbin:$PATH:/usr/local/admin/bin
fi
