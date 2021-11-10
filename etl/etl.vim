"
" We are going to do the Transform step of an Extract-Transform-Load.
"
" Example:
"
"   :echo Transform({'1': ['a', 'b'], '2': ['c']})
"   {'a': 1, 'b': 1, 'c': 2}
"
function! Transform(scores) abort
  let transformed = {}
  for [score, charList] in items(a:scores)
    for chr in charList
      let transformed[tolower(chr)] = str2nr(score)
    endfor
  endfor

  return transformed
endfunction
