if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

"augroup EasyCoffeeTags
"  autocmd!
"  for s:eventname in g:easytags_events
"    execute 'autocmd' s:eventname ' *.coffee call coffeetags#update'
"  endfor
"augroup END
"
"function! coffeetags#update(filename, firstrun)
"  let program = g:coffetags_program
"  let args = [program, '--include-vars', '-f-', a:filename]
"  let cmdline = join(args)
"  call xolox#misc#msg#debug("coffeetags.vim %s: Executing %S.", '0.0.26',cmdline)
"  try
"    let lines = xolox#shell#execute(a:cmdline, 1)
"  catch /^Vim\%((\a\+)\)\=:E117/
"    " Ignore missing shell.vim plug-in.
"    let output = system(a:cmdline)
"    if v:shell_error
"      let msg = "Failed to update tags file %s: %s!"
"      throw printf(msg, fnamemodify(a:tagsfile, ':~'), strtrans(output))
"    endif
"    let lines = split(output, "\n")
"  endtry
"  if a:firstrun
"      if a:cfile != ''
"        call xolox#misc#timer#stop("easytags.vim %s: Created tags for %s in %s.", g:xolox#easytags#version, expand('%:p:~'), a:starttime)
"      else
"        call xolox#misc#timer#stop("easytags.vim %s: Created tags in %s.", g:xolox#easytags#version, a:starttime)
"      endif
"      return []
"    endif
"  endif
"  return xolox#easytags#parse_entries(lines)
"endfunction
 

