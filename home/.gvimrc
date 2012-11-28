set nocompatible
filetype off

let g:buffergator_supress_keymaps = 1
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_autoupdate = 1
let g:buffergator_show_buffers_from_other_tabs = 0
let g:buffergator_viewport_split_policy = "b"
let g:buffergator_split_size = 15

let g:syntastic_ruby_exec = '/Users/stephenprater/.rbenv/versions/1.9.3-p194/bin/ruby'

let g:async = { 
      \ 'vim' : '/usr/local/Cellar/macvim/7.3-64/MacVim.app/Contents/MacOS/Vim',
      \ 'line_prefix' : ">",
      \ 'async_history_file' : expand('~/.vim-addon-async-history'),
      \ 'async_history_length' : 1000,
      \ }
let g:async_implementation = "c_executable"

" use the number keys for easymotion
let g:EasyMotion_keys = '012345689'

let g:gundo_right = 1

let g:ctrlp_extensions = ['buffertag','tag']
let g:ctrlp_prompt_mappings = {
   \ 'ToggleType(1)'  : ['<S-Space>', '<c-up>'],
   \ 'ToggleType(-1)' : ['<D-S-Space>', '<c-down>']
   \ }

let g:showmarks_ignore_type = "hmpqr"

let g:neocomplcache_use_vimproc = 1
let g:neocomplcache_enable_cursor_hold_i = 1
let g:neocomplcache_cursor_hold_i_time = 500
""let g:neocomplcache_enable_insert_char_pre = 1

set rtp+=~/.vim/vundle/vundle
call vundle#rc('$HOME/.vim/vundle')

Bundle 'gmarick/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'vim-scripts/AutoClose'
Bundle 'markabe/bufexplorer'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/easytags.vim'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/scratch.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'kikijump/tslime.vim'
Bundle 'vim-scripts/UltiSnips'
Bundle 'cespare/vim-bclose'
Bundle 'duff/vim-bufonly'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'slack/vim-l9'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'stephenprater/vim-ruby-debugger'
Bundle 'xolox/vim-shell'
Bundle 'bbommarito/vim-slim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'sjl/badwolf'
Bundle 'Lokaltog/vim-powerline'
Bundle 'stephenprater/vim-buffergator'
Bundle 'EasyMotion'
Bundle 'tlib'
Bundle 'Gundo'
Bundle 'applescript.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'prettyprint.vim'
Bundle 'Shougo/vimproc'
 

call pathogen#infect()

filetype plugin indent on

let g:neocomplcache_enable_at_startup = 1

"fix fucking easytags
let g:easytags_autohighlight = 0
let g:easytags_updatetime_autodisable = 1

"yankring you bastard
let g:yankring_zap_keys = 'f F t T / ?'

let g:UltiSnipsSnippetDirectories = ["UltiSnips","snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" REALLY DON"T DO THAT.
let g:easytags_autohighlight = 0
let g:easytags_auto_highlight = 0
let g:easytags_updatetime_autodisable = 1

let g:ConqueTerm_Color = 1

let g:miniBufExplCheckDupeBufs=0

set syntax=on
set ttimeoutlen=100 timeoutlen=5000
set background=dark
set ttymouse=xterm2
let ruby_operators = 1

set wildmenu
set encoding=utf-8

let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1

set t_Co=256

let g:ruby_debugger_debug_mode = 1
let g:github_user = "stephenprater"
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

let g:ruby_debugger_progname = '/Applications/MacVim.app/Contents/MacOS/Vim'

if has("gui_macvim") && has("gui_running")
  let $SSH_ASKPASS = "/opt/local/libexec/ssh-askpass"
  set guifont=Consolas\ for\ Powerline:h12
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  macmenu &File.Print key=<nop>
  colorscheme herald
  set guioptions='ac'
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
  syn match rubyDot "\." display
  syn match rubyLocalMethodCall "\.[_[:lower:]][_[:alnum:]]*[?!=]\=" contains=rubyDot

  "syn match rubyConstant "\%(\%([.@$]\@<!\.\)\@<!\<\|::\)\_s*\zs\u\w*\%(\>\|::\)\@=\%(\s*(\)\@!"
  "why this complicated damn thing when this next one works better?
  syn clear rubyConstant
  syn clear rubyClassDeclaration
  syn match rubyConstant "\<\u\w*"
  syn match rubyClassOperator "<<\? " containedin=rubyClassDeclaration contained
  syn match rubyClassOperator "::" containedin=rubyClassDeclaration contained
  syn match rubyClassDeclaration /\<class\s([^;#])\+/  contained contains=rubyConstant,rubyClassOperator,rubyPseudoVariable,rubyClass


  let l:object_methods = ['include?', 'name', 'ancestors', 'instance_methods',
        \ 'public_instance_methods', 'protected_instance_methods', 'private_instance_methods',
        \ 'constants', 'const_get', 'const_set', 'const_defined?', 'const_missing', 'class_variables',
        \ 'remove_class_variable', 'class_variable_get', 'class_variable_set', 'class_variable_defined?',
        \ 'module_exec', 'class_exec', 'module_eval', 'class_eval', 'method_defined?',
        \ 'public_method_defined?', 'private_method_defined?', 'protected_method_defined?',
        \ 'public_class_method', 'private_class_method', 'autoload', 'autoload?', 'instance_method',
        \ 'public_instance_method', 'nil?', 'eql?', 'hash', 'class', 'singleton_class', 'clone', 'dup',
        \ 'initialize_dup', 'initialize_clone', 'taint', 'tainted?', 'untaint', 'untrust',
        \ 'untrusted?', 'trust', 'frozen?', 'inspect', 'methods', 'singleton_methods',
        \ 'protected_methods', 'private_methods', 'public_methods', 'instance_variables',
        \ 'instance_variable_get', 'instance_variable_set', 'instance_variable_defined?', 'instance_of?',
        \ 'kind_of?', 'is_a?', 'tap', 'send', 'public_send', 'respond_to?', 'respond_to_missing?',
        \ 'extend', 'display', 'method', 'public_method', 'define_singleton_method', 'object_id',
        \ 'to_enum', 'enum_for', 'equal?', 'instance_eval', 'instance_exec']

  for l:object_method in l:object_methods 
    let l:pattern = "\\." . l:object_method 
    exec "syn match rubyObjectMethodCall \"" . l:pattern . "\" contains=rubyDot"
  endfor
  
  
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
  hi link rubyClassOperator rubyOperator
  hi link rubyDot rubyBrackets
endfunction

function! UUID()
  ruby << RUBY
    require 'securerandom'
    VIM.command("let l:r = '#{SecureRandom.uuid}'")
RUBY
  return l:r
endfunction



function! SetSassMake()
  if exists("current_compiler")
    finish
  endif
  let current_compiler = "sass_css"

  if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
  endif

  let s:cpo_save = &cpo
  set cpo&vim

  setlocal makeprg=sass\ -f\ --trace\ $*\ %\ %<.css
  setlocal efm=%f:%l:%m\ (Sass::SyntaxError),%-G%.%#

  "WARNING on line 14 of menu_hover.sass:
  "This selector doesnt have any properties and will not be rendered.
  setlocal efm+=%E%>%tARNING\ on\ line\ %l\ of\ %f:,%Z%m

  let &cpo = s:cpo_save
  unlet s:cpo_save 
endfunction

au Filetype ruby call RubySyntaxTweak()
au Filetype sass call SetSassMake()

au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm = &foldmethod | setlocal foldmethod=manual | endif
au InsertLeave * if exists('w:last_fdm') | let &l:foldmethod = w:last_fdm | unlet w:last_fdm | endif

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
"au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

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

noremap <D-F>l :FufLine<CR>
noremap <D-F>t :FufTagWithCursorWord<CR>
noremap <D-F>b :FufBuffer<CR>
noremap <D-F>h :FufHelpWithCursorWord<CR>
noremap <silent> <Esc><Esc> :noh<CR>

noremap <Leader>qf :bo copen<CR>

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

" Settings {{{
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set hidden
set history=1000
set incsearch
set laststatus=2
set list
set cmdheight=2

set listchars=tab:\|\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

" _ backups {{{
set undodir=~/.vim/tmp/undo// " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup
set noswapfile
" _ }}}

set modelines=0
set noeol
set number
set ruler
set shell=/usr/local/bin/zsh
set showcmd

set matchtime=2

set completeopt=longest,menuone,preview

" White characters {{{
set autoindent
set tabstop=2
set textwidth=80
set shiftwidth=2
set softtabstop=2
set expandtab
set formatoptions=qrn1
" }}}

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu

 
set ruler
set autoindent
set hidden

" search
set hlsearch
set incsearch
set ignorecase 
set smartcase
set directory=~/.vim/swap,.

let mapleader = ","
let maplocalleader = "\\"

"set up minibufexplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplorerMoreThanOne=0

map ,<TAB> :TMiniBufExplorer<CR>
let g:yankring_min_element_length=2

let g:ConqueTerm_Color=1
let g:ConqueTerm_TERM='xterm-256color'
let g:ConqueTerm_ReadUnfocused=1

"invisibles
map <F8> :TagbarToggle<CR>

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
map ,yr :YRShow<CR>
map <silent> ,cn :cn<CR>
map <silent> ,cp :cp<CR>

" for close windows
nmap <C-W>! <Plug>Kwbd
map ,yr :YRShow<CR>
map <S-Space> :CtrlP<CR>

map ,sc :silent SynCheck %<CR>

nnoremap ,s :call SnippetList()<cr>
inoremap <c-x><c-s> <esc>:call SnippetList()<cr>

noremap ,nt :NERDTreeToggle<CR>

noremap ,h :GundoToggle<CR>
nmap ,mru :MRU<CR>

ab edn end
nmap <Leader>sp :call HighlightGroup()<cr>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

command! NoReallyWrite call <SID>SudoWrite() 
command! -complete=file -nargs=+ SynCheck call s:RunShellCommand('/opt/local/bin/ruby -w '.<q-args> )

" Functions {{{
function! s:SudoWrite()
  w !sudo tee % > /dev/null
endfunction

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

"shameless stolen from buffergator
function! s:_find_buffers_with_var(varname, expr)
    let l:results = []
    for l:bni in range(1, bufnr("$"))
        if !bufexists(l:bni)
            continue
        endif
        let l:bvar = getbufvar(l:bni, "")
        if empty(a:varname)
            call add(l:results, l:bni)
        elseif has_key(l:bvar, a:varname)
            call add(l:results, l:bni)
        elseif has_key(l:bvar, a:varname) && l:bvar[a:varname] =~ a:expr
            call add(l:results, l:bni)
        endif
    endfor
    return l:results
endfunction

" Returns the active NERDTreeBuffer
function! s:_active_nerd_tree_buffer()
    let nt_buffers = s:_find_buffers_with_var('NERDTreeRoot','')
    for nt_buffer in nt_buffers
        if bufwinnr(nt_buffer) > 0
          return bufwinnr(nt_buffer)
        endif
    endfor
endfunction


function! SetupWorkspace()
  let g:buffergator_autoupdate = 0
  let tbuf = bufnr('%')
  execute 'NERDTreeToggle'
  execute 'NERDTreeFocus'
  
  execute 'BuffergatorOpen'
  execute 'TagbarOpen'
  execute bufwinnr(tbuf) . 'wincmd w'
  let g:buffergator_autoupdate = 1 
endfunction

au FileType *.html call SetUpTidy()
au FileType *.scss setlocal foldmarker=\{,\} | setlocal foldmethod=marker<CR>


function! s:RangeToTmux(line1, line2)
  let l:old_r = @r
  execute a:line1 . ',' . a:line2 . 'y r'
  call Send_to_Tmux(@r)
  let @r = l:old_r
endfunction

command! -range SendToTmux :call <SID>RangeToTmux(<line1>,<line2>)<CR>
command! SetupTmux :call Set_Tmux_Vars()<CR>

function! s:SetUpWatchCommand()
  let l:sass_buff = bufnr('%')
endfunction

function! s:get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - 2]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! SetUpTidy()
  command! -buffer -range=% -bang Tidy :call CallTidy(<line1>, <line2>, '<bang>')
endfunction

function! CallTidy(line1, line2, errors)
  if !a:errors
    execute a:line1 . "," . a:line2 . "!tidy -config " . $HOME . "/.vim/config/tidy.conf -im"
  else
    execute a:line1 . "," . a:line2 . "!tidy -config " . $HOME . "/.vim/config/tidy.conf -im --show-errors 0 -q"
  endif
endfunction

" Need a command to list the snippets
command! UltiList :call UltiSnips_ListSnippets()

func! SnippetList()
    let response = matchstr(tlib#input#CommandSelect('UltiList'), '^\S\+\s(\zs.*\ze)')
    if !empty(response)
        " find the part of the line that already has been typed
        echom expand("<cword>")
        let part = matchstr(response,expand("<cword>"))
        if !empty(part)
            let response = strpart(response,len(part))
        endif
        exec ':norm a'.response
        :norm l
        :call UltiSnips_ExpandSnippet()
    endif
endfunc

function! CreatePurchaseString()
  '<,'>s/,/\r/g
  '<,'>s/^\(.\{-}\)\(\s\|$\)/pn=\1\&qty_\1=1\&/g
  '<,'>s/-/hhh/g
  '<,'>s/\n//g
  s/&$/g
endfunction
"}}}1

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%{ruby_debugger#statusline()}%-14.(%l,%c%V%)\ %P

" open nerd tree, and jump to the editing window
if &diff
  " don't start NERDTree
else
  augroup Mine
    au!
    au VimEnter * call SetupWorkspace()
  augroup END
endif