#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

setopt IGNOREEOF

umask 002

alias vim='nvim'
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i -v"
alias ll='ls -la'
alias grep='grep --color'
alias df='df -h'
alias ps='ps --sort=start_time'
alias g='git'

# 履歴ファイル保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される件数
export HISTSIZE=1000

# 履歴ファイルに保存される件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# 履歴共有
setopt share_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# 履歴検索
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[p" history-beginning-search-backward-end
bindkey "^[n" history-beginning-search-forward-end

# 履歴一覧表示
function history-all { history -E 1 }

# Ctrl-hで履歴選択
function mkcd(){mkdir -p $1 && cd $1}
source /Users/maou/zsh_plugin/zaw/zaw.zsh
bindkey '^h' zaw-history

# 予測入力
autoload predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^P' predict-on
bindkey '^O' predict-off
zstyle ':predict' verbose true

# BEEPを鳴らさない
setopt NO_BEEP

# シンボリックリンクは実体を追うようになる
unsetopt CHASE_LINKS

# $0 にスクリプト名/シェル関数名を格納
setopt FUNCTION_ARGZERO

# コマンドラインでも # 以降をコメントと見なす
setopt INTERACTIVE_COMMENTS

# C-Uで行頭まで削除
bindkey "^U" backward-kill-line

# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする。
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# zsh Git
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
zstyle ':vcs_info:git:*' actionformats '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f%F{1}%u%f%F{6}%c%f'
zstyle ':vcs_info:git:*' formats       '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{5}]%F{1}%u%f%F{6}%c%f'
precmd() { vcs_info }
RPROMPT='${vcs_info_msg_0_}%f'
REPORTTIME=3

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/maou/.sdkman"
[[ -s "/Users/maou/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/maou/.sdkman/bin/sdkman-init.sh"

export XDG_CONFIG_HOME=~/.config

