"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"           _         ______ |
"         /   \___-=O`/|O`/_>|
"         \ 423      / | /    )
"          `/-==__ _/__|/__=-|
"          *             \ | |
"                        (o)
"
" Maintainer: Verdana Mu <verdana.cn@gmail.com>
"    Version: 0.6.0
" LastChange: Thursday May 25, 2017 12:22
"
" 该配置文件仅针对于 vim7+ 的版本
if v:version < 700
    echoerr '该配置 ' . $MYVIMRC . ' 仅适用于 Vim7 或者更新的版本.'
    quit
endif

" {{{ => 通用设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=none
set shell=/bin/bash
lang C
lang mes en_US.UTF-8
filetype off

set nocompatible
set nospell
set autoread

let mapleader=","
let g:mapleader=","

let g:python_host_prog = "python"
let g:loaded_python3_provider = 1  " disable Python3 support

" }}}

" {{{ => 编辑设定
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

" {{{ => 界面定制
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设定东西方共用符号的长度，如省略号，破折号等...
" 只有 encoding 为 unicode 兼容编码时，这个选项才有意义
set ambiwidth=double

set showmode                            " 显示当前的模式
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
set cmdheight=2                         " 命令行高度
set title

" 命令行
if has('cmdline_info')
    " 自定义的状态栏一般会覆盖 ruler / rulerformat 的设定
    set ruler                                           " 显示光标位置
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " 状态栏右侧光标位置信息的格式
    set showcmd                                         " 右下角显示命令
endif

" 状态栏
if has('statusline')
    set laststatus=2
endif
" }}}

" {{{ => 快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>bd  :bd<CR>
nmap <Leader>e   :e! $MYVIMRC<CR>
nmap <Leader>w   :w!<CR>
nmap <Leader>r   :e!<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nmap <RIGHT>          :bnext<CR>
nmap <LEFT>           :bprevious<CR>
nmap <Leader><Leader> :bnext<CR>
noremap <Leader>cd    :cd %:p:h<CR>:pwd<CR>
"nmap <silent> <F5>    :silent make<CR>
" }}}

" {{{ => 语法高亮以及颜色主题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on

" 设定颜色主题
set background=dark
try
    "let g:solarized_termtrans=0
    "let g:solarized_termcolors=256
    colorscheme solarized
catch
    colorscheme desert
endtry
" }}}

" {{{ => 插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"Plug 'altercation/vim-colors-solarized'
Plug 'aliva/vim-fish'
Plug 'benmills/vimux'
Plug 'chr4/nginx.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'evidens/vim-twig'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'groenewege/vim-less'
Plug 'jlanzarotta/bufexplorer'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'msanders/snipmate.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/c.vim'

call plug#end()
" }}}

" {{{ => 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CoffeeScript
" ----------------------------
"au BufWritePost *.coffee silent make!

" BufExplorer
" ----------------------------
nnoremap <silent> <Leader>z :BufExplorerHorizontalSplit<CR>

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
let NERDTreeWinSize             = 40
let NERDTreeChDirMode           = 1
let NERDTreeHighlightCurosrline = 1
let NERDTreeQuitOnOpen          = 1
let NERDTreeShowBookmarks       = 1
let NERDTreeShowHidden          = 0
let NERDTreeIgnore              = ['favicon.ico', 'images']
nmap <special> <leader>v :NERDTreeToggle<CR>
" }}}

" {{{ => 其它配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 行尾空格
function! <SID>StripTrailingWhitespaces()
    let line = line(".")
    let col  = col(".")
    %s/\s\+$//e
    call cursor(line, col)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
match ErrorMsg '\s\+$'

nmap    <SPACE>     :exec "normal j"<CR>
nmap    <Leader>f   [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
noremap <Leader>m   mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" 複製粘貼
set pastetoggle=<F2>
nmap <Leader>, "+p
nmap <Leader>o "*p

" 行号
nmap <C-N><C-N> :set invnumber<CR>

" 添加分號在行尾
autocmd FileType cpp,php nmap ; :exec "normal A;"<ESC>

" 刷新语法高亮
autocmd BufEnter * :syntax sync fromstart

" Abbreviations
iab xdatetime   <C-R>=strftime("%A %b %d, %Y %H:%M")<CR>
iab xdate       <C-R>=strftime("%A %b %d, %Y")<CR>
iab xvim        /*- vim: set fdm=marker ff=unix sw=4 ts=4 et: -*/<CR>
" }}}

" Load vimrc.local
if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif

" vim: set fdm=marker ff=unix sw=4 ts=4 et:

