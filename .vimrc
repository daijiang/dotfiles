set nocompatible
set hidden
filetype off
set cursorline

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Replace <Leader> with ,
let mapleader = ","

" enable mouse
set mouse=a

" set title to windoe
set title

" Make pasting done without any indentation break."
set pastetoggle=<F4>

" movement by screen line instead of file line
nnoremap j gj
nnoremap k gk

" use ; instead of :
nnoremap ; :

"Indentation parameters
set autoindent
set cindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\ " buffer number
set statusline+=%f\ " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%= " right align remainder
set statusline+=0x%-8B " character value
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P " file position

" Display incomplete commands.
set showcmd

" shwo editing mode
set showmode

" Move across splits
nnoremap <leader>sh :sp<CR>
nnoremap <leader>sv :vsp<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
set splitbelow
set splitright

"open vimrc with ,ev
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Select blocks after indenting
vnoremap < <gv
vnoremap > >gv

" View whitespace
nnoremap <leader>l :set list!<CR>
set listchars=tab:»\ ,eol:¬
"set showbreak=↪

" Better auto-completion of options
set wildmenu
set wildmode=list:longest

" use normal regex instead of vim's
nnoremap / /\v 
vnoremap / /\v

" Ignorecase when searching with /, keep case when searching with *
set ignorecase
set smartcase
set gdefault "applies substitutions globall on lines"
set incsearch "" search as you type
set showmatch
set hlsearch

" To insert timestamp, press F3.
nnoremap <leader>t a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
inoremap <leader>t <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" To save, press ctrl-s.
nnoremap <leader>s :w<CR>
inoremap <leader>s <Esc>:w<CR>a

"clear out a search with ,<space>
nnoremap <leader><space> :noh<cr> 

" Stop highlighting search matches
" nmap <silent> <leader>h :silent :nohlsearch<CR>

"The cursor is never on the last line
set scrolloff=3

"Files are read as soon as they are changed
set autoread

"Various general options
"set noswapfile
"set nobackup
"set nowritebackup
set noerrorbells
set visualbell
set encoding=utf-8
set foldmethod=marker

"Line numbers and syntax
set number "Line numbers
set relativenumber

" show line number, cursor position
set ruler

" set a vertical column to avoid too wide
set wrap
set textwidth=80
set formatoptions=qrn1
"set colorcolumn=80

" Set vim to save the file on focus out.
au FocusLost * :wa

" auto highlight markdown syntax
au BufRead,BufNewFile *.md set filetype=markdown

"Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
        au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

syntax enable "Syntax coloration
set t_Co=256
let base16colorspace=256
set background=dark
colorscheme solarized 

" Scroll faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Intuitive backspacing in insert mode
set backspace=indent,eol,start


""""""""" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" follow VCS changes in the left gutter
"Plugin 'mhinz/vim-signify'
" Fugitive
"plugin 'tpope/vim-fugitive'
" github issues
" plugin 'jaxbot/github-issues.vim'
" JSON syntax
" Plugin 'elzr/vim-json'
" distraction-free with <leader>V
 Plugin 'junegunn/goyo.vim'
 nnoremap <leader>V :Goyo<CR>
let g:goyo_margin_top=2
let g:goyo_margin_bottom=2

" pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'

" (un)comment with <leader>c(u/c)
Plugin 'scrooloose/nerdcommenter'

" Surround
Plugin 'tpope/vim-surround'

" Autoclose brackets
Plugin 'Townk/vim-autoclose'

" snippets, I add mine in _snippet
Plugin 'msanders/snipmate.vim'

" Theme
"Plugin 'chriskempson/base16-vim'
"Plugin 'tpoisot/vim-base16-term'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"""""""" end of vundle.   

" pandoc vim setting
" Bib file for pandoc
let b:pandoc_biblio_bibs = ['~/Dropbox/Latex_bib_sty/zotero.bib']
let g:pandoc#biblio#bibs = ['~/Dropbox/Latex_bib_sty/zotero.bib']
let g:pandoc#biblio#use_bibtool = 1

" Format paragraphs with <leader>q
map <leader>q {!}fmt -w 80<CR>}<CR>


 "=========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
"    set guitablabel=%-0.12t%M
    "set guioptions-=T
    "set guioptions-=r
    "set guioptions-=L
    "set guioptions+=a
    "set guioptions-=m
    colo solarized 
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
    colorschem solarized 
    "colorschem torte
endif

" =========== ending Gvim Setting ===========
