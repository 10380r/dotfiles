# homebrewを使えるように環境変数を追加
#https://qiita.com/yotsak83/items/c37e91542d2c4518c65b
export PATH=$HOME/my_local/homebrew/bin:$PATH
export HOMEBREW_CACHE=$HOME/my_local/homebrew/cache

# 参考にしたよ
# https://gist.github.com/mollifier/4979906
# http://mkit2009.hatenablog.com/entry/2013/01/28/001213
# https://original-game.com/terminal-zsh2/
# 色を使用出来るようにする
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
# remove file mark
unsetopt list_types
## PROMPT--------------------------------------------
PROMPT="%{${fg[green]}%}%n@%{${reset_color}%} %~ %{${vcs_info_msg_0_}%}%{${reset_color}%  
%# "
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:git*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する
# end of PROMPT--------------------------------------
# 環境変数
export LANG=ja_JP.UTF-8
# 補完を有効にする
autoload -U compinit
compinit -u
zstyle ':completion:*' menu select
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#直前のコマンドと同じなら、履歴に残さない
setopt HIST_IGNORE_DUPS
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

# 各エイリアス
alias gls="gls --color"
alias grep="grep -G"
alias ls="ls -G"
alias ju="jupyter notebook"
alias line="open /Applications/LINE.app"
alias slack="open /Applications/Slack.app"
alias v="vim"
alias vi="vim" # vi使いづらい
#pyenvよりデフォのPythonが優先されてしまうので、それを回避
eval "$(pyenv init -)"
