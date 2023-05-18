function! CurClassName()
    let pos = getpos(".")
    let curline = pos[1]
    let win = winsaveview()
    let decl = ""
    let startline = search('^\s*\(class\|struct\)\s*\w\+','cbW')
    call search('{','cW')
    sil exe "normal %"
    let endline = line(".")
    if curline >= startline && curline <= endline
        let decl = getline(startline)
    endif
    call cursor(pos)
    call winrestview(win)
    return substitute(decl, '^.*\(class\|struct\)\s\+\(\w\+\).*$', '\2', 'cW')
endfunction

function! CurFileDirName()
    return split(expand('%'), '/')[-2]
endfunction
