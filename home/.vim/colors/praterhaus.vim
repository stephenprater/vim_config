" Vim color file - adapted from railscasts256 and northland
"
set background=dark
hi clear
if exists("syntax on")
  syntax reset
endif

let g:colors_name="praterhaus"

"===== :he higighlit groups
"

"Gui elements from northland
highlight Normal                            guifg=#E6E1DC       guibg=#171717
highlight StatusLine         gui=NONE       guifg=#000000       guibg=#770000
highlight StatusLineNC       gui=NONE       guifg=#000000       guibg=#888888
highlight VertSplit          gui=NONE       guifg=#000000       guibg=#888888
highlight VCursor                           guifg=#000000       guibg=#FFFFFF
highlight CursorLine                        guifg=#298DFF       guibg=#000000
highlight Directory          gui=bold       guifg=#0475B9
highlight Folded             gui=bold       guifg=#236B23       guibg=#000000
highlight FoldColumn         gui=NONE       guifg=#507080       guibg=#000000
highlight SignColumn         gui=bold       guifg=#770000       guibg=#000000
highlight LineNr             gui=bold       guifg=#50709A      guibg=#000000
highlight Visual                            guibg=#405A7D
highlight Search             gui=NONE       guifg=#FFFFFF       guibg=#770000
highlight IncSearch          gui=NONE       guifg=#FFFFFF       guibg=#770000
highlight Pmenu              gui=NONE       guifg=#CCCCCC       guibg=#22222F
highlight PmenuSel           gui=NONE       guifg=#FFFFFF       guibg=#1111FF
highlight PmenuSbar                                             guibg=#003853
highlight PmenuThumb         gui=NONE       guifg=#298DFF       guibg=#000000
highlight WildMenu           gui=NONE       guifg=#507080       guibg=#000000
highlight MatchParen         gui=bold       guifg=#770000       guibg=NONE
highlight VisualNOS          gui=underline  guifg=NONE          guibg=#770000
highlight DiffAdd            gui=NONE       guifg=#FFFFFF       guibg=#003600
highlight DiffChange         gui=NONE       guifg=#FFFFFF       guibg=#555555
highlight DiffDelete         gui=NONE       guifg=#FFFFFF       guibg=#770000
highlight DiffText           gui=NONE       guifg=#FFFFFF       guibg=NONE
highlight SpellBad           gui=undercurl                                          guisp=#FF0000
highlight SpellCap           gui=undercurl                                          guisp=#FFFFFF
highlight SpellLocal         gui=undercurl                                          guisp=#EF4F23
highlight SpellRare          gui=undercurl                                          guisp=#EF4F23
highlight TabLine            gui=NONE       guifg=#507080       guibg=#000000
highlight TabLineSel         gui=bold       guifg=#000000       guibg=#507080
highlight TabLineFill        gui=NONE       guifg=#FFFFFF       guibg=#000000
highlight Title              gui=bold       guifg=#507080       guibg=NONE
highlight SpecialKey         gui=None       guifg=#666666
highlight NonText            gui=None       guifg=#666666

"language elements from railscasts
highlight String                            guifg=#A5C261
highlight Type               gui=none       guifg=#417A3A
highlight Statement          gui=bold       guifg=#BF7F00
highlight Comment            gui=italic     guifg=#000000       guibg=#4F4233
highlight Constant                          guifg=#035587
highlight Define                            guifg=#CC7833
highlight Error                             guifg=#FFC66D       guibg=#990000
highlight Function           gui=NONE       guifg=#FFC414
highlight Identifier         gui=NONE       guifg=#FFCC33
highlight Include            gui=NONE       guifg=#CC7833
highlight PreCondit          gui=NONE       guifg=#CC7833
highlight Keyword                           guifg=#CC7833
highlight Number                            guifg=#4F95A3
highlight PreProc                           guifg=#AD6141
highlight Statement          gui=NONE       guifg=#CC7833
highlight String                            guifg=#A5C261
highlight Special                           guifg=#4F4F7D
highlight Delimiter                         guifg=#4F4F7D
highlight pythonBuiltin      gui=none       guifg=#6D9CBE
highlight rubyBlockParameter                guifg=#A1A1FF
highlight rubyRegexpSpecial                 guifg=#57DE45
highlight rubyConstant                      guifg=#DA4939
highlight rubyInterpolation                 guifg=#519F50
highlight rubyLocalVariableOrMethod         guifg=#5C6E56
highlight rubyPredefinedConstant            guifg=#DA4939
highlight rubyStringDelimiter               guifg=#A5C261
highlight rubyIdentifier                    guifg=#B0B0FF
highlight rubyInstanceVariable              guifg=#5D81D4
highlight rubySymbol                        guifg=#1F7D3A
highlight rubyPseudoVariable                guifg=#6BC3FA

highlight rubyMethodDeclaration             
highlight rubyMethodBlock                   
highlight rubyMethodParameter               
highlight link rubyMethodName Function

highlight link rubyBoolean   rubyPseudoVariable
highlight xmlTag                            guifg=#E8BF6A
highlight xmlTagName                        guifg=#E8BF6A
highlight xmlEndTag                         guifg=#E8BF6A

highlight mailSubject                       guifg=#A5C261
highlight mailHeaderKey                     guifg=#FFC66D
highlight mailEmail         gui=italic      guifg=#A5C261
highlight rubyOperator                      guifg=#878700
highlight rubyBrackets                      guifg=#888888
highlight rubyExpressionDelimiter           guifg=#888888
highlight rubyPunctuation                   guifg=#888822
highlight rubyLocalMethodCall               guifg=#8F8772
highlight rubyObjectMethodCall              guifg=#D1AF58
highlight Normal                            guifg=#DDDDDD
highlight link rubyExpressionDelimiter rubyBrackets
highlight link rubyBlockParameter rubyBrackets
highlight link rubyBlockArgument rubyBlockParameter
highlight link rubyTernary rubyControl
highlight link rubyHashAssignment rubyOperator
highlight link rubyAssignment rubyOperator
highlight link rubyInterpolationDelimiter Delimiter

highlight link rubyClass            Statement 
highlight link rubyDefine           Statement

highlight vimHiGuiRgbi                      guifg=#035587
highlight vimNotation                       guifg=#8A00D2
highlight link vimBracket           vimNotation
highlight link vimMapModKey         vimNotation

"specialized things
highlight MBENormal         gui=NONE        guifg=#7D5E2F
highlight MBEChanged        gui=NONE        guifg=#9898AB      guibg=#550000
highlight MBEVisibleNormal  gui=bold        guifg=#9898AB      
highlight MBEVisibleChanged gui=NONE        guifg=#9898AB      guibg=#770000

