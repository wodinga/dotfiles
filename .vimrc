set nocompatible " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"let g:ale_completion_enabled = 1
"Plugin 'w0rp/ale'
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} " Linting, auto-completion. Might work better than ALE
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'editorconfig/editorconfig-vim' ".editorconfig support
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
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" Comment functions so powerful—no comment necessary.
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'mechatroner/rainbow_csv'
Plugin 'Xuyuanp/nerdtree-git-plugin' "Git Integration for NERDTree"
Plugin 'pangloss/vim-javascript' "Javascript
Plugin 'leafgarland/typescript-vim' " typescript
Plugin 'MaxMEllon/vim-jsx-pretty' " JSX
"Plugin 'peitalin/vim-jsx-typscript' " TSX
Plugin 'styled-components/vim-styled-components' " highlights CSS inside the styled and css template strings
Plugin 'moll/vim-node'
Plugin 'prettier/vim-prettier'
"Plugin 'jparise/vim-graphql' " GraphQL syntax highlighting
"Plugin 'apple/swift', {'rtp': 'utils/vim/', 'name' : 'Swift-Syntax'}
Plugin 'dracula/vim', { 'name': 'dracula' }
" All of your Plugins must be added before the following line
call vundle#end()            " required
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


" Vim preferences
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
set relativenumber
set smartindent
set paste
set hlsearch
set expandtab
set autoread " Should auto-reload the file in many cases"
set omnifunc=syntaxcomplete#Complete
syntax on

" ALE (Linting, hopefully autocomplete)
" Set this variable to 1 to fix files when you save them.
"let g:ale_linters_explicit = 1
"let g:ale_fix_on_save = 1
"let g:ale_linter_aliases = {'node': ['javascript','javascriptreact','typescript','javascript', 'typescriptreact']}


" Set Linters for different programming languages
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\ 'json': [
"\   'jsonlint',
"\ ],
"\ 'javascript': [
"\   'eslint',
"\   'tsserver'
"\ ],
"\ 'typescriptreact': [
"\   'eslint',
"\   'tsserver'
"\ ],
"\ 'python': [
"\   'pylint',
"\ ],
"\ 'java': [
"\   'javac',
"\   'google_java_format'
"\ ],
"\ 'swift': ['swiftlint']
"\}
"
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\ 'json': [
"\   'jsonlint',
"\ ],
"\ 'javascript': [
"\   'eslint',
"\   'tsserver'
"\ ],
"\ 'typescriptreact': [
"\   'eslint',
"\   'tsserver'
"\ ],
"\ 'java': [
"\   'javac',
"\   'google_java_format'
"\ ],
"\}
"
" CoC rules
" I got these from https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ 'coc-java',
  \ 'coc-eslint',
  \ 'coc-jest',
  \ 'coc-sourcekit',
  \ 'coc-tsserver'
  \ ]
" Optionally load prettier or ESLint rules
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR> " show docs for file?

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

""""""""""""""""""""

filetype on
filetype plugin on
filetype plugin indent on    " required
colorscheme dracula

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" NERDTree Settings
" Copied from: https://techinscribed.com/how-to-set-up-vim-as-an-ide-for-react-and-typescript-in-2020/

autocmd VimEnter * NERDTree "Open NerdTree by Default
autocmd VimEnter * wincmd p " Set focus to the editor (as opposed NERDTree after opening)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "AutoClose NerdTree

" Map completion to tab button
inoremap <silent><expr> <C-TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
