"
" Determine if a sentence is a pangram.
"
" A pangram is a sentence using every letter of the alphabet at least once.
"
" The alphabet used consists of ASCII letters a to z, inclusive, and is case
" insensitive. Input will not contain non-ASCII symbols.
"
" Example:
"
"     :echo IsPangram('The quick brown fox jumps over the lazy dog')
"     1
"     :echo IsPangram('The quick brown fox jumps over the lazy do')
"     0
"

function! IsPangram(sentence) abort
  let lower = tolower(a:sentence)
  for letter in range(char2nr('a'), char2nr('z'))
    if match(l:lower, nr2char(letter)) == -1
      return 0
    endif
  endfor

  return 1
endfunction
