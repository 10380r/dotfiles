## homebrewを使えるように環境変数を追加
#https://qiita.com/yotsak83/items/c37e91542d2c4518c65b
export PATH=$HOME/my_local/homebrew/bin:$PATH
export HOMEBREW_CACHE=$HOME/my_local/homebrew/cache

## 参考にしたよ
## https://gist.github.com/mollifier/4979906
## http://mkit2009.hatenablog.com/entry/2013/01/28/001213
## https://original-game.com/terminal-zsh2/
#--------------------------------------------------------------------
# 色を使用出来るようにする
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
# remove file mark
unsetopt list_types
## prompt
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[green]}%}%n@%{${reset_color}%} %~
%# "
# 環境変数
export LANG=ja_JP.UTF-8
# 補完を有効にする
autoload -U compinit
compinit -u
zstyle ':completion:*' menu select
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -GF"
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#直前のコマンドと同じなら、履歴に残さない
setopt HIST_IGNORE_DUPS
# 同じコマンドをヒストリに残さない
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# 補完で小文字と大文字無視
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# Ctrl+Dでzshを終了しない
setopt ignore_eof
# Jupyterのエイリアス
alias ju='/anaconda3/bin/jupyter_mac.command ; exit;'

eval "$(pyenv init -)"
