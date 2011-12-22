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
highlight Normal      guifg=#050a0f     guibg=#dddddd
highlight StatusLine      gui=NONE      guifg=#ebebeb     guibg=#74ebeb
highlight StatusLineNC      gui=NONE      guifg=#ebebeb     guibg=#636363
highlight VertSplit      gui=NONE      guifg=#ebebeb     guibg=#636363
highlight VCursor      guifg=#ebebeb     guibg=#000000
highlight CursorLine      guifg=#c25e00     guibg=#ebebeb
highlight Directory      gui=bold      guifg=#e77632
highlight Folded      gui=bold      guifg=#c880c8     guibg=#ebebeb
highlight FoldColumn      gui=NONE      guifg=#9b7b6b     guibg=#ebebeb
highlight SignColumn      gui=bold      guifg=#74ebeb     guibg=#ebebeb
highlight LineNr      gui=bold      guifg=#9b7b51     guibg=#ebebeb
highlight Visual      guibg=#ab916e
highlight Search      gui=NONE      guifg=#000000     guibg=#74ebeb
highlight IncSearch      gui=NONE      guifg=#000000     guibg=#74ebeb
highlight Pmenu      gui=NONE      guifg=#1f1f1f     guibg=#c9c9bc
highlight PmenuSel      gui=NONE      guifg=#000000     guibg=#dada00
highlight PmenuSbar      guibg=#ebb398
highlight PmenuThumb      gui=NONE      guifg=#c25e00     guibg=#ebebeb
highlight WildMenu      gui=NONE      guifg=#9b7b6b     guibg=#ebebeb
highlight MatchParen      gui=bold      guifg=#74ebeb     guibg=NONE
highlight DiffAdd      gui=NONE      guifg=#000000     guibg=#ebb5eb
highlight DiffChange      gui=NONE      guifg=#000000     guibg=#969696
highlight DiffDelete      gui=NONE      guifg=#000000     guibg=#74ebeb
highlight DiffText      gui=NONE      guifg=#000000     guibg=NONE
highlight SpellBad      gui=undercurl      guisp=#FF0000
highlight SpellCap      gui=undercurl      guisp=#FFFFFF
highlight SpellLocal      gui=undercurl      guisp=#EF4F23
highlight SpellRare      gui=undercurl      guisp=#EF4F23
highlight TabLine      gui=NONE      guifg=#9b7b6b     guibg=#ebebeb
highlight TabLineSel      gui=bold      guifg=#ebebeb     guibg=#9b7b6b
highlight TabLineFill      gui=NONE      guifg=#000000     guibg=#ebebeb
highlight Title      gui=bold      guifg=#9b7b6b     guibg=NONE
highlight SpecialKey      gui=None      guifg=#858585
highlight NonText      gui=None      guifg=#858585

"language elements from railscasts
highlight String      guifg=#46298a
highlight Type      gui=none      guifg=#7428AA
highlight Statement      gui=bold      guifg=#1F5293
highlight Comment      gui=italic      guifg=#ffffff guibg=#9ca9b8
highlight Constant      guifg=#e89664
highlight Define      guifg=#1F5293
highlight Error      guifg=#00257e     guibg=#52ebeb
highlight Function      gui=NONE      guifg=#0027d7
highlight Identifier      gui=NONE      guifg=#001fb8
highlight Include      gui=NONE      guifg=#1F5293
highlight PreCondit      gui=NONE      guifg=#1F5293
highlight Keyword      guifg=#11F529
highlight Number      guifg=#9c5648
highlight PreProc      guifg=#3e8aaa
highlight String      guifg=#46298a
highlight Special      guifg=#9c9c6e
highlight Delimiter      guifg=#9c9c6e
highlight pythonBuiltin      gui=none      guifg=#7e4f2d
highlight rubyBlockParameter      guifg=#4a4a00
highlight rubyRegexpSpecial      guifg=#940da6
highlight rubyConstant      guifg=#11a2b2
highlight rubyInterpolation      guifg=#9a4c9b
highlight rubyLocalVariableOrMethod      guifg=#8f7d95
highlight rubyPredefinedConstant      guifg=#11a2b2
highlight rubyStringDelimiter      guifg=#46298a
highlight rubyIdentifier      guifg=#3b3b00
highlight rubyInstanceVariable      guifg=#8e6a17
highlight rubySymbol      guifg=#cc6eb1
highlight rubyPseudoVariable      guifg=#802800
highlight link rubyBoolean   rubyPseudoVariable
highlight xmlTag      guifg=#032c81
highlight xmlTagName      guifg=#032c81
highlight xmlEndTag      guifg=#032c81

highlight mailSubject      guifg=#46298a
highlight mailHeaderKey      guifg=#00257e
highlight mailEmail      gui=italic      guifg=#46298a


highlight link rubyClass            Statement 

highlight vimHiGuiRgbi      guifg=#e89664
highlight vimNotation      guifg=#61eb19
highlight link vimBracket           vimNotation
highlight link vimMapModKey         vimNotation

"specialized things
highlight MBENormal      gui=NONE      guifg=#6e8dbc
highlight MBEChanged      gui=NONE      guifg=#535340     guibg=#96ebeb
highlight MBEVisibleNormal      gui=bold      guifg=#535340     
highlight MBEVisibleChanged gui=NONE      guifg=#535340     guibg=#74ebeb

