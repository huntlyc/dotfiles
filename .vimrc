""" Basic Stuff

set nocompatible "Not entirely sure what this does, but seen it about in other examples
"You don't need a colour scheme, but I like this one :)
colorscheme evening

"Turn on syntax highlighting and smart-indent
syntax on
set smartindent

"Show the status line and suler
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%* 
set laststatus=2

set ruler

"Get rid of tabs, they're the devils work
set autoindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

"set title to show in console title bar
set title
"Do not keep a backup file!
set nobackup

""" Indents for diff files
"For some things I personally prefer a 2 space indent instead of 4
autocmd BufRead,BufNewFile *.xml  set tabstop=2
autocmd BufRead,BufNewFile *.xml  set shiftwidth=2
autocmd BufRead,BufNewFile *.js  set tabstop=2
autocmd BufRead,BufNewFile *.json  set shiftwidth=2
autocmd BufRead,BufNewFile *.css  set tabstop=2
autocmd BufRead,BufNewFile *.css  set shiftwidth=2

""" Misc
"Auto change the directory to the current file location
autocmd BufEnter * lcd %:p:h

"When saving a bash file, automatically have it set itself as executable
au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

"remap the esc key to a double press of the semi-colon
ino ;; <esc> 
cno ;; <c-c>

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
