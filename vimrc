set nocompatible
set hidden " hide buffers instead of closing them this
"    means that the current buffer can be put
"    to background without being written; and
"    that marks and undo history are preserved
filetype off
set cursorline

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Replace <Leader> with ,
let mapleader = ","

" enable mouse in all modes
set mouse=a

" set title to window
set title

" Copying and pasting
imap <C-v> <C-r><C-o>+
imap <C-c> <CR><Esc>O

" Make pasting done without any indentation break."
set pastetoggle=<F4>

" movement by screen line instead of file line
nnoremap j gj
nnoremap k gk

" use ; instead of :
nnoremap ; :

" folding settings
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"Indentation parameters
set autoindent
set cindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Status line
"set laststatus=2          " always show a status line
"set statusline=
"set statusline+=%-3.3n\ " buffer number
"set statusline+=%f\ " filename
"set statusline+=%h%m%r%w " status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
"set statusline+=%= " right align remainder
"set statusline+=0x%-8B " character value
"set statusline+=%-14(%l,%c%V%) " line, character
"set statusline+=%<%P " file position

set laststatus=2                            " always show a status line
set statusline=""
set statusline+=%t                          " tail/filename
set statusline+=%m%r%h                      " modified/read only/help
set statusline+=\ [%Y]                      " line endings/type of file
set statusline+=\ %{fugitive#statusline()}  " Git status
set statusline+=%=                          " left/right separator
" Syntastic warning
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
" display a warning if the line endings aren't unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
" display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
" progress through file
set statusline+=C:%02c,                       " cursor column
set statusline+=L:%03l/%03L                   " cursor line/total lines
set statusline+=\ %P                        " percent through file

"  Show the (partial) command as it’s being typed 
set showcmd

" show current mode
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
" Resize the splits if the vim windows is resized
autocmd VimResized * :wincmd =

"open vimrc with ,ev
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Select blocks after indenting
vnoremap < <gv
vnoremap > >gv

" View whitespace
nnoremap <leader>vs :set list!<CR>
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

" To insert timestamp, press <leader>T.
nnoremap <leader>T a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
inoremap <leader>T <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" To save, press leader-s.
nnoremap <leader>s :w<CR>
inoremap <leader>s <Esc>:w<CR>a

"clear out a search with ,<space>
nnoremap <leader><space> :noh<cr> 

" Stop highlighting search matches
" nmap <silent> <leader>h :silent :nohlsearch<CR>

"The cursor is never on the last line
set scrolloff=3

" Don’t reset cursor to start of line when moving around.
set nostartofline

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

" Don’t add empty newlines at the end of files
set binary
set noeol

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
"au FocusLost * :wa

" auto highlight markdown syntax
au BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
"autocmd FileType markdown setlocal spell
" Spell check 
" -------------------------------------------------------------------
set spelllang=en_us                         " US English
set spell                                   " spell check on
set spellsuggest=10                         " only suggest a few words
" toggle spelling with F6 key
  map <F6> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>


" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

"Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
        au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

syntax enable "Syntax coloration

" Scroll faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" color terminal
set t_Co=16
colorscheme solarized 
set background=light

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
 Plugin 'junegunn/limelight.vim'

" pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc-after'
Plugin 'vim-pandoc/vim-pandoc'

" less syntax
Plugin 'groenewege/vim-less'

" better markdown highlight
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'gabrielelana/vim-markdown'
"Plugin 'tpope/vim-markdown'
"
" Passive voice
Plugin 'jamestomasino/vim-writingsyntax'

" Nerdtree
Plugin 'scrooloose/nerdtree'

Plugin 'wincent/Command-T'

" git tools
Plugin 'tpope/vim-fugitive'

" jump around documents
Plugin 'Lokaltog/vim-easymotion'

" full path fuzzy search
Plugin 'kien/ctrlp.vim'

" some yaml support
Plugin 'avakhov/vim-yaml'

" (un)comment with <leader>c(u/c)
Plugin 'scrooloose/nerdcommenter'

" Surround
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat' "to use . to repeat ds, cs, yss"

" Autoclose brackets
Plugin 'Townk/vim-autoclose'

" snippets, I add mine in _snippet
Plugin 'msanders/snipmate.vim'

" neo-completion
Plugin 'Shougo/neocomplete'

Plugin 'vim-scripts/supertab'

" base 16 theme
Plugin 'chriskempson/base16-vim'

"multiple cursor 
Plugin 'kristijanhusak/vim-multiple-cursors'

" Latex
Plugin 'LaTeX-Box-Team/LaTeX-Box'


" LaTeX-Suite
"Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"""""""" end of vundle.

" Limelight integration to Goyo
"function! GoyoBefore()
   "Limelight
"endfunction

"function! GoyoAfter()
   "Limelight!
"endfunction

"let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
"let g:limelight_conceal_ctermfg = 8

nnoremap <leader>V :Goyo<CR>
nnoremap <leader>L :Limelight!!<CR>
let g:goyo_margin_top=2
let g:goyo_margin_bottom=2

let g:neocomplete#enable_at_startup = 1

" pandoc vim setting
" Bib file for pandoc
let g:pandoc_biblio_bibs = '~/Dropbox/Latex_bib_sty/zotero.bib'
"let g:pandoc#biblio#bibs = ['~/Dropbox/Latex_bib_sty/zotero.bib']
"
let g:pandoc#biblio#sources = "bclg"
" remember to put default.bib in /.pandoc/
" 1) [b] Search for any bibliography that shares the name of the current file in the current directory. So, if the document is named `paper.mkd`, it will look for `paper.bib`, paper.ris`, and so on.
"2) [c] Search for any bibliography in the current dir.
"3) [l] Search for default bibliographies (`default.bib`, `default.ris`, etc.) in pandoc's data dir ("$HOME/.pandoc/" in *nix, "%APPDATA%/pandoc/" in Windows)
"4) [t] Search for bibliographies in texmf (requires the `kpsewhich` program)
"5) [g] Add any bibliographies listed in |g:pandoc#biblio#bibs|.
"
let g:pandoc#command#latex_engine = "pdflatex"
let g:pandoc#biblio#use_bibtool = 1
" This line is needed for bib files
set grepprg=grep\ -nH\ $*
let g:pandoc#modules#disabled = ["formatting", "folding"]

" pandoc-syntax setting
let g:pandoc#syntax#conceal#use = 0


"plasticboy/vim-markdow I do not like folding
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" Format paragraphs with <leader>q
map <leader>q {!}fmt -w 80<CR>}<CR>

let g:SuperTabDefaultCompletionType = "context"
" open Nerdtree by press F3
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" ctrlp Settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'some_bad_symbolic_links',
  "\ }

 "=========== Gvim Settings =============

 "Removing scrollbars
if has("gui_running")
"    set guitablabel=%-0.12t%M
	"set guioptions-=T
	"set guioptions-=r
	"set guioptions-=L
	"set guioptions+=a
	"set guioptions-=m
	" Use the Solarized Dark theme
	set background=light
	let g:solarized_termtrans=1
	let g:solarized_termcolors=256
	let g:solarized_contrast="high"
	let g:solarized_visibility="high"
	colorscheme solarized 
	" Use 14pt Monaco
	set guifont=Cousine\ 12
	set listchars=tab:▸\ ,eol:¬,trail:.         " Invisibles using the Textmate style
else
	set t_Co=256
	colorscheme solarized 
	"colorschem torte
endif

" =========== ending Gvim Setting ===========
"
