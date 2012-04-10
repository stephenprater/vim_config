"fix fucking easytags
let g:easytags_autohighlight = 0
let g:easytags_updatetime_autodisable = 1

"tag list
let g:TList_Use_Right_Window=1
let g:TList_WinWidth=80

"yankring you bastard
let g:yankring_zap_keys = 'f F t T / ?'

let g:UltiSnipsSnippetDirectories = ["UltiSnips","snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"load pathogen, the damage from the plugins should be contained
call pathogen#infect()

" REALLY DON"T DO THAT.
let g:easytags_autohighlight = 0
let g:easytags_updatetime_autodisable = 1

let g:miniBufExplCheckDupeBufs=0

set ttimeoutlen=100 timeoutlen=5000
set nocompatible
set background=dark
set ttymouse=xterm2
let ruby_operators = 1

syntax on
filetype plugin indent on
set wildmenu

set t_Co=256

let g:ruby_debugger_debug_mode = 1
let g:github_user = "stephenprater"
let g:github_token = "35350330e6d48647aaa6444e2fd62c45"
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

if has("gui_macvim")
  let $SSH_ASKPASS = "/opt/local/libexec/ssh-askpass"
  set guifont=Bitstream\ Vera\ Sans\ Mono:h12
  colorscheme herald
  set guioptions='ace'
  set noballooneval
  set macmeta
  set mmta
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

function! RedoSyntax()
  syntax clear
  source $HOME/.vim/test_syntax.vim
endfunction
"map ,rs :call RedoSyntax()<CR>

function! RubySyntaxTweak()
  "some additiona syntax stuff i like
  syn match rubyBlockArgument "&[_[:lower:]][_[:alnum:]]*" contains=NONE display
  syn match rubyHashAssignment "=>"
  syn match rubyBrackets "[{}\[\]]"
  syn match rubyTernary "\s[?:]\s"
  syn match rubyAssignment "=\(>\)\@!"
  "syn match rubyLocalVariableOrMethod "\<[_[:lower:]][_[:alnum:]]*[?!=]\=" contains=NONE display transparent
  syn match rubyLocalMethodCall "\.[_[:lower:]][_[:alnum:]]*[?!=]\="hs=s+1 contains=NONE display
  syn match rubyObjectMethodCall "\.\(allocate\|new\|superclass\|freeze\|to_s\|included_modules\|include?\|name\|ancestors\|instance_methods\|public_instance_methods\|protected_instance_methods\|private_instance_methods\|constants\|const_get\|const_set\|const_defined?\|const_missing\|class_variables\|remove_class_variable\|class_variable_get\|class_variable_set\|class_variable_defined?\|module_exec\|class_exec\|module_eval\|class_eval\|method_defined?\|public_method_defined?\|private_method_defined?\|protected_method_defined?\|public_class_method\|private_class_method\|autoload\|autoload?\|instance_method\|public_instance_method\|nil?\|eql?\|hash\|class\|singleton_class\|clone\|dup\|initialize_dup\|initialize_clone\|taint\|tainted?\|untaint\|untrust\|untrusted?\|trust\|frozen?\|inspect\|methods\|singleton_methods\|protected_methods\|private_methods\|public_methods\|instance_variables\|instance_variable_get\|instance_variable_set\|instance_variable_defined?\|instance_of?\|kind_of?\|is_a?\|tap\|send\|public_send\|respond_to?\|respond_to_missing?\|extend\|display\|method\|public_method\|define_singleton_method\|object_id\|to_enum\|enum_for\|equal?\|instance_eval\|instance_exec\|\(__[[:alnum:]]*__\)\)*\_[.[:space:](\[]"me=e-1
  syn keyword rubyKernelMethod switch on aif
  syn match rubyExpressionDelimiter "[()]"
  syn region rubyExpression matchgroup=rubyExpressionDelimiter start="[\s(]("ms=s+1 skip="\\\\\|\\)" end=")" transparent 
  syn region rubyBlockParameterList matchgroup=rubyBrackets start="\%(\%(\<do\>\|{\)\s*\)\@<=|" end="|" oneline display contains=rubyBlockParameter, rubyOperator

  hi link rubyExpressionDelimiter rubyBrackets
  hi link rubyBlockParameter rubyBrackets
  hi link rubyBlockArgument rubyBlockParameter
  hi link rubyTernary rubyControl
  hi link rubyHashAssignment rubyOperator
  hi link rubyAssignment rubyOperator
  hi link rubyInterpolationDelimiter Delimiter
  hi link rubyKernelMethod Keyword 

endfunction

au Filetype ruby call RubySyntaxTweak()

au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm = &foldmethod | setlocal foldmethod=manual | endif
au InsertLeave * if exists('w:last_fdm') | let &l:foldmethod = w:last_fdm | unlet w:last_fdm | endif

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

noremap <leader><leader>f :FufCoverageFile<CR>
noremap <leader><leader>l :FufLine<CR>
noremap <leader><leader>t :FufTagWithCursorWord<CR>
noremap <leader><leader>b :FufBuffer<CR>

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

let g:Tlist_Use_Right_Window=1

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

let g:ConqueTerm_Color=1
let g:ConqueTerm_TERM='xterm-256color'
let g:ConqueTerm_ReadUnfocused=1

"invisibles
map ,l :set list!<CR>
set listchars=tab:\|\ ,eol:¬

set list

command! -nargs=? -complete=tag Pry call PryWord(<f-args>)
nmap ,,tm :SendToTmux<CR>
nmap ,,tmv :SetTmuxVars<CR>
nmap ,,p  :Pry<CR>

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
"
" change spaces to tabs
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map ,q <Plug>Kwbd
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

function! HighlightGroup()
  let l:syndict = {}
  let syndict["higlight"] = synIDattr(synID(line("."),col("."),1),"name")
  let syndict["trans"] = synIDattr(synID(line("."),col("."),0),"name") 
  let syndict["lolight"] = synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
  let syndict["fg_col"] = synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") 
  echo syndict 
endfunction

function! PryWord(...)
  if a:0 == '0'
    let word = expand("<cword>")
  else
    let word = a:1
  endif
  let comm = 'pry ' . word . ''
  call Send_to_Tmux(comm)
endfunction

command! -complete=file -nargs=+ SynCheck call s:RunShellCommand('/opt/local/bin/ruby -w '.<q-args> )
map ,sc :silent SynCheck %<CR>

" weird name for this variable
let g:ruby_debugger_progname = '/Applications/MacVim.app/Contents/MacOS/Vim'


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

function! CreatePurchaseString()
  '<,'>s/,/\r/g
  '<,'>s/^\(.\{-}\)\(\s\|$\)/pn=\1\&qty_\1=1\&/g
  '<,'>s/-/hhh/g
  '<,'>s/\n//g
  s/&$/g
endfunction

nmap ,mru :MRU<CR>

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%{ruby_debugger#statusline()}%-14.(%l,%c%V%)\ %P

ab edn end
nmap <Leader>sp :call HighlightGroup()<cr>

