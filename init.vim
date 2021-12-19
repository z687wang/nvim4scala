source ~/.config/nvim/path.vim
" My Config
" System 
set nocompatible
let &t_ut=''
set autochdir
" Editor
set encoding=utf-8
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set mouse=a
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set hlsearch
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set incsearch
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tm/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endifp

set splitright
set splitbelow

"Key Mappings
let mapleader = " "
noremap ; :
" Navigate matched results from search
noremap = nzz
noremap - Nzz
" Navigate lines more quickly (5 lines each time)
noremap J 5j
noremap K 5k
noremap H 0
noremap L $

noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>

" Navigate words more quickly (5 words each time)
noremap W 5w
noremap B 5b

" Duplicate words
noremap <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Clear search highlight result until next search
noremap <LEADER>c :noh<CR>
" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" Split Screen
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

" Navigate  splitted screens
map<LEADER><left> <C-w>h
map<LEADER><right> <C-w>l
map<LEADER><up> <C-w>k
map<LEADER><down> <C-w>j

" Adjust splitted screen size
map<up> :res  +5<CR>
map<down> :res -5<CR>
map<left> :vertical resize+5<CR>
map<right> :vertical resize-5<CR>

" Navigate through tabs
noremap tu :tabe<CR>
noremap tU :tab split<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>
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

" Switch split modes (Vertical, Horizontal)
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" Save, Quit, Reload
" map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>

" Insert a new line without entering insert mode
nmap <LEADER>o o<ESC>
nmap <LEADER>O O<ESC>

" Toggle Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

" Initialize plugin system
call plug#end()

set termguicolors
colorscheme dracula

" coc.nvim config
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-docker',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-import-cost',
	\ 'coc-java',
	\ 'coc-jest',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-omnisharp',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank',
	\ 'https://github.com/rodrigore/coc-tailwind-intellisense']
set hidden
" set nobackup
" set nowritebackup
" set cmdheight=2
set updatetime=100
set shortmess+=c
" let g:airline_theme = 'minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_experimental = 1
let g:airline_statusline_ontop = 0
"Setup NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Setup Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Setup FZF
set rtp+=/usr/local/opt/fzf

