set nocompatible " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'w0rp/ale'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Auto Pairs - Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'
"
Plugin 'Markdown-syntax'
" Comment functions so powerful—no comment necessary.
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'" All of your Plugins must be added before the following line
Plugin  'moll/vim-node'
Plugin 'editorconfig/editorconfig-vim' ".editorconfig support
Plugin 'prettier/vim-prettier'


Plugin 'keith/swift.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
"set encoding=utf-8
"set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set softtabstop=2
set tabstop=2
set shiftwidth=2
set number
set autoindent
set smartindent
set cindent
set paste
:set ai
set hlsearch
set expandtab
syntax on

" Set this variable to 1 to fix files when you save them.
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" Set Linters for different programming languages
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'json': [
\   'jsonlint',
\ ],
\ 'javascript': [
\   'prettier',
\   'eslint'
\ ],
\ 'java': [
\   'javac',
\   'google_java_format'
\ ],
\ 'swift': ['swiftlint']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'json': [
\   'jsonlint',
\ ],
\ 'javascript': [
\   'prettier',
\   'eslint'
\ ],
\ 'java': [
\   'javac',
\   'google_java_format'
\ ],
\ 'swift': ['swiftlint']
\}

filetype plugin on
set omnifunc=syntaxcomplete#Complete
