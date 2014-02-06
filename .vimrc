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
"    Version: 0.5.0
" LastChange: Monday Oct 21, 2013 06:05
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

" {{{ => 編輯設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix
set fileformats=unix,dos,mac

set nobomb
set fileencoding=utf-8
set encoding=utf-8
set fencs=ucs-bom,utf-8,default,chinese,big5,latin1

set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

set nowrap
set linebreak

set textwidth=0
set wrapmargin=0
set linespace=2
set formatoptions+=mM

set autoindent
set smartindent

set autochdir

set clipboard+=unnamed
set nobackup
set nowritebackup
set noswapfile

set completeopt=menuone
" }}}

" {{{ => UI 設定
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

" {{{ => 快捷鍵
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>bd  :bd<CR>
nmap <Leader>e   :e! $MYVIMRC<CR>
nmap <Leader>w   :w!<CR>

nmap <RIGHT>          :bnext<CR>
nmap <LEFT>           :bprevious<CR>
nmap <Leader><Leader> :bnext<CR>
noremap <Leader>cd    :cd %:p:h<CR>:pwd<CR>
" }}}

" {{{ => Term/CmdLine/Status 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TERM
if ! has("gui_running")
    " 让终端机继承 Vim 的标题
    set title

    " 设定终端编码
    " 如果是中文Win32 CMD，则是GBK
    if has('win32')
        set termencoding=gbk
    else
        set termencoding=utf-8
    endif

    " 终端颜色数
    set t_Co=256
    if has("mac")
        " Snow Leopard 的默認終端不支持256色
        set t_Co=16
    endif

    " 终端默认主题
    colorscheme lucius
    LuciusDarkLowContrast
endif

" CommandLine
if has('cmdline_info')
    set ruler                                           " 显示光标位置
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " a ruler on steroids
    set showcmd                                         " 右下角显示命令
endif

" StatusLine
if has('statusline')
    set laststatus=2
endif
" }}}

" {{{ => 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle
" ----------------------------
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'

" Bundles
Bundle 'Emmet.vim'
Bundle 'benmills/vimux'
Bundle 'evidens/vim-twig'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'

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
nmap <Leader>z ,bs<CR>

" Tabular
" ----------------------------
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Php-doc
" ----------------------------
nnoremap <Leader>c :call PhpDocSingle()<CR>

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

" vim: set fdm=marker ff=unix sw=4 ts=4 et:

