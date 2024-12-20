# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set node environment default
export NODE_ENV=development

# GraalVM Home (used to build native binaries from java code for Quarkus)
export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java19-22.3.0/Contents/Home
#source the powerlevel9k theme
#p9k="/usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme"
#if [[ -r $p9k ]]; then
#	. /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
#else
#	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
#fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  brew
  catimg
  docker
  docker-compose
  encode64
  kubectl
  iterm2
  lol
  emoji-clock
  macos
  mac-zsh-completions
  node
  #pod
  yarn
  xcode
  vundle
  rsync
  #vscode
  z
)

# Enable zsh-completions that was installed through zsh
# This includes completions the plugins above
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
ZSH_DISABLE_COMPFIX=true

source "$ZSH/oh-my-zsh.sh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#. /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
  export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

source ~/.iterm2_shell_integration.zsh

POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(ssh user dir dir_writable vcs)
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(battery status root_indicator background_jobs time)
alias eslint=node_modules/eslint/bin/eslint.js

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
#eval "$(jenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/bash install.sh --disable-prompts/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/bash install.sh --disable-prompts/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/bash install.sh --disable-prompts/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/bash install.sh --disable-prompts/google-cloud-sdk/completion.zsh.inc"; fi
#source $HOME/google-cloud-sdk/path.zsh.inc
#source $HOME/google-cloud-sdk/completion.zsh.inc
#source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# Adds Lunar Vim to config
if [ -f "$HOME/.local/bin/lvim" ]; then
  export PATH="$PATH:$HOME/.local/bin/"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
alias giaptunnel="gcloud compute start-iap-tunnel"
alias gssh="gcloud compute ssh"

# Display neofetch if we're ssh-ing
if [[ -v SSH_CONNECTION ]]; then
	neofetch
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#source <(quarkus completion zsh)
JAVA_HOME=$(/usr/libexec/java_home)
