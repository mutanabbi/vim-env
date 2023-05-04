" 256 colors terminal support
au VimEnter *
        \ if &term == 'xterm'       |
        \   set t_Co=256        |
        \ endif

syntax on
set background=dark

"color ir_black
colorscheme desert
" Ovverride default Comment color from desert scheme
"hi Comment term=bold ctermfg=4 gui=bold guifg=LightBlue guibg=grey30

set history=1000
set laststatus=2 " Always show status line
set hlsearch
set showcmd
set modeline
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set textwidth=0
set nolist
set listchars=tab:\|.,trail:.
set autoindent
set statusline=%<%f%h%m%r\ \ \ \ ff=%{&fileformat}\ fenc=%{&fileencoding}\ enc=%{&encoding}%=%l,%c%V\ %P
set matchpairs+=<:>
set backspace=start,indent,eol

set nocompatible

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_fenced_languages=['cpp', 'sh', 'bash', 'sql', 'java']

" unix only
set fileformats="unix"
:autocmd GUIEnter * set lines=50
:autocmd GUIEnter * set columns=193
hi SpecialKey gui=NONE guifg=#B0B0B0

"Gui options
set guifont=DejaVu\ Sans\ Mono\ 10
"set guifont=Courier\ 9
"set guifont=Monospace\ 8
set guioptions=egt
set encoding=utf-8

"set foldcolumn=5
set foldmethod=syntax
set foldlevel=5
set foldenable
set wrap
set linebreak

set autowrite

" Сделать буфер иксов буфером по-умолчанию для команд vim-а
:set clipboard=unnamed,exclude:cons\\\|linux

:let g:load_doxygen_syntax=1
":let doxygen_javadoc_autobrief=0

:let g:xml_syntax_folding = 1

"mouse enable. You need "vim-with-x" use flag. It on +xterm_clipboard option.
set mouse=a

" автодополнение фигурной скобки (так, как я люблю :)
" используется при nosmartindent
imap {<CR> {<CR>}<Esc>O<Tab>

" автодополнение по Control+Space
imap <C-Space> <C-x><C-o>

nmap + zo
nmap - zc

" @todo I have a troubles with this function. It should be reviewed
" 1. commands with range specificator (like :0,$ToDO) are affected for lines
"    below current only
" 2. It doesn't work correctly for lines as //#ifndef XXX // Some comment
"    The function uncomment such strings
command! -range DoIt :call setline(line("."), vimEnv#A61(line("."), <count>))
" <-- A61

set pastetoggle=<A-Insert>

" Команда записи в файл, с предварительным запросом sudo-пароля
:command! Wsudo set buftype=nowrite | silent execute ':%!sudo tee %' | set buftype= | e! %

"runtime! ftplugin/man.vim

function! s:QfMakeConv()
  let qflist = getqflist()
  for i in qflist
    let i.text = substitute(i.text , "\\[[^m]*m" , "" , "g")
    let file = bufname(i.bufnr)
    if file != -1
      let file = substitute(file , "\\[[^m]*m" , "" , "g")
      bad file
      let i.bufnr = bufnr(file)
    endif
  endfor
endfunction

au! QuickfixCmdPost make call s:QfMakeConv()

" Веселуха
"au BufReadPost *.jpg,*.JPG silent %!jp2a --term-width "%"
au BufReadPost *.pdf silent %!pdftotext "%" - | fmt -csw180
"au BufReadPost *.doc silent %!antiword "%"

" Short (unhuman ;) ) timeout. It's necessary to prevent wrong substitutions
" caused keycodes below are started from <Esc>
set timeout timeoutlen=100 ttimeoutlen=100

"let g:clang_c_options = '-std=c++14 -stdlib=libc++ -Wno-deprecated-declarations'
""let g:clang_cpp_options ='-std=c++14 -stdlib=libc++ -ITARGET/android/arm/debug/include/'
"let g:clang_cpp_options ='-std=c++14 -Wno-deprecated-declarations'
"let g:clang_include_sysheaders=1
"let g:clang_include_sysheaders_from_gcc=1
"let g:clang_auto=0

" javacomplete-2
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

augroup scons_ft
  au!
  autocmd BufNewFile,BufRead SConscript,SConstruct   set syntax=python
augroup END
