# Path to your oh-my-zsh installation.
  export ZSH=/home/jui-hsien/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"


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
plugins=(git cp pj rand-quote)

## for pj plug-in, reference see:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/pj/pj.plugin.zsh
PROJECT_PATHS=(~/code/acoustics ~/code/acoustics/src ~/code/acoustics/work)

# User configuration

## dircolors support for ls and grep color print
if [ -x /usr/bin/dircolors ]; then
    TERM_TOOLS=${HOME}/term-tools
    eval `dircolors $TERM_TOOLS/config/.dircolors`
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## search paths
export PYTHONSTARTUP=${HOME}/.pythonstartup
export PYTHONPATH=${HOME}/opt/lib/python2.7/lib/python:$PYTHONPATH
export PATH=${HOME}/opt/bin:/usr/local/cuda-7.5/bin:${PATH}
export CPLUS_INCLUDE_PATH=${HOME}/opt/include:${CPLUS_INCLUDE_PATH}
export LD_LIBRARY_PATH=${HOME}/opt/lib:${HOME}/opt/eigen:/usr/local/cuda-6.5/lib64:/usr/local/lib:${LD_LIBRARY_PATH}
export LIBRARY_PATH=${HOME}/opt/lib:/usr/local/lib:${LIBRARY_PATH}

## source auxiliary files
source $ZSH/oh-my-zsh.sh
source ${HOME}/.alias
if [ -f ${HOME}/.workspace ]; then 
    source ${HOME}/.workspace
    quote
fi

## git config
git config --global core.excludesfile ~/.gitignore_global

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"