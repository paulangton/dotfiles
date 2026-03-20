# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="ys"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# zsh plugins
plugins=(git python golang zsh-syntax-highlighting ruby)

source $ZSH/oh-my-zsh.sh

# User configuration

# editor selection, prefer neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
command -v nvim >/dev/null
if [[ $? -ne 0 ]]; then
export EDITOR='vim'
    echo "neovim is not installed - falling back to vim as editor"
else
    export EDITOR='nvim'
fi


# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# include user-installed programs
export PATH="$PATH:~/.local/bin"

# Set up Go dev environment
export GOPATH=$HOME/go
# export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

# Set up ruby dev environment
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ls='ls --color=auto'

# git aliases
alias git-sync-upstream-master='git fetch upstream && git checkout master && git rebase upstream/master'
alias gcm="git commit -m"
alias gst="git status"
alias gco="git checkout"
alias grc="git rebase --continue"
alias gshitcommit="git commit -m f --no-verify"
alias gsyncbranchmaster="git checkout master && git pull && git checkout - && sleep 10 && git rebase master"

# TODO not working
alias gancestorof="git rev-list commit2 | grep git rev-parse commit2"
alias grecent="git branch --sort=-committerdate"

alias bout="cd $(bazel info output_path)/darwin_arm64-fastbuild/bin"

function get-branch {
    git remote set-branches --add origin $1 && git fetch origin $1 && git checkout --track origin/$1
}

function drop-branch {
    git config --unset remote.origin.fetch $1
}

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
autojump="/usr/share/autojump/autojump.zsh"
if [[ -f "$autojump" ]]
then
	source $autojump
fi

fun_print=""
# Very important configurations
if [[ -x "$(command -v fortune)" ]]; then
    fun_print+="fortune "
    if [[ -x "$(command -v cowthink)" ]]; then
        fun_print+="| cowthink "
        if [[ -x "$(command -v lolcat)" ]]; then
            fun_print+="| lolcat"
        fi
    fi
fi
eval $fun_print



# Add colors to ls
LS_COLORS=$HOME/.LS_COLORS/LS_COLORS
if [[ -f $LS_COLORS ]]; then
    eval $( dircolors -b $LS_COLORS)
fi

# Change zsh tab ccomplete to reflect dircolors
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

# shell history settings
HISTSIZE=10000000
SAVEHIST=10000000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
