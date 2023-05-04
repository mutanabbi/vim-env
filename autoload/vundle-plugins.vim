set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/snipMate'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'majutsushi/tagbar'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'udalov/kotlin-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'uiiaoo/java-syntax.vim'
" Switch between buffers
Plugin 'jlanzarotta/bufexplorer'
" Commands to swtich between source files and header files
Plugin 'vim-scripts/a.vim'
" Highlights and sets error markers for lines with compile errors
Plugin 'mh21/errormarker.vim'
" Commands to comment programming languages code
Plugin 'preservim/nerdcommenter'
" Side pannel of tags
Plugin 'vim-scripts/taglist.vim'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"Plugin 'justmao945/vim-clang'
"Plugin 'jeaye/color_coded'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'rust-lang/rust.vim'
"Plugin 'vim-scripts/hexman.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
