" Get a focus to tab with `num` number
" It's strage, but Vim doesn't have internal command with same functionality
function! vimEnv#GoToTabN(num)
    execute "tabfirst"
    for i in range(2, a:num)
        execute "tabnext"
    endfor
endfunction

" --> Toggle compile errors window
function! vimEnv#ToggleFoldLevelBar()
    if exists("s:fold_level_bar_enabled")
        set foldcolumn=0
        echo "Disable fold level bar"
        unlet s:fold_level_bar_enabled
    else
        echo "Enable fold level bar"
        set foldcolumn=5
        let s:fold_level_bar_enabled=1
    endif
endfunction

function! vimEnv#ToggleCompileErrorsWindow()
    if exists("g:compile_errors_window_enabled")
        echo "Disable compile errors window"
        unlet! g:compile_errors_window_enabled
        let l:tab_n = tabpagenr()
        tabdo cclose
        call g:GoToTabN(l:tab_n)
    else
        echo "Enable compile errors window"
        let l:tab_n = tabpagenr()
        tabdo botright copen
        call g:GoToTabN(l:tab_n)
        au BufLeave <buffer> set nocursorline
        au BufEnter <buffer> set cursorline
        let l:buf_n = bufnr("[Quickfix List]")
        " execute "au BufWinLeave <buffer=" . l:buf_n . "> unlet s:compile_errors_window_enabled"
        " execute "au BufWinLeave <buffer=" . l:buf_n . "> echo "Ilya"
        set cursorline
        let g:compile_errors_window_enabled = 1
    endif
endfunction
" <-- Toggle compile errors window

function! vimEnv#ToggleLongLineHighlighting()
    if exists("w:m2")
        echo "Disable long line highlighting"
        call matchdelete(w:m2)
        unlet w:m2
    else
        echo "Enable long line highlighting"
        "au BufWinEnter *.{c,cc,cpp,h,hh,hpp}
        "let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
        "au BufWinEnter *.{c,cc,cpp,h,hh,hpp}
        "let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
        let w:position=exists("g:longLineHighlightingPosition") ? g:longLineHighlightingPosition : 80
        let w:m2=matchadd('Search', '\%>' . w:position . 'v.\+', -1)
    endif
    if &g:list
        set nolist
    else
        set list
    endif
endfunction

" A61 -->
function! s:A61impl(line)
    let s:line = a:line
    if &filetype == "python"
        let s:delim = "#"
    else
        let s:delim = "//"
    endif
    let s:splist = split(s:line, " *".s:delim)
    if len(s:splist) > 1 && len(s:splist[0]) < 60
        let s:blank = ""
        for i in range(60 - len(s:splist[0]))
            let s:blank .= " "
        endfor
        let s:line = s:splist[0].s:blank
        for s:i in s:splist[1:]
            let s:line .= s:delim
            let s:line .= s:i
        endfor
    endif
    return s:line
endfunction

function! vimEnv#A61(idx, range)
    let s:result = []
    let s:range = 1
    if a:range != -1
        let s:range = a:range
    endif
    for s:idx in range(s:range)
        let s:line = getline(a:idx + s:idx)
        let s:result += [s:A61impl(s:line)]
    endfor
    return s:result
endfunction

