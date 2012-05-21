""echomsg "begin sourcing tagbar powerline"
""
""echo g:Powerline#Colorschemes#default#colorscheme
""
""let s:tagbar_powerline = Pl#Segment#Init(['tagbar',
""  \ Pl#Segment#Create('sort','%{tagbar#powerline#GetSort()}')
""  \ ])
""
""let s:tagbar_powerline_colorscheme = Pl#Colorscheme#Init([
""  \ Pl#Hi#Segments(['tagbar:sort'],{
""    \ 'n' : ['brightgreen', 'darkgreen'],
""    \ 'N' : ['mediumgreen', 'darkestgreen']
""    \ })
""  \])
""
""echomsg string(s:tagbar_powerline_colorscheme)
""
""call extend(g:Powerline#Colorschemes#default#colorscheme, s:tagbar_powerline_colorscheme)
""
""let s:tagbar_powerline_theme = Pl#Theme#Create(
""  \ Pl#Theme#Buffer('tagbar'
""    \ , ['static_str.name', 'Tagbar']
""    \ , ['tagbar:sort']
""    \ , Pl#Segment#Truncate()
""    \ , Pl#Segment#Split()
""    \)
""  \)
""
""echomsg string(s:tagbar_powerline_theme)
""
""call extend(g:Powerline#Themes#default#theme, s:tagbar_powerline_theme)
""
""function! tagbar#powerline#GetSort() "{{{
""  echo 'called global powerline status'
""  let ret = TagbarGenerateStatusline()
""  let ret = substitute(ret, '[\|]','','g')
""endfunction
""" }]}
""
""" just hooking into the autoload functionality
""function! tagbar#powerline#setup()
""  echomsg "setup function called"
""  return
""endfunction
""
""echomsg "ended source of tagbar powerline"
