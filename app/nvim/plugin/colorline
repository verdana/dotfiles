
" 仅载入一次本插件
if exists('g:colorline_loaded')
    finish
endif
let g:colorline_loaded = 1

" 如果不支持状态栏，那么立即退出
if !has('statusline')
    finish
endif

" 总是显示状态栏
set laststatus=2

" 当前的编辑模式
function! GetMode()
    let m = mode()
    if m == "n"
        return "NORMAL"
    elseif m == "i"
        return "INSERT"
    elseif m ==# "v"
        return "VISUAL"
    elseif m ==# "V"
        return "V-LINE"
    elseif m == "\<C-V>"
        return "V-BLOCK"
    elseif m == "c"
        return "SEARCH"
    elseif m == "R"
        return "REPLACE"
    endif
endfunc

" 定义状态栏的格式
function! s:UpdateStatusline()
    " 获取模式名称
    set statusline=%1*
    set statusline+=\ %12.12{GetMode()}

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
    set statusline+=%=\ [asc=\%04.4b\ hex=\%04.4B]

    " Percentage through file in lines
    set statusline+=\ %4*
    set statusline+=%=\ %-3.3p%%

    " 光标位置
    set statusline+=\ %5*
    set statusline+=%=\ %-15.15(%l,%c%V%)
endfunc
call <SID>UpdateStatusline()

" 定义颜色群组
function! s:Highlight()
    hi User1 ctermbg=darkred    ctermfg=white  guibg=#FA2673    guifg=#D9D9D9
    hi User2 ctermbg=yellow     ctermfg=white  guibg=#FA961E    guifg=#D9D9D9
    hi User3 ctermbg=black      ctermfg=white  guibg=#49483E    guifg=#D9D9D9
    hi User4 ctermbg=cyan       ctermfg=white  guibg=#5F7175    guifg=#D9D9D9
    hi User5 ctermbg=magenta    ctermfg=white  guibg=#9D6EFF    guifg=#D9D9D9
endfunc

" 为状态栏染色
augroup colorline
    autocmd!
    autocmd ColorScheme * call <SID>Highlight()
augroup end
call <SID>Highlight()

" vim: set ff=unix shiftwidth=4 tabstop=4 expandtab:

