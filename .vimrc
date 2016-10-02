source $VIMRUNTIME/defaults.vim

""" Basic Stuff
set nocompatible "Not entirely sure what this does, but seen it about in other examples

"Turn on syntax highlighting and smart-indent
syntax on
set autoindent
set smartindent
set backspace=indent,eol,start  " more powerful backspacing

"Show the status line and suler
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%* 
set laststatus=2

set ruler

"Get rid of tabs, they're the devils work
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

"set title to show in console title bar
set title
"Do not keep a backup file!
set nobackup

""" Misc
"Auto change the directory to the current file location
autocmd BufEnter * lcd %:p:h

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

"Set my cusom shortcut key
let mapleader=","

"Use ,s to start a spell check, hit it again to stop
nmap <leader>s :setlocal spell! spelllang=en_gb<CR>
set spellfile=~/.vim/dict.add
set pastetoggle=<F2>

"Set up window/splits key mapping for ease of use
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"set up search
set hlsearch
set incsearch
set ignorecase
set smartcase

nmap <silent> <c-N> :silent noh<CR>

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

