if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

silent! call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'jaredgorski/spacecamp'
Plug 'jacoborus/tender.vim'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()


set mouse=a                     " Enable mouse in terminal
let mapleader = ' '             " Make Leader Space Key
set hidden                      " Allow Background Buffers without saving
set splitright                  " Split to right by default
set number                      " Show line numbers
set numberwidth=3               " Set line numbers to 3 digits
set cursorline                  " Set current line highlighted
set sidescroll=1                " Scroll 1 column horizontally
set signcolumn=yes
set backspace=indent,eol,start  " Let backspace work over line-breaks, etc.
set nostartofline               " Prevent the cursor from changing colums when moving over lines
set belloff=all                 " No beeping or flashing
set clipboard=unnamed           " Copy unnamed to clipboard by default
set confirm                     " Confirm close / overwrite

if (has("termguicolors"))
  set termguicolors
endif

" colorscheme hybrid
set background=dark
colorscheme PaperColor

" Command line completion
set wildmenu                    " Enable autocompletion in commands
set wildmode=list:longest,full  " Complete first full match, next match, etc.

" Text Wrapping
set nowrap                      " Never wrap text

" Search and Substitute
set incsearch                   " Move to matches as characters are type
set gdefault                    " Use global flag by default in s: commands
set hlsearch                    " Highlight searches
set ignorecase                  " No case sensitive search
set smartcase                   " ... unless there are capitals in searches
" Disable highlight
nnoremap <leader><space> :nohlsearch<CR>

" Tabs
set softtabstop=2	            " set softtabstop to 2
set tabstop=2			        " set tapstop to 2
set shiftwidth=2		        " set shiftwidth to 2
"set expandtab                   " always use spaces

" Airline Settings
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Airline unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

" Rust Settings
let g:rustfmt_autosave = 1

" Buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <C-H> :bp<CR>
nnoremap <C-L> :bn<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :bd<CR>

" fzf
nnoremap <Leader>f :Files<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

" Jump to last cursor position (except in git commit messages)
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype !~# 'commit' |
    \   exe "normal g`\"" |
    \ endif
augroup END

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git', 'coc-eslint', 'coc-rust-analyzer']

