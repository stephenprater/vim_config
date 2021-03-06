syn cluster rubyNotTop contains=@rubyExtendedStringSpecial,@rubyRegexpSpecial,@rubyDeclaration,rubyConditional,rubyExceptional,rubyMethodExceptional,rubyTodo

if exists("ruby_space_errors")
  if !exists("ruby_no_trail_space_error")
    syn match rubySpaceError display excludenl "\s\+$"
  endif
  if !exists("ruby_no_tab_space_error")
    syn match rubySpaceError display " \+\t"me=e-1
  endif
endif

"Ruby Operators
"{{{
if exists("ruby_operators")
  syn match  rubyOperator  "\%([~!^&|*/%+-]\|\%(class\s*\)\@<!<<\|<=>\|<=\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|==\|=\~\|>>\|>=\|=\@<!>\|\*\*\|\.\.\.\|\.\.\|::\)"
  syn match  rubyPseudoOperator  "\%(-=\|/=\|\*\*=\|\*=\|&&=\|&=\|&&\|||=\||=\|||\|%=\|+=\|!\~\|!=\)"
  syn region rubyBracketOperator matchgroup=rubyOperator start="\%(\w[?!]\=\|[]})]\)\@<=\[\s*" end="\s*]" contains=ALLBUT,@rubyNotTop
endif
"}}}

"Control Structures
"{{{
syn match   rubyControl        "\<\%(case\|begin\|do\|for\|if\|unless\|while\|until\|else\|elsif\|ensure\|then\|when\)\>[?!]\@!"
syn match   rubyControl        "\<\%(and\|break\|in\|next\|not\|or\|redo\|rescue\|retry\|return\)\>[?!]\@!"
syn match   rubyControl        "\<\%(end\)\>[?!]\@!"
syn match   rubyOperator       "\<defined?" display
syn match   rubyKeyword        "\<\%(alias\|undef\)\>[?!]\@!"
syn match   rubyKeyword        "\<\%(super\|yield\)\>[?!]\@!"
syn match   rubyBoolean        "\<\%(true\|false\)\>[?!]\@!"
syn match   rubyPseudoVariable "\<\%(nil\|self\|__FILE__\|__LINE__\)\>[?!]\@!"
syn match   rubyBeginEnd       "\<\%(BEGIN\|END\)\>[?!]\@!"
"}}}

"Defining Functions and such
"{{{
"legal ruby method name

"Defining Methods
"{{{
syn cluster rubyDeclarationItems add=rubyMethodName, rubyMethodParameter, rubyFunction
syn match rubyDefine "\<def\>" nextgroup=rubyMethodDeclaration skipwhite skipnl
syn region rubyMethodDeclaration start="\(\<def\>\s\)\@<=\<" end="[;)\n]" oneline contained containedin=rubyMethodBlock contains=ALLBUT,@rubyNotTop,rubyMethodName, rubyMethodParameter
syn region rubyMethodBlock start="\<def\>" matchgroup=rubyDefine end="\%(\<def\_s\+\)\@<!\<end\>" nextgroup=rubyMethodDeclaration contains=ALLBUT,@rubyNotTop, @rubyDeclarationItems fold
syn match rubyMethodName "\(\<def\>\s\)\@<=\([_[:lower:][:alnum:]?!=]\+\)" contained containedin=rubyMethodDeclaration contains=rubyFunction
syn cluster rubyNotTop add=rubyMethodDeclaration, rubyMethodParameter, rubyMethodName, rubyFunction
"}}}

"Undefining Methods
"{{{
syn cluster rubyUndefDeclarationItems add=rubyUndefMethod
syn cluster rubyNotTop add=@rubyUndefDeclarationItems
syn region rubyUndefMethod start="\<undef\>s" end="[;)\n]" matchgroup=rubyUndefine oneline contains=ALLBUT,@rubyNotTop
syn match rubyUndefMethodName "\(\h\w\)\+" contained containedin=rubyUndefMethod contains=rubyFunction
"}}}
"


"Aliasing Methods


syn match rubyDefine "\<alias\>"
syn match rubyClass "\<class\>"
syn match rubyModule "\<module\>"


"Arguments and Declarations
"{{{
syn region rubyBlockParameterList start="\%(\%(\<do\>\|{\)\s*\)\@<=|" end="|" oneline display contains=rubyBlockParameter
"syn match rubyBlockParameter "\<[_[:lower:]][_[:alnum:]]*" contained containedin=rubyBlockParameterList
"}}}
"
syn match rubyBlockArgument  "&[_[:lower:]][_[:alnum:]]" contains=NONE display transparent
"}}}
"
"Variable Types
"{{{
syn match  rubyConstant   "\%(\%([.@$]\@<!\.\)\@<!\<\|::\)\_s*\zs\u\w*\%(\>\|::\)\@=\%(\s*(\)\@!"
syn match  rubyClassVariable  "@@\h\w*" display
syn match  rubyInstanceVariable "@\h\w*"  display
syn match  rubyGlobalVariable "$\%(\h\w*\|-.\)"
syn match rubyASCIICode	"\%(\w\|[]})\"'/]\)\@<!\%(?\%(\\M-\\C-\|\\C-\\M-\|\\M-\\c\|\\c\\M-\|\\c\|\\C-\|\\M-\)\=\%(\\\o\{1,3}\|\\x\x\{1,2}\|\\\=\S\)\)"
syn match rubyInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*\>"								display
syn match rubyInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>"						display
syn match rubyInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*\>"								display
syn match rubyInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*\>"								display
syn match rubyFloat	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\d\+\%(_\d\+\)*\>"					display
syn match rubyFloat	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\>"	display
"}}}


"Symbols can contain interpolations
"{{{
syn match  rubySymbol   "[]})\"':]\@<!:\%(\^\|\~\|<<\|<=>\|<=\|<\|===\|==\|=\~\|>>\|>=\|>\||\|-@\|-\|/\|\[]=\|\[]\|\*\*\|\*\|&\|%\|+@\|+\|`\)"
syn match  rubySymbol   "[]})\"':]\@<!:\$\%(-.\|[`~<=>_,;:!?/.'"@$*\&+0]\)"
syn match  rubySymbol   "[]})\"':]\@<!:\%(\$\|@@\=\)\=\h\w*"
syn match  rubySymbol   "[]})\"':]\@<!:\h\w*\%([?!=]>\@!\)\="
syn match  rubySymbol   "\%([{(,]\_s*\)\@<=\l\w*[!?]\=::\@!"he=e-1
syn match  rubySymbol   "[]})\"':]\@<!\h\w*[!?]\=:\s\@="he=e-1
syn region rubySymbol   start="[]})\"':]\@<!:'"  end="'"  skip="\\\\\|\\'"  contains=rubyQuoteEscape fold
syn region rubySymbol   start="[]})\"':]\@<!:\"" end="\"" skip="\\\\\|\\\"" contains=@rubyStringSpecial fold
"}}}
"
"Predefined Constants
"{{{
syn match rubyPredefinedVariable #$[!$&"'*+,./0:;<=>?@\`~1-9]#
syn match rubyPredefinedVariable "$_\>"                        display
syn match rubyPredefinedVariable "$-[0FIKadilpvw]\>"                     display
syn match rubyPredefinedVariable "$\%(deferr\|defout\|stderr\|stdin\|stdout\)\>"             display
syn match rubyPredefinedVariable "$\%(DEBUG\|FILENAME\|KCODE\|LOADED_FEATURES\|LOAD_PATH\|PROGRAM_NAME\|SAFE\|VERBOSE\)\>" display
syn match rubyPredefinedConstant "\%(\%(\.\@<!\.\)\@<!\|::\)\_s*\zs\%(MatchingData\|ARGF\|ARGV\|ENV\)\>\%(\s*(\)\@!"
syn match rubyPredefinedConstant "\%(\%(\.\@<!\.\)\@<!\|::\)\_s*\zs\%(DATA\|FALSE\|NIL\|RUBY_PLATFORM\|RUBY_RELEASE_DATE\)\>\%(\s*(\)\@!"
syn match rubyPredefinedConstant "\%(\%(\.\@<!\.\)\@<!\|::\)\_s*\zs\%(RUBY_VERSION\|STDERR\|STDIN\|STDOUT\|TOPLEVEL_BINDING\|TRUE\)\>\%(\s*(\)\@!"
"}}}
"
"Quoted Strings
"{{{
" Normal String and Shell Command Output
syn region rubyString matchgroup=rubyStringDelimiter start="\"" end="\"" skip="\\\\\|\\\"" contains=@rubyStringSpecial fold
syn region rubyString matchgroup=rubyStringDelimiter start="'"  end="'"  skip="\\\\\|\\'"  contains=rubyQuoteEscape    fold
syn region rubyString matchgroup=rubyStringDelimiter start="`"  end="`"  skip="\\\\\|\\`"  contains=@rubyStringSpecial fold

" Generalized Single Quoted String, Symbol and Array of Strings
syn region rubyString matchgroup=rubyStringDelimiter start="%[qw]\z([~`!@#$%^&*_\-+=|\:;"',.?/]\)" end="\z1" skip="\\\\\|\\\z1" fold
syn region rubyString matchgroup=rubyStringDelimiter start="%[qw]{"          end="}"   skip="\\\\\|\\}" fold contains=rubyNestedCurlyBraces,rubyDelimEscape
syn region rubyString matchgroup=rubyStringDelimiter start="%[qw]<"          end=">"   skip="\\\\\|\\>" fold contains=rubyNestedAngleBrackets,rubyDelimEscape
syn region rubyString matchgroup=rubyStringDelimiter start="%[qw]\["           end="\]"  skip="\\\\\|\\\]"  fold contains=rubyNestedSquareBrackets,rubyDelimEscape
syn region rubyString matchgroup=rubyStringDelimiter start="%[qw]("          end=")"   skip="\\\\\|\\)" fold contains=rubyNestedParentheses,rubyDelimEscape
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[s]\z([~`!@#$%^&*_\-+=|\:;"',.?/]\)"  end="\z1" skip="\\\\\|\\\z1" fold
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[s]{"           end="}"   skip="\\\\\|\\}" fold contains=rubyNestedCurlyBraces,rubyDelimEscape
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[s]<"           end=">"   skip="\\\\\|\\>" fold contains=rubyNestedAngleBrackets,rubyDelimEscape
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[s]\["          end="\]"  skip="\\\\\|\\\]"  fold contains=rubyNestedSquareBrackets,rubyDelimEscape
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[s]("           end=")"   skip="\\\\\|\\)" fold contains=rubyNestedParentheses,rubyDelimEscape

" Generalized Double Quoted String and Array of Strings and Shell Command Output
" Note: %= is not matched here as the beginning of a double quoted string
syn region rubyString matchgroup=rubyStringDelimiter start="%\z([~`!@#$%^&*_\-+|\:;"',.?/]\)"     end="\z1" skip="\\\\\|\\\z1" contains=@rubyStringSpecial fold
syn region rubyString matchgroup=rubyStringDelimiter start="%[QWx]\z([~`!@#$%^&*_\-+=|\:;"',.?/]\)" end="\z1" skip="\\\\\|\\\z1" contains=@rubyStringSpecial fold
syn region rubyString matchgroup=rubyStringDelimiter start="%[QWx]\={"            end="}"   skip="\\\\\|\\}"   contains=@rubyStringSpecial,rubyNestedCurlyBraces,rubyDelimEscape    fold
syn region rubyString matchgroup=rubyStringDelimiter start="%[QWx]\=<"            end=">"   skip="\\\\\|\\>"   contains=@rubyStringSpecial,rubyNestedAngleBrackets,rubyDelimEscape  fold
syn region rubyString matchgroup=rubyStringDelimiter start="%[QWx]\=\["           end="\]"  skip="\\\\\|\\\]"  contains=@rubyStringSpecial,rubyNestedSquareBrackets,rubyDelimEscape fold
syn region rubyString matchgroup=rubyStringDelimiter start="%[QWx]\=("            end=")"   skip="\\\\\|\\)"   contains=@rubyStringSpecial,rubyNestedParentheses,rubyDelimEscape    fold

" Here Document
syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<-\=\zs\%(\h\w*\)+   end=+$+ oneline contains=ALLBUT,@rubyNotTop
syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<-\=\zs"\%([^"]*\)"+ end=+$+ oneline contains=ALLBUT,@rubyNotTop
syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<-\=\zs'\%([^']*\)'+ end=+$+ oneline contains=ALLBUT,@rubyNotTop
syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<-\=\zs`\%([^`]*\)`+ end=+$+ oneline contains=ALLBUT,@rubyNotTop

syn region rubyString start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<\z(\h\w*\)\ze+hs=s+2  matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend
syn region rubyString start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<"\z([^"]*\)"\ze+hs=s+2  matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend
syn region rubyString start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<'\z([^']*\)'\ze+hs=s+2  matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart      fold keepend
syn region rubyString start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<`\z([^`]*\)`\ze+hs=s+2  matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend

syn region rubyString start=+\%(\%(class\s*\|\%([]}).]\|::\)\)\_s*\|\w\)\@<!<<-\z(\h\w*\)\ze+hs=s+3    matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend
syn region rubyString start=+\%(\%(class\s*\|\%([]}).]\|::\)\)\_s*\|\w\)\@<!<<-"\z([^"]*\)"\ze+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend
syn region rubyString start=+\%(\%(class\s*\|\%([]}).]\|::\)\)\_s*\|\w\)\@<!<<-'\z([^']*\)'\ze+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart        fold keepend
syn region rubyString start=+\%(\%(class\s*\|\%([]}).]\|::\)\)\_s*\|\w\)\@<!<<-`\z([^`]*\)`\ze+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend
"}}}

" Expression Substitution and Backslash Notation
" {{{
syn match rubyStringEscape "\\\\\|\\[abefnrstv]\|\\\o\{1,3}\|\\x\x\{1,2}"               contained display
syn match rubyStringEscape "\%(\\M-\\C-\|\\C-\\M-\|\\M-\\c\|\\c\\M-\|\\c\|\\C-\|\\M-\)\%(\\\o\{1,3}\|\\x\x\{1,2}\|\\\=\S\)" contained display
syn match rubyQuoteEscape  "\\[\\']"                          contained display

syn region rubyInterpolation        matchgroup=rubyInterpolationDelimiter start="#{" end="}" contained contains=ALLBUT,@rubyNotTop
syn match  rubyInterpolation        "#\%(\$\|@@\=\)\w\+"    display contained contains=rubyInterpolationDelimiter,rubyInstanceVariable,rubyClassVariable,rubyGlobalVariable,rubyPredefinedVariable
syn match  rubyInterpolationDelimiter "#\ze\%(\$\|@@\=\)\w\+" display contained
syn match  rubyInterpolation        "#\$\%(-\w\|\W\)"       display contained contains=rubyInterpolationDelimiter,rubyPredefinedVariable,rubyInvalidVariable
syn match  rubyInterpolationDelimiter "#\ze\$\%(-\w\|\W\)"    display contained
syn region rubyNoInterpolation        start="\\#{" end="}"            contained
syn match  rubyNoInterpolation        "\\#{"          display contained
syn match  rubyNoInterpolation        "\\#\%(\$\|@@\=\)\w\+"  display contained
syn match  rubyNoInterpolation        "\\#\$\W"         display contained

syn match rubyDelimEscape "\\[(<{\[)>}\]]" transparent display contained contains=NONE

syn region rubyNestedParentheses    start="("  skip="\\\\\|\\)"  matchgroup=rubyString end=")"  transparent contained
syn region rubyNestedCurlyBraces    start="{"  skip="\\\\\|\\}"  matchgroup=rubyString end="}"  transparent contained
syn region rubyNestedAngleBrackets  start="<"  skip="\\\\\|\\>"  matchgroup=rubyString end=">"  transparent contained
syn region rubyNestedSquareBrackets start="\[" skip="\\\\\|\\\]" matchgroup=rubyString end="\]" transparent contained
" }}}

"Keyword as method - Prevent keywords being higlighted when called as a metho
"{{{
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(alias\|and\|begin\|break\|case\|class\|def\|defined\|do\|else\)\>"      transparent contains=NONE
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(elsif\|end\|ensure\|false\|for\|if\|in\|module\|next\|nil\)\>"      transparent contains=NONE
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(not\|or\|redo\|rescue\|retry\|return\|self\|super\|then\|true\)\>"      transparent contains=NONE
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(undef\|unless\|until\|when\|while\|yield\|BEGIN\|END\|__FILE__\|__LINE__\)\>" transparent contains=NONE

syn match rubyKeywordAsMethod "\<\%(alias\|begin\|case\|class\|def\|do\|end\)[?!]" transparent contains=NONE
syn match rubyKeywordAsMethod "\<\%(if\|module\|undef\|unless\|until\|while\)[?!]" transparent contains=NONE

syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(abort\|at_exit\|attr\|attr_accessor\|attr_reader\)\>"   transparent contains=NONE
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(attr_writer\|autoload\|callcc\|catch\|caller\)\>"     transparent contains=NONE
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(eval\|class_eval\|instance_eval\|module_eval\|exit\)\>" transparent contains=NONE
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(extend\|fail\|fork\|include\|lambda\)\>"        transparent contains=NONE
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(load\|loop\|private\|proc\|protected\)\>"       transparent contains=NONE
syn match rubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(public\|require\|raise\|throw\|trap\)\>"        transparent contains=NONE
"}}}

"Default Links
"{{{
hi def link rubyUndefine  rubyDefine
hi def link rubyClass     rubyDefine
hi def link rubyModule      rubyDefine
hi def link rubyMethodExceptional rubyDefine
hi def link rubyDefine      Define
hi def link rubyFunction    Function
hi def link rubyConditional   Conditional
hi def link rubyConditionalModifier rubyConditional
hi def link rubyExceptional   rubyConditional
hi def link rubyRepeat      Repeat
hi def link rubyRepeatModifier    rubyRepeat
hi def link rubyOptionalDo    rubyRepeat
hi def link rubyControl     Statement
hi def link rubyInclude     Include
hi def link rubyInteger     Number
hi def link rubyASCIICode   Character
hi def link rubyFloat     Float
hi def link rubyBoolean     Boolean
hi def link rubyException   Exception
hi def link rubyIdentifier    Identifier
hi def link rubyClassVariable   rubyIdentifier
hi def link rubyConstant    Type
hi def link rubyGlobalVariable    rubyIdentifier
hi def link rubyBlockParameter    rubyIdentifier
hi def link rubyInstanceVariable  rubyIdentifier
hi def link rubyPredefinedIdentifier  rubyIdentifier
hi def link rubyPredefinedConstant  rubyPredefinedIdentifier
hi def link rubyPredefinedVariable  rubyPredefinedIdentifier
hi def link rubySymbol      Constant
hi def link rubyKeyword     Keyword
hi def link rubyOperator    Operator
hi def link rubyPseudoOperator    rubyOperator
hi def link rubyBeginEnd    Statement
hi def link rubyAccess      Statement
hi def link rubyAttribute   Statement
hi def link rubyEval      Statement
hi def link rubyPseudoVariable    Constant
hi def link rubyComment     Comment
hi def link rubyData      Comment
hi def link rubyDataDirective   Delimiter
hi def link rubyDocumentation   Comment
hi def link rubyTodo      Todo
hi def link rubyQuoteEscape   rubyStringEscape
hi def link rubyStringEscape    Special
hi def link rubyInterpolationDelimiter  Delimiter
hi def link rubyNoInterpolation   rubyString
hi def link rubySharpBang   PreProc
hi def link rubyRegexpDelimiter   rubyStringDelimiter
hi def link rubySymbolDelimiter   rubyStringDelimiter
hi def link rubyStringDelimiter   Delimiter
hi def link rubyString      String
hi def link rubyRegexpEscape    rubyRegexpSpecial
hi def link rubyRegexpQuantifier  rubyRegexpSpecial
hi def link rubyRegexpAnchor    rubyRegexpSpecial
hi def link rubyRegexpDot   rubyRegexpCharClass
hi def link rubyRegexpCharClass   rubyRegexpSpecial
hi def link rubyRegexpSpecial   Special
hi def link rubyRegexpComment   Comment
hi def link rubyRegexp      rubyString
hi def link rubyInvalidVariable   Error
hi def link rubyError     Error
hi def link rubySpaceError    rubyError
"}}}
