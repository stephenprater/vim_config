set background=dark
syntax on

set t_Co=256
colorscheme railscasts256

" make sure vim uses something like white for the text color
hi Normal cterm=None ctermfg=247
hi StatusLine cterm=None ctermbg=255 ctermfg=0
hi StatusLineNC cterm=None ctermbg=245 ctermfg=0
hi VertSplit cterm=None ctermbg=245
hi Title cterm=bold ctermfg=255

call pathogen#runtime_append_all_bundles()


set nocompatible
filetype on
filetype plugin on

set number

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

set backspace=2
set cmdheight=2
set ruler
set history=100
set undolevels=100
set autoindent
set hidden

set incsearch
set ignorecase 
set smartcase
set directory=~/.vim/swap,.

" set mac meta
" set mmta 


"set up minibufexplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplorerMoreThanOne=0


let mapleader = ","

"invisibles
map ,l :set list!<CR>
set listchars=tab:\|\ ,eol:¬
hi SpecialKey cterm=None ctermfg=234 gui=None guifg=#000066
hi NonText cterm=None ctermfg=234 gui=None guifg=#000066


set list

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)

map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

function! s:SudoWrite()
  w !sudo tee % > /dev/null
endfunction

command! NoReallyWrite call <SID>SudoWrite() 

" for close windows
nmap <C-W>! <Plug>Kwbd

map ,tl :Tlist<CR>


" open nerd tree, and jump to the editing window
au VimEnter * set laststatus=2
au VimEnter * NERDTree
au VimEnter * wincmd p

au FileType ruby source $HOME/.vim/bundle/ri-browser/ftplugin/ri.vim

map ,sp :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

map ,mru :MRU<CR>

