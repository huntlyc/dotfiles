source $VIMRUNTIME/defaults.vim

""" Basic Stuff
set nocompatible "Not entirely sure what this does, but seen it about in other examples

colorscheme slate

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

let g:airline_powerline_fonts = 1
" Add optional packages.
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'


" Add plugins to &runtimepath
call plug#end()

" set background=dark
colorscheme molokai
let g:molokai_original = 1
" let g:rehash256 = 1


"TComment config - ,cc to toggle
noremap <silent> <Leader>cc :TComment<CR>

"CTRP config
nnoremap <silent> <Leader>f :CtrlP<CR>



"let g:lightline = { 'colorscheme': 'solarized', }               "vim-lightline
set laststatus=2                                                "vim-lightline
set noshowmode                                                  "vim-lightline



"fn to minify js or css - uses cleancss and uglify binaries (systemwide node
" modules on my system)
function Js_compress ()
    let cwd = expand('<afile>:p:h')
    let nam = expand('<afile>:t:r')
    let ext = expand('<afile>:e')
    if -1 == match(nam, "[\._]src$")
        let minfname = nam.".min.".ext
    else
        let minfname = substitute(nam, "[\._]src$", "", "g").".".ext
    endif


    if ext == 'js' && executable('uglifyjs')
        " cmd: uglifyjs nonmin.js -o newfile.min.js -m -c
        let jscmd =  'uglifyjs '.cwd.'/'.nam.'.'.ext.' -o '.cwd.'/'.minfname.' -m -c '
	    cal system(jscmd)
        " echo '> JS  minified'
    endif
endfunction

function Css_compress ()
    let cwd = expand('<afile>:p:h')
    let nam = expand('<afile>:t:r')
    let ext = expand('<afile>:e')
    if -1 == match(nam, "[\._]src$")
        let minfname = nam.".min.".ext
    else
        let minfname = substitute(nam, "[\._]src$", "", "g").".".ext
    endif

    if ext == 'css' && executable('cleancss')
        " cmd: cleancss --s1 -s --skip-rebase nonmin.css > newfile.min.css
        let csscmd =  'cleancss --s1 -s --skip-rebase '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' '
	    cal system(csscmd)
        " echo '> CSS minified'
    endif
endfunction

function Sass_compile ()
    let cwd = expand('<afile>:p:h')
    let nam = expand('<afile>:t:r')
    let ext = expand('<afile>:e')

    if -1 == match(nam, "[\._]src$")
        let cssname = nam.".css"
    else
        let cssname = substitute(nam, "[\._]src$", "", "g").".css"
    endif

    if -1 == match(nam, "[\._]src$")
        let minfname = nam.".min.css"
    else
        let minfname = substitute(nam, "[\._]src$", "", "g").".css"
    endif

    if ext == 'scss' && executable('node-sass')
        " cmd: node-sass input/file.scss output/file.css
        let sasscmd =  'node-sass '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.cssname.' '
	    cal system(sasscmd)
        " echo '> SASS compiled'


        if executable('cleancss')
            let csscmd =  'cleancss --s1 -s --skip-rebase '.cwd.'/'.cssname.' > '.cwd.'/'.minfname.' '
            cal system(csscmd)
            " echo '> SASS output minified'
        endif
    endif
endfunction

"
" call our minification on save
" autocmd FileWritePost,BufWritePost *.js :call Js_compress()
" autocmd FileWritePost,BufWritePost *.css :call Css_compress()
" autocmd FileWritePost,BufWritePost *.scss :call Sass_compile()


" get rid of all trailing whitespace before end of buffer on before buffer
" save
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre *.html,*.php,*.css,*.js,*.svg :call TrimWhiteSpace()

function! ReportMediaQuery()
    execute "normal! mq?@media\<CR>"
    let l:lineContent = getline('.')
    execute "normal! `q"
    echohl WarningMsg 
    echo l:lineContent
    echohl None
endfunction
nmap <leader>q :call ReportMediaQuery()<CR>

"Highlights trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" emmet config
let g:user_emmet_install_global = 0
autocmd FileType php,html,css EmmetInstall
" set expand key map to ',,'
let g:user_emmet_leader_key=','
