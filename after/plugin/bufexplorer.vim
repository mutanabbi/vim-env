if exists("g:bufexplorer_version")
    " Applied functions -->
    function! s:ResetTagToggleState()
        execute "unlet! g:my_buff_explorer_on"
        let l:tab_n = tabpagenr()
        execute "tabdo unlet! t:my_buff_explorer_on"
        call g:GoToTabN(l:tab_n)
    endfunction

    function! s:OpenBufferList()
        execute "topleft split"
        execute "BufExplorer"
        au BufWinLeave \[BufExplorer\] call s:ResetTagToggleState()
        let g:my_buff_explorer_on=1
        let t:my_buff_explorer_on=1
    endfunction

    function! s:CloseBufferList()
        let l:buf_n = bufnr("BufExplorer")
        execute "bd! " . l:buf_n
    endfunction

    function! ToggleBufferList()
        if exists("g:my_buff_explorer_on")
            let s:my_buff_explorer_on = 0
            if exists("t:my_buff_explorer_on")
                let s:my_buff_explorer_on = t:my_buff_explorer_on
            endif
            call s:CloseBufferList()
            if s:my_buff_explorer_on == 0
                call s:OpenBufferList()
            endif
        else
            call s:OpenBufferList()
        endif
    endfunction
    " <-- Applied functions

    let g:bufExplorerShowRelativePath=1

    " Smart buffer list
    imap <F4> <Esc>:call ToggleBufferList()<CR>
    nmap <F4> :call ToggleBufferList()<CR>
endif
