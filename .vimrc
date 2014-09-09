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
set showbreak=↪

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
syntax enable "Syntax coloration
set relativenumber

" show line number, cursor position
set ruler

" set a vertical column to avoid too wide
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

" Set vim to save the file on focus out.
au FocusLost * :wa

"Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
        au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

"set t_Co=256
"let base16colorspace=256
"set background=dark
colorscheme default

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
Plugin 'mhinz/vim-signify'
" Fugitive
Plugin 'tpope/vim-fugitive'
" GitHub issues
" Plugin 'jaxbot/github-issues.vim'
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
" CSS colors
Plugin 'ap/vim-css-color'
" better javascript syntax
Plugin 'pangloss/vim-javascript'
" (un)comment with <leader>c(u/c)
Plugin 'scrooloose/nerdcommenter'
" use tab for auto-completion
Plugin 'ervandew/supertab'
" Neocomplete
"Plugin 'Shougo/neocomplete.vim'
" R communication
"Plugin 'jalvesaq/VimCom'
"Plugin 'jcfaria/Vim-R-plugin'
" Add END after begin
Plugin 'tpope/vim-endwise'
" Surround
Plugin 'tpope/vim-surround'
" Liquid markup
Plugin 'tpope/vim-liquid'

" ipython
Plugin 'ivanov/vim-ipython'
" julia
Plugin 'JuliaLang/julia-vim'
" Autoclose brackets
Plugin 'Townk/vim-autoclose'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Theme
"Plugin 'chriskempson/base16-vim'
"Plugin 'tpoisot/vim-base16-term'
"" Ctags
"Plugin 'majutsushi/tagbar'
"" NERD Tree with git support
"Plugin 'Xuyuanp/nerdtree'
"" LaTeX-Suite
"Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
"" Create gists
"Plugin 'mattn/gist-vim'
"Plugin 'mattn/webapi-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"""""""" end of vundle.   



" python
" let python_highlight_all = 1
" let python_highlight_indent_errors = 0
" let python_highlight_space_errors = 0

" NERDTree
"nnoremap <leader>f :NERDTreeToggle<CR>

" tagbar
"nnoremap <leader>t :TagbarToggle<CR>

"Liquid
"let g:pandoc_use_embeds_in_codeblocks_for_langs = ['ruby', 'vim', 'python', 'r', 'json', 'c', 'julia']

"SuperTab!
let g:SuperTabDefaultCompletionType = "context"

" NeoComplete
"let g:neocomplete#enable_at_startup = 0
"let g:neocomplete#enable_smart_case = 1
"nnoremap <leader>ne :NeoCompleteEnable<CR>
"nnoremap <leader>nd :NeoCompleteDisable<CR>

" <leader>k Knits to MD
nnoremap <leader>k :! Rscript -e "library(knitr);knit(input='%', output='%:r.md');"<CR>


"""""" Various writing improvements

" New signs for the pandoc bundle
let g:pandoc_syntax_user_cchars = {'atx': '¶', 'codelang': '>', 'footnote': '§', 'definition': '»', 'newline': '¬'}

"Rmd and Rpres are pandoc
au BufRead,BufNewFile *.Rmd,*.Rpres setfiletype pandoc

" Format paragraphs with <leader>q
map <leader>q {!}fmt -w 80<CR>}<CR>

" Place markers with {type} for markdown files
augroup markers
   autocmd! BufEnter *.md,*.mkd,*.txt,*.Rmd,*.Rpres match Error '{{\w\+}}'
augroup END
nnoremap <leader>{{ :vimgrep /{\w\+}}/ %<CR>:copen<CR>
"""""" END


"Bib file for pandoc
let g:pandoc_bibfiles = ['~/Dropbox/Latex_bib_sty/zotero.bib']
let g:pandoc_use_bibtool = 1


" This line is needed for bib files
set grepprg=grep\ -nH\ $*

" Latex kind of stuff
let g:Tex_BIBINPUTS = "~/Dropbox/Latex_bib_sty/zotero.bib"
let g:Tex_BibtexFlavor = 'bibtex'
let g:Tex_Flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
set iskeyword+=:

map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" GitHub access token
" let g:github_access_token = "f8dfb0560ec35045a19e5f1eebba73d137f7cff7"
" let g:github_upstream_issues = 1

" tagbar markdown
let g:tagbar_type_pandoc = {
    \ 'ctagstype': 'pandoc',
    \ 'ctagsbin' : '~/.scripts/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" Gist options
let g:gist_detect_filetype = 1

 "=========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    colo badwolf
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
    colorschem default
    "colorschem torte
endif

" =========== ending Gvim Setting ===========
