"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"           _         ______ |
"         /   \___-=O`/|O`/_>|
"         \ 777      / | /    )
"          `/-==__ _/__|/__=-|
"          *             \ | |
"                        (o)
"
" Maintainer: Verdana Mu <verdana.cn@gmail.com>
" LastChange: Saturday Sep 10, 2022 17:00
"
" 该配置文件仅针对于 vim8+ 的版本
if v:version < 800
    echoerr '该配置 ' . $MYVIMRC . ' 仅适用于 Vim 8 或者更新的版本.'
    quit
endif

" {{{ => 通用设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lang en_US.UTF-8
filetype off

set nocompatible
set langmenu=none
set nospell
set autoread

set noswapfile
set nobackup
set nowb

let mapleader=","
let g:mapleader=","

if has('unix') || has('mac')
    set shell=/bin/bash

    " let g:loaded_python_provider = 0
    let g:loaded_ruby_provider   = 1
    let g:python_host_prog       = "/usr/bin/python2"
    let g:python3_host_prog      = "/usr/bin/python3"
elseif has('win32')
    set shell=cmd

    " let g:loaded_python_provider = 1
    let g:loaded_ruby_provider   = 1
    let g:python_host_prog       = "D:/Python/python.exe"
    let g:python3_host_prog      = "D:/Python3/python.exe"
endif
" }}}

" {{{ => 编辑设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix
set fileformats=unix,mac,dos

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
set nowritebackup

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
set cursorline                          " 高亮显示光标所在行
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

" 光标
if has('nvim')
    set guicursor=a:hor20
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:hor20
    augroup END
endif
" }}}

" {{{ => 插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
"
" plugins
Plug 'fladson/vim-kitty'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'projekt0n/github-nvim-theme'
Plug 'rakr/vim-one'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
" }}}

" {{{ => 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lightline
" ----------------------------
let g:lightline = { 'colorscheme': 'one' }

" Tabular
" ----------------------------
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" }}}

" {{{ => 语法高亮以及颜色主题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on

" 设置 GUI 字体
if has("gui_running")
    set guifont=更纱黑体\ Mono\ SC\ Nerd:h18
endif

if has("nvim")
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

" 设定颜色主题
set background=dark
set termguicolors
colorscheme github_dark

"let g:one_allow_italics=1
"call one#highlight('Normal', '', '252525', '')
"call one#highlight('Comment', '', '', 'none')
"call one#highlight('vimLineComment', '', '', 'none')
" }}}

" {{{ => 文件类型专用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make 命令
autocmd FileType cpp,coffee nmap <silent> <F5> :silent make<CR>

" 行尾追加分号
autocmd FileType cpp,php nmap ; :exec "normal A;"<ESC>

" 缩进
autocmd FileType yaml set tabstop=4 shiftwidth=4 expandtab

" 代码折叠
autocmd FileType cpp        set foldmethod=syntax
autocmd FileType go,lua,php set foldmethod=indent

" 注释
autocmd FileType cpp,php set commentstring=\/\/%s
autocmd FileType cmake   set commentstring=#%s
autocmd FileType upstart set commentstring=#%s
" }}}

" {{{ => 其它配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 保存时自动删除行尾空格
function! <SID>StripTrailingWhitespaces()
    let line = line(".")
    let col  = col(".")
    %s/\s\+$//e
    call cursor(line, col)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
match ErrorMsg '\s\+$'

" 根据配置生成 modeline
function! <SID>AppendModeline()
    let l:modeline = printf(" vim: set%s ts=%d sw=%d tw=%d %set :",
                \ exists("&foldmethod") ? ' fdm=' . &fdm : '' ,
                \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, '')
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call <SID>AppendModeline()<CR>

" 保存与关闭
nmap <Leader>bd  :bd<CR>
nmap <Leader>w   :w!<CR>

" 对于无写权限的文件，允许使用 sudo 命令尝试保存
cmap w!! w !sudo tee > /dev/null %

" VIMRC
nmap <Leader>e   :e! $MYVIMRC<CR>
nmap <Leader>r   :so $MYVIMRC<CR>

" 使用左右箭头键在不同的 buffer 间切换
nmap <RIGHT> :bnext<CR>
nmap <LEFT>  :bprevious<CR>

" 空格键移动光标到下一行
nmap <SPACE> :exec "normal j"<CR>

" 快速切换到当前编辑文件所在的目录
noremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" 删除行尾的 ^M，转换文件格式 DOS->UNIX
noremap <Leader>m   mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" 复制粘贴
set pastetoggle=<F2>
nmap <Leader>, "+p
nmap <Leader>o "*p

" 操蛋的 q:
nmap q: :q

" 行号
nmap <C-N><C-N> :set invnumber<CR>

" 短语替换
iab xdatetime <C-R>=strftime("%A %b %d, %Y %H:%M")<CR>
iab xdate     <C-R>=strftime("%A %b %d, %Y")<CR>

" 使用 PHP 格式化 JSON
" 384 = JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE
if executable('php')
    command! FormatJson %!php -r "print json_encode(json_decode(stream_get_contents(STDIN)), 384);"
end

" Remap ctrl-c for this issue:
" https://github.com/Shougo/deoplete.nvim/issues/460
if has('nvim')
    inoremap <C-c> <Esc>
endif

" 刷新语法高亮
" autocmd BufEnter * :syntax sync fromstart

" nmap <Leader>f   [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" 载入 vimrc.local
if filereadable(expand('$HOME/.vimrc.local'))
    source $HOME/.vimrc.local
endif
" }}}

" vim: set fdm=marker ff=unix sw=4 ts=4 et:

