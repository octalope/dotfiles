if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl --insecure -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

silent! call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'othree/yajs.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/CSApprox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jaredgorski/spacecamp'
Plug 'jacoborus/tender.vim'
Plug 'github/copilot.vim'

" Initialize plugin system
call plug#end()

set term=xterm                  " Assume xterm
set t_Co=256                    " Assume 256 color xterm
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

if (has("termguicolors"))
  set termguicolors
endif

" colorscheme hybrid
colorscheme spacecamp
set background=dark
hi Comment ctermfg=2
set number
set cursorline

" Command line completion
set wildmenu                    " Enable autocompletion in commands
set wildchar=<Tab>              " Set completion character to Tab
set wildmode=list:longest,full  " Complete first full match, next match, etc.

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
set softtabstop=2	            " set softtabstop to 2
set tabstop=2			        " set tapstop to 2
set shiftwidth=2		        " set shiftwidth to 2
"set expandtab                   " always use spaces

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

" Buffers
noremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <C-H> :bp <enter>
nnoremap <C-L> :bn <enter>
nnoremap <Leader>w :w <enter>
nnoremap <Leader>x :bd <enter>

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

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

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git', 'coc-eslint']

inoremap <expr><TAB> pumvisible() ? "\<C-y>" : "\<TAB>"

