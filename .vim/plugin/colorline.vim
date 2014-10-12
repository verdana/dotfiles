
" Load plugin only once
if exists('g:colorline_loaded')
    finish
endif
let g:colorline_loaded = 1

" Return if no statusline
if !has('statusline')
    finish
endif

" always show statusline
set laststatus=2

" 定义颜色群组
autocmd ColorScheme * hi User1 ctermbg=darkred      ctermfg=white  guibg=darkred      guifg=white
autocmd ColorScheme * hi User2 ctermbg=yellow       ctermfg=white  guibg=yellow       guifg=white
autocmd ColorScheme * hi User3 ctermbg=black        ctermfg=white  guibg=black        guifg=white
autocmd ColorScheme * hi User4 ctermbg=darkcyan     ctermfg=white  guibg=darkcyan     guifg=white
autocmd ColorScheme * hi User5 ctermbg=darkmagenta  ctermfg=white  guibg=darkmagenta  guifg=white

function! GetMode()
    let m = mode()
    if m == "n"
        return "NORMAL"
    elseif m == "i"
        return "INSERT"
    elseif m ==# "v"
        return "VISUAL"
    elseif m ==# "V"
        return "VISUAL LINE"
    elseif m == "\<C-V>"
        return "VISUAL BLOCK"
    elseif m == "c"
        return "SEARCH"
    elseif m == "R"
        return "REPLACE"
    endif
endfunc

function! s:UpdateStatusline()
    " 获取模式名称
    set statusline=%1*
    set statusline+=\ %{GetMode()}

    " 文件状态（只读，修改.. 等等）
    set statusline+=\ %2*
    set statusline+=\ %w%h%m%r

    " 文件路径
    set statusline+=\ %<%F

    " 文件格式和类型
    set statusline+=\ %3*
    set statusline+=%=\ [%{&ff}%{(&ft=='')?'':'-'.&ft}]

    " 文件编码
    set statusline+=%=\ [%{(&fenc=='')?&enc:&fenc}%{(&bomb?'\ \ BOM':'')}]

    " Right aligned ASCII / Hexadecimal value of char
    set statusline+=%=\ [A=\%03.3b\ H=\%02.2B]

    " Percentage through file in lines
    set statusline+=\ %4*
    set statusline+=%=\ %p%%

    " 光标位置
    set statusline+=\ %5*
    set statusline+=%=\ %-12.(%l,%c%V%)
endfunc

call <SID>UpdateStatusline()

" 重设 colorscheme 使颜色生效
set background=dark
try | colorscheme solarized | catch | colorscheme desert | endtry

" vim: set ff=unix shiftwidth=4 tabstop=4 expandtab:

