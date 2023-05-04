" вкл/выкл подсветки длинных строк
imap <F1> <Esc>:call s:ToggleLongLineHighlighting()<CR>a
nmap <F1> :call s:ToggleLongLineHighlighting()<CR>

" вкл/выкл отображения номеров строк
imap <A-F1> <Esc>:set<Space>nu!<CR>a
nmap <A-F1> :set<Space>nu!<CR>

" сохранение текущего буфера
imap <F2> <Esc>:w<CR>a
nmap <F2> :w<CR>

" вкл/выкл отображения уровня вкладок
imap <A-F3> <Esc>:call s:ToggleFoldLevelBar()<CR>a
nmap <A-F3> :call s:ToggleFoldLevelBar()<CR>

" вкл/выкл отображения найденных соответствий
imap <S-F3> <Esc>:set<Space>hls!<CR>a
nmap <S-F3> :set<Space>hls!<CR>

" сохранение всех буферов
"imap <S-F2> <Esc>:wa<CR>a
"nmap <S-F2> :wa<CR>

" Plain buffer list (could be overriden by after/plugin/bufexplorer)
imap <F4> <Esc>:ls<CR>
nmap <F4> <Esc>:ls<CR>

"imap <S-F3> <Esc>:buffers<CR>
"nmap <S-F3> :buffers<CR>

" закрыть буфер
"imap <C-F3> <Esc>:bd<CR>a
"nmap <C-F3> :bd<CR>

" открыть буфер
"imap <F3> <Esc>:e<Space>
"nmap <F3> :e<Space>

""""""""""""""""""""""""""""""""""
" Навигация по буферам стрелочками
""""""""""""""""""""""""""""""""""
" следующий буфер
imap <A-Up> <Esc>:bn!<CR>a
nmap <A-Up> :bn!<CR>
" предыдущий буфер
imap <A-Down> <Esc>:bp!<CR>a
nmap <A-Down> :bp!<CR>

""""""""""""""""""""""""""""""""
" Навигация по окнам стрелочками
""""""""""""""""""""""""""""""""
" окно ниже
imap <C-Down> <Esc><C-W>ja
nmap <C-Down> <C-W>j
" окно выше
imap <C-Up> <Esc><C-W>ka
nmap <C-Up> <C-W>k
" окно левее
imap <C-Left> <Esc><C-W>ha
nmap <C-left> <C-W>h
" окно правее
imap <C-Right> <Esc><C-W>la
nmap <C-Right> <C-W>l

" окно ниже и развернуть
imap <A-C-Down> <Esc><C-W>j<C-W>_a
nmap <A-C-Down> <C-W>j<C-W>_
" окно выше и развернуть
imap <A-C-Up> <Esc><C-W>k<C-W>_a
nmap <A-C-Up> <C-W>k<C-W>_
" окно левее и развернуть
imap <A-C-Left> <Esc><C-W>h<C-W>\|a
nmap <A-C-Left> <C-W>h<C-W>\|
" окно правее и развернуть
imap <A-C-Right> <Esc><C-W>l<C-W>\|a
nmap <A-C-Right> <C-W>l<C-W>\|

""""""""""""""""""""""
" Навигация по буферам
""""""""""""""""""""""
" следующий буфер
imap <F5> <Esc>:bn!<CR>a
nmap <F5> :bn!<CR>
" предыдущий буфер
imap <F6> <Esc>:bp!<CR>a
nmap <F6> :bp!<CR>
" следующий буфер в новом табе
imap <A-F6> <Esc>:tab split<CR>:bn!<CR>a
nmap <A-F6> <Esc>:tab split<CR>:bn!<CR>
" предыдущий буфер в новом табе
imap <A-F5> <Esc>:tab split<CR>:bp!<CR>a
nmap <A-F5> <Esc>:tab split<CR>:bp!<CR>

""""""""""""""""""""
" Навигация по окнам
""""""""""""""""""""
" окно ниже
imap <F7> <Esc><C-W>ja
nmap <F7> <C-W>j
" окно выше
imap <F8> <Esc><C-W>ka
nmap <F8> <C-W>k
" окно ниже и развернуть
imap <S-F7> <Esc><C-W>j<C-W>_a
nmap <S-F7> <C-W>j<C-W>_
" окно выше и развернуть
imap <S-F8> <Esc><C-W>k<C-W>_a
nmap <S-F8> <C-W>k<C-W>_
" окно левее
imap <A-F7> <Esc><C-W>ha
nmap <A-F7> <C-W>h
" окно правее
imap <A-F8> <Esc><C-W>la
nmap <A-F8> <C-W>l
" окно левее и развернуть
imap <A-S-F7> <Esc><C-W>h<C-W>\|a
nmap <A-S-F7> <C-W>h<C-W>\|
" окно правее и развернуть
imap <A-S-F8> <Esc><C-W>l<C-W>\|a
nmap <A-S-F8> <C-W>l<C-W>\|

" сборка с сохранением
imap <F9> <Esc>:wa<CR>:make<CR>
nmap <F9> :wa<CR>:make<CR>

" пересборка с сохранением
imap <A-F9> <Esc>:wa<CR>:make!<Space>clean<CR>:make<CR>
nmap <A-F9> :wa<CR>:make!<Space>clean<CR>:make<CR>

" сборка с в новом табе с переходом на ошибку
imap <S-F9> <Esc>:wa<CR>:tabnew<CR>:make<CR>
nmap <S-F9> :wa<CR>:tabnew<CR>:make<CR>

" открыть окно результатов компиляции
imap <F10> <Esc>:call s:ToggleCompileErrorsWindow()<CR>
nmap <F10> :call s:ToggleCompileErrorsWindow()<CR>

" следующая ошибка
imap <A-F10> <Esc>:cn<CR>i
nmap <A-F10> :cn<CR>

" предыдущая ошибка
imap <S-F10> <Esc>:cp<CR>i
nmap <S-F10> :cp<CR>

" выход
imap <F12> <Esc>:qa<CR>
nmap <F12> :qa<CR>
" выход с запросом сохранения
imap <A-F12> <Esc>:conf qa<CR>
nmap <A-F12> :conf qa<CR>

" навигация по табам
imap <A-Right> <Esc>:tabnext<CR>a
nmap <A-Right> :tabnext<CR>
imap <A-Left> <Esc>:tabprev<CR>a
nmap <A-Left> :tabprev<CR>
