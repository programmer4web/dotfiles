func! ZoomIn()
  let g:zoom_win=bufnr("$")
  let l:num_line = line(".")
  let l:num_column = col(".")
  exec "tabnew %"
  call cursor(l:num_line, l:num_column)
endfunc
func! ZoomOut()
  let l:num_line = line(".")
  let l:num_column = col(".")
  exec "wq"
  call cursor(l:num_line, l:num_column)
  unlet g:zoom_win
endfunc

func! ToggleZoom()
  if exists("g:zoom_win")
    call ZoomOut()
  else
    call ZoomIn()
  endif
endfunc

command! -nargs=0 ToggleZoom call ToggleZoom()
