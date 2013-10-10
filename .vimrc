"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"           _         ______ |
"         /   \___-=O`/|O`/_>|
"         \ 423      / | /    )
"          `/-==__ _/__|/__=-|
"          *             \ | |
"                        (o)
"
" http://phpvim.net
"
" Maintainer: Verdana Mu <verdana.cn@gmail.com>
"    Version: 0.4.0
" LastChange: Sunday Aug 04, 2013
"
" vim:shiftwidth=4:tabstop=4:expandtab
"
"
" 该配置文件仅针对于 vim7+ 的版本
if v:version < 700
    echoerr '该配置 ' . $MYVIMRC . ' 仅适用于 Vim7 或者更新的版本.'
    quit
endif

" {{{ => 通用设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=none
lang C
lang mes en_US.UTF-8
filetype off

set nocompatible
set nospell
set autoread

let mapleader=","
let g:mapleader=","
" }}}

" {{{ => Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix
set fileformats=unix,dos,mac

set nobomb
set fileencoding=utf-8
set encoding=utf-8
set fencs=ucs-bom,utf-8,default,chinese,big5,latin1

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set nowrap
set linebreak

set textwidth=0
set wrapmargin=0
set linespace=2
set formatoptions+=mM

set autoindent
set smartindent

set autochdir

set nobackup
set nowritebackup
set noswapfile
" }}}

" {{{ => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设定东西方共用符号的长度，如省略号，破折号等...
" 只有 encoding 为 unicode 兼容编码时，这个选项才有意义
set ambiwidth=double

set showmode                            " 顯示當前模式
set cmdheight=2                         " 命令行高度
set scrolloff=7                         " 纵向移动时，光标行与上下两端的最小行数
set wildmenu
set wildmode=list:longest,full
set number                              " 显示行号
set numberwidth=3                       " 行号列宽度
set lazyredraw                          " 延迟重绘
set hidden                              " @see :help hidden
set backspace=indent,eol,start          " 控制 <BS> 删除模式
set linespace=0                         " No extra spaces between rows
set whichwrap+=<,>,h,l                  " Backspace and cursor keys wrap to
set showmatch                           " 当输入一个括号时，光标会短暂跳到与之对应的括号处
set incsearch                           " 即时显示搜索结果
set hlsearch                            " 高亮显示搜索结果
set ignorecase                          " 搜索时忽略大小写
set magic                               " 自动转义搜索正则表达式中的特殊字符
set matchtime=5                         " 光标跳过去后，每秒闪烁的次数
" }}}

nmap <Leader>bd  :bd<CR>
nmap <Leader>e   :e! $MYVIMRC<CR>
nmap <Leader>q   :q!<CR>
nmap <Leader>w   :w!<CR>
nmap <Leader>x   :qa!<CR>

nmap <RIGHT>          :bnext<CR>
nmap <LEFT>           :bprevious<CR>
nmap <Leader><Leader> :bnext<CR>
noremap <Leader>cd    :cd %:p:h<CR>:pwd<CR>

" {{{ => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vunble
" ----------------------------
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'

" Bundles
Bundle 'benmills/vimux'
Bundle 'evidens/vim-twig'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
"Bundle 'vim-scripts/LycosaExplorer'

" vim-scripts repos
Bundle 'bufexplorer.zip'
Bundle 'c.vim'
Bundle 'nginx.vim'

syntax on
filetype plugin indent on

" CoffeeScript
" ----------------------------
"au BufWritePost *.coffee silent make!
nmap <silent> <F5> :silent make<CR>

" BufExplorer
" ----------------------------
nmap <silent> <special> <Leader>z ,bs<CR>

" Tabular
" ----------------------------
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" NERD tree
" ----------------------------
let NERDTreeSplitVertical       = 1
let NERDTreeWinPos              = 1
let NERDTreeWinSize             = 50
let NERDTreeChDirMode           = 1
let NERDTreeHighlightCurosrline = 1
let NERDTreeQuitOnOpen          = 1
let NERDTreeShowBookmarks       = 1
let NERDTreeShowHidden          = 0
let NERDTreeIgnore              = ['favicon.ico', 'images']
nmap <special> <leader>v :NERDTreeToggle<CR>
" }}}

" Load vimrc.local
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

