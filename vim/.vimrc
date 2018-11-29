syntax on
" Vundle-----------------------------------------------------------------
" Vundle README:
" https://github.com/VundleVim/Vundle.vim
set nocompatible " required by Vundle
filetype off     " required by Vundle
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required by Vundle
Plugin 'VundleVim/Vundle.vim'
" 単語や行、段落など(モーション)をかっこで囲んだり、外したりできる
Plugin 'tpope/vim-surround'
" 範囲(モーション)の入れ替えを行う
Plugin 'tommcdo/vim-exchange'
" Vimからgitを操作する
Plugin 'tpope/vim-fugitive'
" インデントに色を付けて見やすくする
Plugin 'Yggdroot/indentLine'
" ファイルをtree表示してくれる
Plugin 'scrooloose/nerdtree'
" コメントON/OFFを手軽に実行
Plugin 'tomtom/tcomment_vim'
" color scheme
Plugin 'cocopon/iceberg.vim'
" " よく使うコマンドをより素早く行うためのコマンドを多数持つプラグイン
" Plugin 'tpope/vim-surround'
call vundle#end()          " required by Vundle
filetype plugin indent on  " required by Vundle
" end of Vundle settings--------------------------------------------------
" 全角スペースの背景を白に変更
autocmd Syntax,ColorScheme * highlight FullwidthSpace ctermbg=red guibg=white
autocmd Syntax,ColorScheme * syn match FullwidthSpace containedin=ALL /　/

colorscheme iceberg
set title
set swapfile
set directory=~/.vim/.swap
set backup
set backupdir=~/.vim/.backup
set noundofile
set cursorline
set number
set clipboard+=unnamed
set autoindent
set smartindent
set hlsearch
" ビープ音の代わりに画面をフラッシュさせる動作を止める
set novisualbell
" UTF-8をデフォルトの文字エンコーディングにする
set fileencoding=utf-8
scriptencoding utf-8
" エンコーディングの検出順を設定
set fileencodings=utf-8,cp932,eucjp
" jjと入力して挿入モードから抜ける
inoremap jj <esc>
" delateキー有効
set backspace=indent,eol,start
