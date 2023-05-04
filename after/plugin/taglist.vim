if exists("g:loaded_taglist")
    let tlist_cpp_settings = 'c++;n:namespace;d:macros;t:typedef;e:enum;s:struct;c:class;m:member;f:function;v:variable'
    let Tlist_Auto_Open = 0
    let Tlist_Enable_Fold_Column = 0
    let Tlist_File_Fold_Auto_Close = 1
    let Tlist_Show_One_File = 1
    "
    " боковая панель тагов
    imap <F3> <Esc>:TlistToggle<CR>a
    nmap <F3> :TlistToggle<CR>
endif
