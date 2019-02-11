# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/Users/drg62sf/.oh-my-zsh"

# set node environment default
export NODE_ENV=development

#source the powerlevel9k theme
p9k="/usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme"
if [[ -r $p9k ]]; then
	. /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
else
	echo "guess it doesn't exist ¯\_(ツ)_/¯" 
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"

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
  cloudfoundry
  brew
#catimg
  docker
  encode64
  osx
  node
  npm
  pod
  yarn
)

source $ZSH/oh-my-zsh.sh

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
. /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
  export NVM_DIR="$HOME/.nvm"
#  . "/usr/local/opt/nvm/nvm.sh"
export PCFZA='https://api.run-za.homedepot.com'
export PCFZB='https://api.run-zb.homedepot.com'
export PCFNP='https://api.run-np.homedepot.com'
source ~/.iterm2_shell_integration.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/drg62sf/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/drg62sf/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/drg62sf/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/drg62sf/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh user dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(battery status root_indicator background_jobs time)

GOOGLE_APPLICATION_CREDENTIALS=/Users/drg62sf/Downloads/np-inventory-commons-thd-d0fb703f37fc.json