# Path to your oh-my-zsh installation.
export ZSH=/Users/rcogley/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
plugins=(rickcogley taskwarrior ackgrep pipe directory git git-extras colored-man colorize brew osx zsh-syntax-highlighting jira heroku chucknorris coffee node dircycle dirhistory docker lol rand-quote screen atom)

# User configuration

export PATH="/Users/rcogley/gocode:/Users/rcogley/gocode/bin:/usr/local/sbin:/usr/local/bin:/usr/local/heroku/bin:/opt/local/bin:/opt/local/sbin:/Users/rcogley/.rvm/gems/ruby-1.9.3-p362/bin:/Users/rcogley/.rvm/gems/ruby-1.9.3-p362@global/bin:/Users/rcogley/.rvm/rubies/ruby-1.9.3-p362/bin:/Users/rcogley/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/go/bin:/Users/rcogley/.rvm/bin"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# export MANPATH="/usr/local/man:$MANPATH"

# Load zmodloads
zmodload zsh/datetime

source $ZSH/oh-my-zsh.sh

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

# BREW RECOMMENDED
fpath=(/usr/local/share/zsh-completions $fpath)

# TOO MANY OPEN FILES ERROR
# sudo nano /etc/sysctl.conf
#   kern.maxfiles=24576
#   kern.maxfilesperproc=20480
ulimit -n 16384

# Help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Recommended on http://nuclearsquid.com/writings/git-tricks-tips-workflows/
autoload -U compinit && compinit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
