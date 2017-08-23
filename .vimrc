"===============================================================
" .vimrc
"===============================================================

" General Defaults
set term=xterm                  " Assume xterm
set t_Co=256                    " Assume 256 color xterm

set spell spelllang=en_us
set mouse=a                     " Enable mouse in terminal
let &t_AB="\e[48;5;%dm"         " Enable Scroll Wheel Up
let &t_AF="\e[38;5;%dm"         " Enable Scroll Wheel Down
let mapleader = ' '             " Make Leader Space Key
set hidden                      " Allow Background Buffers without saving
set splitright                  " Split to right by default
set number                      " Show line numbers
set numberwidth=3               " Set line numbers to 3 digits
set cursorline                  " Set current line highlighted
set sidescroll=1                " Scroll 1 column horizontally
set backspace=indent,eol,start  " Let backspace work over line-breaks, etc.
set nostartofline               " Prevent the cursor from changing colums when moving over lines
set visualbell                  " no sound, just flash the screen
set t_vb=                       " Disable beeping
set clipboard=unnamed           " Copy unnamed to clipboard by defaultd
syntax on                       " Enable Syntax Highlighting
set confirm                     " Confirm close / overwrite

colorscheme hybrid              " Set Hybrid colorscheme

" Command line completion
set wildmenu                    " Enable autocompletion in commands
set wildchar=<Tab>              " Set completion character to Tab
set wildmode=longest:full,full  " Complete first full match, next match, etc.

" Text Wrapping
set nowrap                      " Never wrap text

" Search and Substitute
set incsearch                   " Move to matches as characters are type
set gdefault                    " Use global flag by default in s: commands
set hlsearch                    " Highlight searches
set ignorecase                  " No case sensitive search
set smartcase                   " ... unless there are capitals in searches
nnoremap <leader><space> :nohls <enter> " Disable highlight

" Tabs
set tabstop=2                   " 2 space tabstop
set softtabstop=2               " 2 spaces for each Tab or backspace
set shiftwidth=2                " 2 spaces when shifting selection
set expandtab                   " Replace tabs with spaces
set autoindent                  " Copy indent from current line on a new line
set smartindent                 " Do indents like c

" Backup, Swap and Undo
set undofile                    " Persistent Undo

" Set locations for current, backup, and undo directories
if has("win32")
    set directory=$HOME\vimfiles\swap,$TEMP
    set backupdir=$HOME\vimfiles\backup,$TEMP
    set undodir=$HOME\vimfiles\undo,$TEMP
else
    set directory=~/.vim/swap,/tmp
    set backupdir=~/.vim/backup,/tmp
    set undodir=~/.vim/undo,/tmp
endif

filetype off                    " Turn off before vundle init

" When first installing, manually clone the vundle repo...
" $ mkdir ~/.vim/bundle
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " Let Vundle manage Vundle, required

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
Plugin 'elzr/vim-json'
Plugin 'honza/vim-snippets'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdTree'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" see :h vundle for more details or wiki for FAQ

let mapleader="\ "

" Path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'

" NERDTree Settings
nmap <leader>/ :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Airline Settings
let g:airline_theme='powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Airline unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" Better key bindings for UltiSnips ExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" Ctrl-P
let g:ctrlp_cmd = 'CtrlPMixed'

" Prevent vimjson from concealing characters
let g:vim_json_syntax_conceal = 0

" Quick Exit
noremap <C-x> :q <enter>

" Remap movement to move by column layout
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Buffers
noremap <Leader><Tab> :buffers<CR>:buffer<Space>
nnoremap <C-H> :bp <enter>
nnoremap <C-L> :bn <enter>
nnoremap <Leader>w :w <enter>
nnoremap <Leader>q :bd <enter>

" Move through grep results
map [q :cprevious<CR>
map ]q :cnext<CR>
map [Q :cfirst<CR>
map ]Q :clast<CR>

" vim-move mapppings
let g:move_map_keys = 0
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp

" Move function params or any other
" comma-delimited items left or right
nnoremap <Leader>h :SidewaysLeft<cr>
nnoremap <Leader>l :SidewaysRight<cr>

" Shorten delay when leaving a mode with escape
set timeoutlen=1000 ttimeoutlen=10

" Search & replace word under cursor
noremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Insert line(s) above/below
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Folding
set foldmethod=syntax

" Unfold all by default
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" Auto load vimrc changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Turn on wrap for txt files
au BufNewFile,BufRead *.txt set wrap

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

