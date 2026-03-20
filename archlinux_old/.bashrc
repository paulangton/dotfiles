#
# ~/.bashrc
#

# History
HISTSIZE=8192
HISTFILESIZE=8192

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Go dev environment
export GOPATH=$HOME/dev/go

# Editor
export EDITOR=vim

# Path changes
export PATH=$PATH:/home/paul/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:"/usr/lib/go-1.10/bin"

# User aliases
alias git-sync-upstream-master='git fetch upstream && git checkout master && git rebase upstream/master'
alias ls='ls --color=auto'
alias geth='geth --datadir=/mnt/d/Ethereum'
PS1='[\u@\h \W]\$ '
