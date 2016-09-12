"===============================================================================
" Cursor class
"===============================================================================
let s:Cursor = {}

" Create a new cursor. Highlight it and save the current line length
function! s:Cursor.new(position)
  let obj = copy(self)
  let obj.position = copy(a:position)
  let obj.visual = []
  let obj.saved_visual = []
  " Stores text that was yanked after any commands in Normal or Visual mode
  let obj.paste_buffer_text = getreg('"')
  let obj.paste_buffer_type = getregtype('"')
  let obj.cursor_hi_id = s:highlight_cursor(a:position)
  let obj.visual_hi_id = 0
  let obj.line_length = col([a:position[0], '$'])
  if has('folding')
    silent! execute a:position[0] . "foldopen!"
  endif
  return obj
endfunction

" Return the line the cursor is on
function! s:Cursor.line() dict
  return self.position[0]
endfunction

" Return the column the cursor is on
function! s:Cursor.column() dict
  return self.position[1]
endfunction

" Move the cursor location by the number of lines and columns specified in the
" input. The input can be negative.
function! s:Cursor.move(line, column) dict
  let self.position[0] += a:line
  let self.position[1] += a:column
  if !empty(self.visual)
    let self.visual[0][0] += a:line
    let self.visual[0][1] += a:column
    let self.visual[1][0] += a:line
    let self.visual[1][1] += a:column
  endif
  call self.update_highlight()
endfunction

" Update the current position of the cursor
function! s:Cursor.update_position(pos) dict
  let self.position[0] = a:pos[0]
  let self.position[1] = a:pos[1]
  call self.update_highlight()
endfunction

" Reapply the highlight on the cursor
function! s:Cursor.update_highlight() dict
  call s:cm.remove_highlight(self.cursor_hi_id)
  let self.cursor_hi_id = s:highlight_cursor(self.position)
endfunction

" Refresh the length of the line the cursor is on. This could change from
" underneath
function! s:Cursor.update_line_length() dict
  let self.line_length = col([self.line(), '$'])
endfunction

" Update the visual selection and its highlight
function! s:Cursor.update_visual_selection(region) dict
  let self.visual = deepcopy(a:region)
  call s:cm.remove_highlight(self.visual_hi_id)
  let self.visual_hi_id = s:highlight_region(a:region)
endfunction

" Remove the visual selection and its highlight
function! s:Cursor.remove_visual_selection() dict
  let self.saved_visual = deepcopy(self.visual)
  let self.visual = []
  " TODO(terryma): Move functionality into separate class
  call s:cm.remove_highlight(self.visual_hi_id)
  let self.visual_hi_id = 0
endfunction

" Restore unnamed register from paste buffer
function! s:Cursor.restore_unnamed_register() dict
  call setreg('"', self.paste_buffer_text, self.paste_buffer_type)
endfunction

" Save contents of the unnamed register into paste buffer
function! s:Cursor.save_unnamed_register() dict
  let self.paste_buffer_text = getreg('"')
  let self.paste_buffer_type = getregtype('"')
endfunction
