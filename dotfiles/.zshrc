
# zinit load
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
# 非同期処理できるようになる
zinit load "mafredri/zsh-async"
# テーマ(ここは好みで。調べた感じpureが人気)
zinit load "sindresorhus/pure"
zstyle :prompt:pure:path color '#00FFFF'
# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zinit load "zsh-users/zsh-syntax-highlighting"
# コマンド入力途中で上下キー押したときの過去履歴がいい感じに出るようになる
zinit load "zsh-users/zsh-history-substring-search"
# 過去に入力したコマンドの履歴が灰色のサジェストで出る
zinit load "zsh-users/zsh-autosuggestions"
# 補完強化
zinit load "zsh-users/zsh-completions"
# 256色表示にする
zinit load "chrissicool/zsh-256color"
# コマンドライン上の文字リテラルの絵文字を emoji 化する
# zinit load "mrowa44/emojify",
HISTFILE=$HOME/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=10000
# HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=10000
# Then, source plugins and add commands to $PATH

# ls dir color
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extension mp3
# fm rm # To rm files in current directory
f() {
    sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}

# Like f, but not recursive.
fm() f "$@" --max-depth 1

# Deps
alias fz="fzf-noempty --bind 'tab:toggle,shift-tab:toggle+beginning-of-line+kill-line,ctrl-j:toggle+beginning-of-line+kill-line,ctrl-t:top' --color=light -1 -m"
fzf-noempty () {
	local in="$(</dev/stdin)"
	test -z "$in" && (
		exit 130
	) || {
		ec "$in" | fzf "$@"
	}
}
ec () {
	if [[ -n $ZSH_VERSION ]]
	then
		print -r -- "$@"
	else
		echo -E -- "$@"
	fi
}

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

ZSH_DISABLE_COMPFIX=true

alias python=python3
alias pip=pip3
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
export PATH=/opt/local/lib/postgresql13/bin:$PATH
[ -f "/Users/kondouakira/.ghcup/env" ] && source "/Users/kondouakira/.ghcup/env" # ghcup-env
