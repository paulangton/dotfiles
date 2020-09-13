# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/paul/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sunrise"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux python zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]] || [[ ! -x "command -v nvim" ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Wayland display environment
export ELM_DISPLAY=wl
# export WLC_XWAYLAND=0
# export GDK_BACKEND=wayland
export GTK_CSD=0
export _JAVA_AWT_WM_NONREPARENTING=1

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# include user-installed programs
export PATH=$PATH:~/.local/bin

# cloud SDK path
export GOOGLE_SDK_PATH="/opt/google-cloud-sdk"

# Set up Go dev environment
export GOPATH=$HOME/dev/go
export PATH=$PATH:$(go env GOPATH)/bin

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias clear='clear && fortune -a | cowthink | lolcat'
alias ls='ls --color=auto'
alias dolphin='dolphin-emu'
alias pdf='zathura'
alias image='feh'
alias screenshot='import'
alias git-sync-upstream-master='git fetch upstream && git checkout master && git rebase upstream/master'


# virtualenvwrapper
VENV_WRAPPER=/usr/bin/virtualenvwrapper.sh
if [[ -f $VENV_WRAPPER ]]; then
    source $VENV_WRAPPER
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





# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/paul/src/google-cloud-sdk/path.zsh.inc' ]; then source '/home/paul/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/paul/src/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/paul/src/google-cloud-sdk/completion.zsh.inc'; fi
