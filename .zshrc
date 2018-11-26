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
## PROMPT--------------------------------------------
PROMPT="%{${fg[green]}%}%n@%{${reset_color}%} %~
%# "
## RPROMPT
LPROMPT=$'`branch-status-check` %~' # %~はpwd
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する
# @see https://wiki.archlinux.org/index.php/zsh
function branch-status-check {
    local prefix branchname suffix
        # .gitの中だから除外
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
        fi
        branchname=`get-branch-name`
        # ブランチ名が無いので除外
        if [[ -z $branchname ]]; then
            return
        fi
        prefix=`get-branch-status` #色だけ返ってくる
        suffix='%{'${reset_color}'%}'
        echo ${prefix}${branchname}${suffix}
}
function get-branch-name {
    # gitディレクトリじゃない場合のエラーは捨てます
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status {
    local res color
        output=`git status --short 2> /dev/null`
        if [ -z "$output" ]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ $output =~ "[\n]?\?\? " ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ $output =~ "[\n]? M " ]]; then
            res='M:' # Modified
            color='%{'${fg[red]}'%}'
        else
            res='A:' # Added to commit
            color='%{'${fg[cyan]}'%}'
        fi
        # echo ${color}${res}'%{'${reset_color}'%}'
        echo ${color} # 色だけ返す
}
# end of PROMPT--------------------------------------
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

# 各エイリアス
alias grep='grep -G'
alias ls='ls -G'
alias ju="jupyter notebook"
alias line="open /Applications/LINE.app"
alias slack="open /Applications/Slack.app"
#pyenvよりデフォのPythonが優先されてしまうので、それを回避
eval "$(pyenv init -)"
