let s:alphabet = 'abcdefghijklmnopqrstuvwxyz'
let s:cipher = 'zyxwvutsrqponmlkjihgfedcba'

"
" Create an implementation of the atbash cipher, an ancient encryption system
" created in the Middle East.
"
" Examples:
"
"   :echo AtbashEncode('test')
"   gvhg
"
"   :echo AtbashDecode('gvhg')
"   test
"
"   :echo AtbashDecode('gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt')
"   thequickbrownfoxjumpsoverthelazydog
"
function! AtbashDecode(cipher) abort
  let decoded = []
  let line = substitute(a:cipher, '\s', '', 'g')
  for chr in str2list(line)
    let decidx = stridx(s:alphabet, nr2char(chr))
    if decidx == -1
      let decoded += [nr2char(chr)]
    else
      let decoded += [s:cipher[decidx]]
    endif
  endfor

  return join(decoded, '')
endfunction

function! AtbashEncode(text) abort
  let ciphered = []
  let line = tolower(substitute(a:text, '\W', '', 'g'))
  for chr in str2list(line)
    let encidx = stridx(s:cipher, nr2char(chr))
    if encidx == -1
      let ciphered += [nr2char(chr)]
    else
      let ciphered += [s:alphabet[encidx]]
    endif
  endfor

  let ciphered = map(ciphered, {i, ch -> (i + 1) % 5 == 0 && (i + 1) != len(ciphered) ? ch . ' ' : ch})
  return join(ciphered, '')
endfunction
