"
" Clean up user-entered phone numbers so that they can be sent SMS messages.
"
" Example:
"
"   :echo ToNANP('+1 (613)-995-0253')
"   6139950253
"
function! ToNANP(number) abort
  let cleaned = substitute(a:number, '[^0-9]', '', 'g')
  " Validate length and country code
  if len(l:cleaned) < 10 || len(l:cleaned) > 11
    return ''
  elseif len(l:cleaned) == 11 && l:cleaned[0] !=# '1'
    return ''
  endif

  " Remove country code
  if len(l:cleaned) == 11
    let cleaned = l:cleaned[1:]
  endif

  " Validate area code and exchange code
  if str2nr(l:cleaned[0]) < 2 || str2nr(l:cleaned[3]) < 2
    return ''
  endif

  return l:cleaned
endfunction
