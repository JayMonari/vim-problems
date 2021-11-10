"
" This function takes any remark and returns Bob's response.
"
function! Response(remark) abort
  let stripped = substitute(a:remark, '\v[ \t\n\r]+', '', 'g')
  let upper = toupper(l:stripped)

  if stripped ==# ''
    return 'Fine. Be that way!'
  elseif s:is_yelling(l:stripped) && l:stripped =~# '?$'
    return "Calm down, I know what I'm doing!"
  elseif s:is_yelling(l:stripped)
    return 'Whoa, chill out!'
  elseif l:stripped =~# '?$'
    return 'Sure.'
  endif

  return 'Whatever.'
endfunction

function! s:is_yelling(line) abort
  return a:line ==# toupper(a:line) && a:line =~# '[A-Z]'
endfunction
