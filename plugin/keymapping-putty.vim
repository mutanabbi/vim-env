" MapFastKeycode: helper for fast keycode mappings
" makes use of unused vim keycodes <[S-]F15> to <[S-]F37>
function! <SID>MapFastKeycode(key, keycode)
    if s:fast_i == 46
        echohl WarningMsg
        echomsg "Unable to map ".a:key.": out of spare keycodes"
        echohl None
        return
    endif
    let vkeycode = '<'.(s:fast_i/23==0 ? '' : 'S-').'F'.(15+s:fast_i%23).'>'
    exec 'set '.vkeycode.'='.a:keycode
    exec 'map '.vkeycode.' '.a:key
    exec 'map! '.vkeycode.' '.a:key
    let s:fast_i += 1
endfunction
let s:fast_i = 0

"""""""""""""""""""""""""
" Fast bindings For PUTTY
"""""""""""""""""""""""""
" Alt Functional keys
call <SID>MapFastKeycode('<A-F1>', "OP")
call <SID>MapFastKeycode('<A-F2>', "OQ")
call <SID>MapFastKeycode('<A-F3>', "OR")
" <A-F4> can't be used because it cause window closing
call <SID>MapFastKeycode('<A-F5>', "[15~")
call <SID>MapFastKeycode('<A-F6>', "[17~")
call <SID>MapFastKeycode('<A-F7>', "[18~")
call <SID>MapFastKeycode('<A-F8>', "[19~")
call <SID>MapFastKeycode('<A-F9>', "[20~")
call <SID>MapFastKeycode('<A-F10>', "[21~")
call <SID>MapFastKeycode('<A-F11>', "[23~")
call <SID>MapFastKeycode('<A-F12>', "[24~")


" Alt + Shift + Functional keys
call <SID>MapFastKeycode('<A-S-F3>', "[25~")
" <A-S-F4> can't be used because it cause window closing also
call <SID>MapFastKeycode('<A-S-F5>', "[28~")
call <SID>MapFastKeycode('<A-S-F6>', "[29~")
call <SID>MapFastKeycode('<A-S-F7>', "[31~")
call <SID>MapFastKeycode('<A-S-F8>', "[32~")
call <SID>MapFastKeycode('<A-S-F9>', "[33~")
call <SID>MapFastKeycode('<A-S-F10>', "[34~")
" codes of <A-S-F11> and <A-S-F12> are similar to <A-F1> and <A-F2>
" so we drop it cause second pair are more important


" Alt + Arrows
call <SID>MapFastKeycode('<A-Up>', "OA")
call <SID>MapFastKeycode('<A-Down>', "OB")
call <SID>MapFastKeycode('<A-Right>', "OC")
call <SID>MapFastKeycode('<A-Left>', "OD")

" Alt + Ctrl Arrows
call <SID>MapFastKeycode('<A-C-Up>', "[A")
call <SID>MapFastKeycode('<A-C-Down>', "[B")
call <SID>MapFastKeycode('<A-C-Right>', "[C")
call <SID>MapFastKeycode('<A-C-Left>', "[D")

" Ctrl + Arrows
call <SID>MapFastKeycode('<C-Up>', "[A")
call <SID>MapFastKeycode('<C-Down>', "[B")
call <SID>MapFastKeycode('<C-Right>', "[C")
call <SID>MapFastKeycode('<C-Left>', "[D")

" Shift + Functional keys
" It's sad but <S-F11> and <S-F12> generate same codes like <S-F1> and <S-F2>
" Much more <F11> and <F12> have absolutely same codes.
" So we have only <S-F3>-<S-F10> shortcuts
set <Undo>="" " By default it's equel <S-F4>
set <S-F3>=[25~
set <S-F4>=[26~
set <S-F5>=[28~
set <S-F6>=[29~
set <S-F7>=[31~
set <S-F8>=[32~
set <S-F9>=[33~
set <S-F10>=[34~

call <SID>MapFastKeycode('<A-Insert>', "[2~")
call <SID>MapFastKeycode('<C-Space>', "^@")


"""""""""""""""""""""""""""""""""""""""""""""""
" Direct (slow but workable) bindings for PUTTY
"""""""""""""""""""""""""""""""""""""""""""""""
" Alt Functional keys
" map <Esc><Esc>OP <A-F1>
" map <Esc><Esc>OQ <A-F2>
" map <Esc><Esc>OR <A-F3>
" map <Esc><Esc>[15~ <A-F5>
" map <Esc><Esc>[17~ <A-F6>
" map <Esc><Esc>[18~ <A-F7>
" map <Esc><Esc>[19~ <A-F8>
" map <Esc><Esc>[20~ <A-F9>
" map <Esc><Esc>[21~ <A-F10>
" map <Esc><Esc>[23~ <A-F11>
" map <Esc><Esc>[24~ <A-F12>

" Alt + Shift + Functional keys
" map <Esc><Esc>[25~ <A-S-F3>
" map <Esc><Esc>[28~ <A-S-F5>
" map <Esc><Esc>[29~ <A-S-F6>
" map <Esc><Esc>[31~ <A-S-F7>
" map <Esc><Esc>[32~ <A-S-F8>
" map <Esc><Esc>[33~ <A-S-F9>
" map <Esc><Esc>[34~ <A-S-F10>

" Alt + Arrows
" map <Esc><Esc>OA <A-Up>
" map <Esc><Esc>OB <A-Down>
" map <Esc><Esc>OC <A-Right>
" map <Esc><Esc>OD <A-Left>

" Just for testing
"map <A-Up> <Esc>:tabnew<CR>
"map <A-Down> <Esc>:tabclose<CR>
"map <A-Left> <Esc>:tabprev<CR>
"map <A-Right> <Esc>:tabnext<CR>

" Ctrl + Arrows
" map <Esc>[A <C-Up>
" map <Esc>[B <C-Down>
" map <Esc>[C <C-Right>
" map <Esc>[D <C-Left>
