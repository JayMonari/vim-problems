"
" Given a phrase, return a dictionary containing the count of occurrences of
" each word.
"
" Example:
"
"   :echo WordCount('olly olly in come free')
"   {'olly': 2, 'come': 1, 'in': 1, 'free': 1}
"
function! WordCount(phrase) abort
  let counter = {}

  let words = s:way_to_much_sanitization(a:phrase)
  for word in words
    if !has_key(counter, word)
      let counter[word] = count(words, word)
    endif
  endfor

  return counter
endfunction

function! s:way_to_much_sanitization(phrase)
  " Remove anything that is not alnum or '
  let cleaned = tolower(substitute(a:phrase, '[^A-Za-z0-9'']', ' ', 'g'))
  " Create list from string and remove any empty strings in that list
  let filtered = filter(split(cleaned, ' '), "v:val != ''")
  " Find values that are wrapped in single quotes and remove quotes
  let finalList = map(filtered, "v:val =~? '''.*''' ? v:val[1:-2] : v:val")
  return finalList
endfunction
