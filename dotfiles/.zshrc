# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/kondouakira/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $luSSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias python=python3
alias pip=pip3

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

ZSH_DISABLE_COMPFIX=true

alias chrome="open -a 'Google Chrome'"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export Path="~/.cargo/bin"
alias vi="nvim "
alias vim="nvim "
alias local_un_mount='umount ~/mount && sshfs -p 7423  hikarukondo@192.168.10.104:/ ~/mount'
alias local_mount='sshfs -p 7423  hikarukondo@192.168.10.104:/ ~/mount'
alias local_ssh='ssh hikarukondo@192.168.10.104 -p 7423'
alias nig_ssh='ssh -i ~/.ssh/id_rsa hikarukondo@gw.ddbj.nig.ac.jp'
alias nig_mount='sshfs hikarukondo@gw.ddbj.nig.ac.jp:/home/hikarukondo/ ~/mount'
alias unmount='umount -f ~/mount'
alias tommo_ssh='ssh -l hikarukondo -p 50022 -i ~/.ssh/id_rsa_ToMMo sshgw2.megabank.tohoku.ac.jp'
alias tommo_mount='sshfs -p 50022 hikarukondo@sshgw2.megabank.tohoku.ac.jp:/home/hikarukondo/ ~/mount -o IdentityFile=~/.ssh/id_rsa_ToMMo'
alias kino_ssh='ssh -p 50022 -i .ssh/id_rsa_ToMMo  kino_binds@sshgw2.megabank.tohoku.ac.jp'
alias vmd='~/VMD.app/Contents/MacOS/startup.command'
typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kondouakira/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kondouakira/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/kondouakira/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kondouakira/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/luajit-openresty/bin:$PATH"
# export PGDATA=/usr/local/var/postgres
# export DYLD_LIBRARY_PATH=/Applications/Postgres.app/Contents/Versions/13/lib:$DYLD_LIBRARY_PATH
# export PATH=/opt/postgresql/bin:$PATH
export PATH=/opt/local/lib/postgresql13/bin:$PATH
# export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig
[ -f "/Users/kondouakira/.ghcup/env" ] && source "/Users/kondouakira/.ghcup/env" # ghcup-env
