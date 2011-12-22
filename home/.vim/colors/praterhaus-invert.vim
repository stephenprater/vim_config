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
highlight Normal      guifg=#191e23     guibg=#efefef
highlight StatusLine      gui=NONE      guifg=#ffffff     guibg=#88ffff
highlight StatusLineNC      gui=NONE      guifg=#ffffff     guibg=#777777
highlight VertSplit      gui=NONE      guifg=#ffffff     guibg=#777777
highlight VCursor      guifg=#ffffff     guibg=#000000
highlight CursorLine      guifg=#d67200     guibg=#ffffff
highlight Directory      gui=bold      guifg=#fb8a46
highlight Folded      gui=bold      guifg=#dc94dc     guibg=#ffffff
highlight FoldColumn      gui=NONE      guifg=#af8f7f     guibg=#ffffff
highlight SignColumn      gui=bold      guifg=#88ffff     guibg=#ffffff
highlight LineNr      gui=bold      guifg=#af8f65     guibg=#ffffff
highlight Visual      guibg=#bfa582
highlight Search      gui=NONE      guifg=#000000     guibg=#88ffff
highlight IncSearch      gui=NONE      guifg=#000000     guibg=#88ffff
highlight Pmenu      gui=NONE      guifg=#333333     guibg=#ddddd0
highlight PmenuSel      gui=NONE      guifg=#000000     guibg=#eeee00
highlight PmenuSbar      guibg=#ffc7ac
highlight PmenuThumb      gui=NONE      guifg=#d67200     guibg=#ffffff
highlight WildMenu      gui=NONE      guifg=#af8f7f     guibg=#ffffff
highlight MatchParen      gui=bold      guifg=#88ffff     guibg=NONE
highlight VisualNOS      gui=underline      guifg=NONE guibg=#88ffff
highlight DiffAdd      gui=NONE      guifg=#000000     guibg=#ffc9ff
highlight DiffChange      gui=NONE      guifg=#000000     guibg=#aaaaaa
highlight DiffDelete      gui=NONE      guifg=#000000     guibg=#88ffff
highlight DiffText      gui=NONE      guifg=#000000     guibg=NONE
highlight SpellBad      gui=undercurl      guisp=#FF0000
highlight SpellCap      gui=undercurl      guisp=#FFFFFF
highlight SpellLocal      gui=undercurl      guisp=#EF4F23
highlight SpellRare      gui=undercurl      guisp=#EF4F23
highlight TabLine      gui=NONE      guifg=#af8f7f     guibg=#ffffff
highlight TabLineSel      gui=bold      guifg=#ffffff     guibg=#af8f7f
highlight TabLineFill      gui=NONE      guifg=#000000     guibg=#ffffff
highlight Title      gui=bold      guifg=#af8f7f     guibg=NONE
highlight SpecialKey      gui=None      guifg=#999999
highlight NonText      gui=None      guifg=#999999

"language elements from railscasts
highlight String      guifg=#5a3d9e
highlight Type      gui=none      guifg=#be85c5
highlight Statement      gui=bold      guifg=#4080ff
highlight Comment      gui=italic      guifg=#ffffff     guibg=#b0bdcc
highlight Constant      guifg=#fcaa78
highlight Define      guifg=#3387cc
highlight Error      guifg=#003992     guibg=#66ffff
highlight Function      gui=NONE      guifg=#003beb
highlight Identifier      gui=NONE      guifg=#0033cc
highlight Include      gui=NONE      guifg=#3387cc
highlight PreCondit      gui=NONE      guifg=#3387cc
highlight Keyword      guifg=#3387cc
highlight Number      guifg=#b06a5c
highlight PreProc      guifg=#529ebe
highlight Statement      gui=NONE      guifg=#3387cc
highlight String      guifg=#5a3d9e
highlight Special      guifg=#b0b082
highlight Delimiter      guifg=#b0b082
highlight pythonBuiltin      gui=none      guifg=#926341
highlight rubyBlockParameter      guifg=#5e5e00
highlight rubyRegexpSpecial      guifg=#a821ba
highlight rubyConstant      guifg=#25b6c6
highlight rubyInterpolation      guifg=#ae60af
highlight rubyLocalVariableOrMethod      guifg=#a391a9
highlight rubyPredefinedConstant      guifg=#25b6c6
highlight rubyStringDelimiter      guifg=#5a3d9e
highlight rubyIdentifier      guifg=#4f4f00
highlight rubyInstanceVariable      guifg=#a27e2b
highlight rubySymbol      guifg=#e082c5
highlight rubyPseudoVariable      guifg=#943c05
highlight link rubyBoolean   rubyPseudoVariable
highlight xmlTag      guifg=#174095
highlight xmlTagName      guifg=#174095
highlight xmlEndTag      guifg=#174095

highlight mailSubject      guifg=#5a3d9e
highlight mailHeaderKey      guifg=#003992
highlight mailEmail      gui=italic      guifg=#5a3d9e


highlight link rubyClass            Statement 

highlight vimHiGuiRgbi      guifg=#fcaa78
highlight vimNotation      guifg=#75ff2d
highlight link vimBracket           vimNotation
highlight link vimMapModKey         vimNotation

"specialized things
highlight MBENormal      gui=NONE      guifg=#82a1d0
highlight MBEChanged      gui=NONE      guifg=#676754     guibg=#aaffff
highlight MBEVisibleNormal      gui=bold      guifg=#676754     
highlight MBEVisibleChanged gui=NONE      guifg=#676754     guibg=#88ffff

