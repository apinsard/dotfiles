# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(django git pip sudo tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=".:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/local/sbin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

export WORKON_HOME=~/.venvs
source /usr/bin/virtualenvwrapper.sh

mkncd() {
  mkdir -pv $1
  cd $1
}

whichrepo() {
  echo "curl -s http://ports.funtoo.org/packages.xml | xmllint --xpath" "/packages/category[@name='$1']/package[@name='$2']/@repository" -
  curl -s http://ports.funtoo.org/packages.xml | xmllint --xpath "/packages/category[@name='$1']/package[@name='$2']/@repository" -
}

wksp() {
  tmux splitw -h -l90
  tmux splitw -v -p50
  tmux send-key -t 2 "workon $@" C-m
  tmux send-key -t 1 "workon $@" C-m
  tmux send-key -t 0 "workon $@ && deactivate" C-m
    # Activate the virtualenv to cd into the working directory
    # but deactivate it because nvim needs the system python (with neovim module)
}

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

export ZSH_TMUX_AUTOSTART=true
