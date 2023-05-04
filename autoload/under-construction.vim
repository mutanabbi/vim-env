" function! s:CheckOtherInstances(filename)
"     let l:ps_list = system("ps h -eo comm,pid | awk '$1==\"vim\" && $2 !=". getpid() ." {print $2}'")
"     let l:slist = split(l:ps_list, "\n")
"     let l:result_list = []
"     for l:i in l:slist
"         let l:matches = system("lsof -Fn -p ". l:i ." | grep -F '". a:filename ."'")
"         " \todo assert(Only one result string)
"         if len(l:matches)
"             call add(l:result_list, l:i)
"         endif
"     endfor
"     return l:result_list
" endfunction

" function! s:ShowSwapDiff()
"     if !exists("s:file4swap_diff")
"         return
"     endif
" 
"     if empty(s:file4swap_diff) || fnamemodify(getreg("%"), ":p") != s:file4swap_diff
"         return
"     endif
"     let s:file4swap_diff = ""
"     vert new
"     set bt=nofile
"     r #
"     0d_
"     diffthis
"     wincmd p
"     diffthis
" endfunction

" function! s:DoSwapExists()
"     let l:filename = fnamemodify(getreg("%"), ":p")
"     let l:instances = s:CheckOtherInstances(l:filename)
"     if ! empty(l:instances)
"         echo "File ". getreg("%") ." already in use. Readonly mode"
"         let v:swapchoice="o"
"     else
"         let s:file4swap_diff = l:filename
"         let v:swapchoice="r"
"     endif
" "    call s:ShowSwapDiff()
"     """""""""""
" "    let l:instances = s:CheckOtherInstances(v:swapname)
" "    echo "Looking for ". v:swapname ." : ". v:fname_in ." : ". v:fname_out ." : ". v:fname_new ." : ". v:fname_diff ." : ". getreg("%")
" "    if empty(l:instances)
" ""        echo l:instances
" ""        echo "Ok. Trying to process"
" "    else
" "        echoe "There are an other instances of Vim worked with ". v:swapname ." file: ". l:instances
" "    endif
" "    sleep 2
" endfunction

" function! s:DoBufRead()
"     if &readonly
"         return
"     endif
"     " echo "Looking for ". getreg("%")
"     " sleep 2
"     let l:instances = s:CheckOtherInstances(getreg("%"))
"     echo l:instances
"     sleep 2
"     if ! empty(l:instances)
"         echo "File ". getreg("%") ." already in use. Readonly mode"
"         sleep 2
"         set readonly
"     endif
" endfunction

" Swap diff
"command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"
"au BufEnter * call s:ShowSwapDiff()
"au SwapExists * call s:DoSwapExists()

"au BufRead * call s:DoBufRead()

" поддержка vimspell
"runtime! plugin/vimspell.vim
"setlocal spell spelllang=en,ru
"if exists("loaded_vimspell") && executable("aspell")
"    highlight SpellErrors ctermfg=red cterm=underline term=reverse
"    let spell_executable = "aspell"
"    let spell_language_list = "ru,en"
"    let spell_auto_type = "txt,mail,text"
"    let spell_guess_language_ft = "txt,mail,text"
"    let spell_insert_mode = 1
"    nmap \sr :SpellSetLanguage ru<CR>
"    nmap \se :SpellSetLanguage en<CR>
"        " vim -b : edit binary using xxd-format!
"        augroup Binary
"          au!
"          au BufReadPre  *.bin let &bin=1
"          au BufReadPost *.bin if &bin | %!xxd
"          au BufReadPost *.bin set ft=xxd | endif
"          au BufWritePre *.bin if &bin | %!xxd -r
"          au BufWritePre *.bin endif
"          au BufWritePost *.bin if &bin | %!xxd
"          au BufWritePost *.bin set nomod | endif
"        augroup END
"endif


"""""""
"" OMNI
"""""""
""set ofu=syntaxcomplete#Complete
"filetype plugin on
"" Already oncompatible. Command below reset showcmd
""set nocp
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 0 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
"
"" Omni дополнение по Ctrl+пробел
"inoremap <C-space> <C-x><C-o>

"augroup Binary
"  au!
"  au BufReadPre   *.dat let &bin=1
"  au BufReadPost  *.dat if &bin | %!xxd
"  au BufReadPost  *.dat set ft=xxd | endif
"  au BufWritePre  *.dat if &bin | %!xxd -r
"  au BufWritePre  *.dat endif
"  au BufWritePost *.dat  if &bin | %!xxd
"  au BufWritePost *.dat  set nomod | endif
"augroup END

