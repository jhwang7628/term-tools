" ========== Vim Basic Settings ============="

" Pathogen settings.
filetype off
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
Helptags
filetype plugin indent on


" Make vim incompatbile to vi.
set nocompatible
set modelines=0

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
syntax on

"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

"set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3

"Changing Leader Key to space
let mapleader = " "
"let mapleader = ","
""""
" Set title to window
set title
" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" Enable Mouse
" set mouse=a
" Disable Mouse
set mouse=c

"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %
"
" short cut for removing trailing white spaces using <F5>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


" Settings for use of the system's clipboard
vnoremap <C-c> "+y


" Make Vim to handle long lines nicely.
set wrap
set textwidth=100
set formatoptions=qrn1
"set colorcolumn=79

" To  show special characters in Vim
" set list
set listchars=tab:▸\ ,eol:¬

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Rope settings."
inoremap <leader>j <ESC>:RopeGotoDefinition<cr>

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map : to ; also in command mode.
"nnoremap ; :

" Set vim to save the file on focus out.
" au FocusLost * :wa

" Adding More Shorcuts keys using leader kye.
" Leader Kye provide separate namespace for specific commands.
",W Command to remove white space from a file.
""nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ft Fold tag, helpful for HTML editing.
nnoremap <leader>ft vatzf

" ,q Re-hardwrap Paragraph
nnoremap <leader>q gqip

" ,v Select just pasted text.
nnoremap <leader>v V`]

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" jj For Qicker Escaping between normal and editing mode.
"inoremap jj <ESC>


" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =


" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildchar=<Tab> wildmenu wildmode=full

"Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

nnoremap g; g;zz

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('')<Bar>let old_regtype=getregtype('')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@, '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('')<Bar>let old_regtype=getregtype('')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@, '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('', old_reg, old_regtype)<CR>

" =========== END Basic Vim Settings ===========


" =========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set guifont=Monospace\ 12
    colo badwolf
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
    "colorschem torte
endif

" Special Settings for Consoles
"if !has("gui_running")
"    set t_Co=256
"    colorschem badwolf
"endif

" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========


" ========== Plugin Settings =========="

" Mapping to NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

" Mini Buffer some settigns."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Tab color settings to make it more visible.
hi MBEChanged ctermfg=white
hi MBENormal ctermfg=white

" Rope Plugin settings
" imap <leader>j <ESC>:RopeGotoDefinition<cr>
nmap <leader>j <ESC>:RopeGotoDefinition<cr>

" Tagbar key bindings."
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i

" Snipmate remap settings. It's binding overwritten standard
" bindings.
" Snipmate using bellow VIM's default keys, just unmap it.
" autocmd VimEnter * unmap! <C-i>


" =========== END Plugin Settings =========="
"
"
" =========== vim-latex suite Settings ==========="
"

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"
" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Imap_UsePlaceHolders = 0

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
" let g:Tex_CompileRule_pdf

" =========== vim-latex suite Settings ==========="
"
"
"
"
"
"
" ========== automatic syntaxing ============= "
" for glsl
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
au BufRead,BufNewFile Makefile setfiletype make
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
autocmd Filetype css setlocal tabstop=2 shiftwidth=2
autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype ts setlocal tabstop=2 shiftwidth=2

set cul
" Change the cursor shape when entering the insert mode

if has("autocmd")
  au InsertEnter * set nocul
  au InsertLeave * set cul
endif


" leave insert mode quickly
  if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
    augroup END
  endif



" enable smarter tab line in vim-airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"
"
set t_Co=16
set background=dark
colorscheme solarized
"
" let g:airline#extensions#tmuxline#enabled = 0
autocmd VimEnter * Tmuxline airline_insert
autocmd VimEnter * SyntasticToggleMode

nmap <leader>sc :SyntasticCheck<CR>

nmap <C-A> <Nop>
nmap <C-S> <Nop>
nmap <C-X> <Nop>


" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
"   endif
""
""   " unicode symbols
"   let g:airline_left_sep = '»'
"   let g:airline_left_sep = '▶'
"   let g:airline_right_sep = '«'
"   let g:airline_right_sep = '◀'
"   let g:airline_symbols.linenr = '␊'
"   let g:airline_symbols.linenr = '␤'
"   let g:airline_symbols.linenr = '¶'
"   let g:airline_symbols.branch = '⎇'
"   let g:airline_symbols.paste = 'ρ'
"   let g:airline_symbols.paste = 'Þ'
"   let g:airline_symbols.paste = '∥'
"   let g:airline_symbols.whitespace = 'Ξ'

" au BufNewFile,BufRead * if &syntax == '' | set syntax=cpp | endif


" buffer screen updates instead of update all the time
set lazyredraw

" nmap <c-s> :w<CR>
" imap <c-s> <Esc>:w<CR>a
" unmap <C-S>
" noremap <F3> <C-S>
"


" For swap files "
" set backupdir=./.backup,.,/tmp
" set directory=.,./.backup,/tmp

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

" for constructor indentation "
" ref: http://stackoverflow.com/questions/2288678/vim-indentation-in-c-constructor-initialization-list
set cino=g4,h4,i0

"autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=cpp | endif

"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\e[5 q"
"    let &t_EI = "\e[2 q"
"endif

"set syntax=on

"========= Enable Vundle ==========
" For reference see StackExchange:
"  http://vi.stackexchange.com/questions/388/what-is-the-difference-between-the-vim-package-managers
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" more Plugin commands
" ...
call vundle#end()            " required
filetype plugin indent on    " required
"========= END Enable Vundle ==========

"========= Vim Plug-ins managed by Vundle ==========
Plugin 'tpope/vim-fugitive'
set runtimepath^=~/.vim/bundle/ctrlp.vim
Plugin 'scrooloose/nerdcommenter'
"========= END Vim Plug-ins managed by Vundle ==========

" disable long line auto break:
" http://stackoverflow.com/questions/15724919/how-do-i-prevent-vim-from-auto-wrapping-at-column-80
" set tw=0

" Highlight trailing whitespace in the most annoying way possible.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Remove trailing whitespace
" ref: http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent> <leader>dw :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Custom code assist
map <leader>/ i//##################################################################################################<Esc>
map <leader># i####################################################################################################<Esc>

" Set line number mode automatically
" https://jeffkreeftmeijer.com/vim-number/
set number

" Set custom key bindings for printing
" https://howchoo.com/g/nzc1ztu4ztd/custom-key-mappings-vim
noremap <leader>dd A // FIXME debug<Esc>
noremap <leader>da o// FIXME debug START<Esc>
noremap <leader>db o// FIXME debug STOP<Esc>
noremap <leader># o####################################################################################################<Esc>

set tw=100
set cc=100
set smarttab

" ctags stuff
set tags+=$HOME/.ctags
set tags+=./tags;$HOME

" ctags - ctrlp integration
nnoremap <leader>t :CtrlPTag<cr>

" speedup ctrlp using pymatch
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350
" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0
" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0
" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g --ignore ''build'' ""'
endif

" CtrlP speed up:
" http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
"    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif
"let g:ctrlp_match_window = 'min:1,max:10,results:30' " 30 results in max 10 window

