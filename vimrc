"
" Settings
"
syntax on

" maps `jk` to escape key - must be pressed quickly
imap jk <Esc>

set clipboard=unnamed

set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup					          " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=120
set relativenumber
"set norelativenumber

set autoindent
set complete-=i
set showmatch
set smarttab

set et
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <Leader>wq :wq<cr>

" Moving betweent tabs
nnoremap H gT
nnoremap L gt

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Move lines/blocks
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" ============== Plugs======================
call plug#begin("~/.vim/plugged")
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'ekalinin/Dockerfile.vim'
Plug 'godlygeek/tabular'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

" ---- Tags ----
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" ---- Language Server ----
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


" ---- Git stuff ----
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Colors
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'w0ng/vim-hybrid'
Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()

" =================== color ======================
colorscheme nord

" ==================== fzf =======================
" Using floating windows of Neovim to start fzf

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

nmap <Leader>rg :Rg<cr>
nmap <Leader>f :Files<cr>
nnoremap <silent> <Leader>F :Rg <C-R><C-W><CR>

let g:fzf_action = {
  \ 'ctrl-m': 'tabedit',
  \ 'ctrl-e': 'edit',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-s': 'split',
  \ 'ctrl-r': 'read',
\}

" ==================== Vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_def_mode = "gopls"
let g:go_rename_mode = "gopls"
let g:go_bin_path = $HOME."/go/bin"
let $GOPATH = $HOME."/go"

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>d <Plug>(go-def)

au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <leader>gr  <Plug>(go-run)
au FileType go nmap <leader>gb  <Plug>(go-build)
au FileType go nmap <leader>gt  <Plug>(go-test)
au FileType go nmap <leader>gtc  <Plug>(go-test-compile)
au FileType go nmap <Leader>gdoc <Plug>(go-doc)
au FileType go nmap <Leader>e <Plug>(go-rename)

" ===== jistr/vim=nerdtree=tabs ========================
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" =================== vim-airline ========================

let g:airline_theme='solarized'

" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")
if !g:remoteSession
  let g:airline_powerline_fonts=1
endif

" ========= vim-better-whitespace ==================

" auto strip whitespace except for file with extention blacklisted
let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace

" ===== Raimondi/delimitMate settings =====
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ===== airblade/vim=gitgutter settings =====
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
inoremap <silent> <buffer> <C-g><C-o> <C-x><C-o>

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
