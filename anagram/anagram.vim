"
" Given a word and a list of possible anagrams, select the correct sublist.
"
" Example:
"
"   :echo FindAnagrams(['foo', 'bar', 'oof', 'Ofo'], 'foo')
"   ['Ofo', 'oof']
"
function! FindAnagrams(candidates, subject) abort
  let anagrams = []
  let target = sort(str2list(tolower(a:subject)))
  for word in a:candidates
    let sorted = sort(str2list(tolower(word)))
    if target ==# sorted && a:subject !=? word
      let anagrams += [word]
    endif
  endfor

  return anagrams
endfunction
