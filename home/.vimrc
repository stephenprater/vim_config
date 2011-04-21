set ttimeoutlen=100 timeoutlen=5000
set nocompatible
set background=dark
set ttymouse=xterm2
let ruby_operators = 1
syntax on

set t_Co=256

call pathogen#runtime_append_all_bundles()

if has("gui_macvim")
  colorscheme praterhaus
  set guifont=Inconsolata:h14
  set noballooneval
  set macmeta
  set mmta
  set guioptions-=T
  set lines=80 columns=258
else
  " have to load this one explicitly:b8
  so $HOME/.vim/plugin/guicolorscheme.vim
  GuiColorScheme praterhaus
  hi rubyInstanceVariable ctermfg=63
  hi rubyPredefinedVariable ctermfg=73
  hi rubyBlockParameter ctermfg=135
  hi link rubyClassVariable rubyInstanceVariable
  "why is this backwards?
  hi Comment ctermbg=0 ctermfg=58
endif

function! RubySyntaxTweak()
  hi rubyOperator guifg=#00B7FF ctermfg=100
  hi rubyBrackets guifg=#888888 ctermfg=241
  hi rubyExpressionDelimiter ctermfg=241
  hi link rubyExpressionDelimiter rubyBrackets
  hi link rubyBlockParameter rubyBrackets
  hi link rubyTernary rubyControl
  hi link rubyHashAssignment rubyOperator
  hi link rubyAssignment rubyOperator
  syn match rubyHashAssignment "=>"
  syn match rubyBrackets "[{}\[\]]"
  syn match rubyTernary "\s[?:]\s"
  syn match rubyAssignment "=\(>\)\@!"
  syn region rubyExpression matchgroup=rubyExpressionDelimiter start="\V\s("ms=s+1 end="\V)" transparent
  syn region rubyBlockParameterList matchgroup=rubyExpression start="\V|" end="\V|" transparent contains=rubyBlockParameter
  
endfunction

au Filetype ruby call RubySyntaxTweak()

noremap ]- <C-W>-
noremap ]= <C-W>+
noremap ], <C-W>>
noremap ]. <C-W><
noremap ]j <C-W>j
noremap ]k <C-W>k
noremap ]h <C-W>h
noremap ]l <C-W>l

noremap ]_ :split<CR>
noremap ]\| :vsplit<CR>

if has("gui_macvim")
  noremap <D-]> :bn<CR>
  noremap <D-[> :bp<CR>
else
"  noremap <C-}> :bn<CR>
"  noremap <C-{> :bp<CR>
  inoremap OA ka
  inoremap OB ja
  inoremap OC la
  inoremap OD ha
endif

imap <down> <C-E>
imap <up> <C-Y>

noremap <silent> ,yr :YRShow<CR>
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

let mapleader = ","

"set up minibufexplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplorerMoreThanOne=0

map ,<TAB> :TMiniBufExplorer<CR>
let g:yankring_min_element_length=2
let mapleader = ","

"invisibles
map ,l :set list!<CR>
set listchars=tab:\|\ ,eol:¬

set list

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)

map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map ,q <Plug>Kwbd
map <silent> ,f :set fu<CR>
map ,yr :YRShow<CR>
map <silent> ,cn :cn<CR>
map <silent> ,cp :cp<CR>

function! s:SudoWrite()
  w !sudo tee % > /dev/null
endfunction

command! NoReallyWrite call <SID>SudoWrite() 

  " for close windows
nmap <C-W>! <Plug>Kwbd

map ,tl :Tlist<CR>
map ,yr :YRShow<CR>
map ,t  :CommandT<CR>

function! s:RunShellCommand(cmdline)
  botright lwindow 
  lexpr system(escape(a:cmdline,'%#'))
  lopen
  1
endfunction

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>


command! -complete=file -nargs=+ SynCheck call s:RunShellCommand('ruby -w '.<q-args> )
map ,sc :silent SynCheck %<CR>


" open nerd tree, and jump to the editing window
if &diff
  " don't start NERDTree
else  
  au VimEnter * set laststatus=2
  au VimEnter * NERDTree
  au VimEnter * wincmd p
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


map ,mru :MRU<CR>

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

ab edn end
map ,sp :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

map ,mru :MRU<CR>
