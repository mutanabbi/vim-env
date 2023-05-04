if exists("g:loaded_alternateFile")
    let g:alternateExtensions_h = "cc,cpp,cxx,c,C,CC"
    let g:alternateExtensions_C = "h,hh,hpp,H"
    let g:alternateExtensions_cc = "hh,h,hpp,H"
    let g:alternateExtensions_hh = "cc,cpp,cxx,c,C,CC"
    let g:alternateExtensions_hpp = "cpp,cc,cxx,c,C,CC"
    let g:alternateExtensions_cpp = "hpp,hh,h,H"

    " переключение с хедера на исходник и обратно (с вертикальным сплитом)
    imap <F11> <Esc>:AV<CR>
    nmap <F11> :AV<CR>
    " переключение с хедера на исходник и обратно (с горизонтальным сплитом)
    "imap <S-F11> <Esc>:AS<CR>
    "nmap <S-F11> :AS<CR>

    " переключение с хедера на исходник и обратно (в отдельный таб)
    imap <A-F11> <Esc>:AT<CR>
    nmap <A-F11> :AT<CR>
endif
