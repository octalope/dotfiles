"===============================================================
" .vimrc
"===============================================================

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme hybrid

" turn on syntax highlighting
syntax on

" not vi
set nocompatible

" Turn off before vundle init
filetype off

" When first installing, manually clone the vundle repo...
" $ mkdir ~/.vim/bundle
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Other plugins
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'matze/vim-move'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'bkad/CamelCaseMotion'
Plugin 'elzr/vim-json'
Plugin 'honza/vim-snippets'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdTree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" see :h vundle for more details or wiki for FAQ

let mapleader="\ "

" NERDTree Settings
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Airline Settings
"let g:airline_theme='molokai'
"let g:airline_theme='term'
"let g:airline_theme='dark'
"let g:airline_theme='wombat'
let g:airline_theme='powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'

" prevent vimjson from concealing characters
let g:vim_json_syntax_conceal = 0

" CamelCase motion
call camelcasemotion#CreateMotionMappings('<leader>')
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" highlight the current editor line
set cursorline

" don't wrap text
set nowrap

" display the status line
set laststatus=2

" don't show mode in the status line
set noshowmode

" display the row, col in the status bar
set ruler

set confirm
" convert tabs to spaces
set expandtab

" number of characters to shift with '>' or '<'
set shiftwidth=2

" number of columns per tab
set tabstop=2

" better indentions
set smartindent

" show line numbers
set number

" show 3 digit line numbers
set numberwidth=3

" commandline completion
set wildmenu
set wildchar=<Tab>
set wildmode=longest:full,full
set wildcharm=<C-Z>

" scroll horizontally by single chars
set sidescroll=1

" show information in the bottom line
set showcmd

" highlight all search matches
set hlsearch
" space to turn off highlighting
:nnoremap <silent> <leader>mc :nohlsearch<Bar>:echo<CR>

" start searching with each typed character
set incsearch

" case insensitive searches
set ignorecase

" if an uppercase letter is typed in search, then case matters
set smartcase

" let backspace work over line-breaks, etc.
set backspace=indent,eol,start

" prevent the cursor from changing colums when moving over lines
set nostartofline

" no sound, just flash the screen
set visualbell

" disable beeping
set t_vb=

"enable mouse in terminal
set mouse=a

" Copy unnamed to clipboard by default
set clipboard=unnamed

" turn on wrap for txt files
au BufNewFile,BufRead *.txt set wrap

" remap movement to move by column layout
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Strips whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>" tab key bindings

" Tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap shiftwidthm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Buffers
noremap <Leader><Tab> :buffers<CR>:buffer<Space>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>

" Folding
set foldmethod=syntax
" Unfold all by default
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" auto load vimrc changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" enable markdown for .md files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Jump to last cursor position
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Don't jump to last position in git commit
augroup gitCommitEditMsg
  autocmd!
  autocmd BufReadPost *
    \ if @% == '.git/COMMIT_EDITMSG' |
    \   exe "normal gg" |
    \ endif
augroup END

" toggle spellcheck
map <F7> :setlocal spell! spelllang=en_us<CR>

" move through grep results
map [q :cprevious<CR>
map ]q :cnext<CR>
map [Q :cfirst<CR>
map ]Q :clast<CR>

" Toggle Line WRAP
map <Leader>w :set wrap!<CR>

" vim-move mapppings
let g:move_map_keys = 0
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp

" Move function params or any other
" comma-delimited items left or right
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" shorten delay when leaving a mode with escape
set timeoutlen=1000 ttimeoutlen=10

" search & replace word under cursor
noremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Insert line(s) above/below
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

