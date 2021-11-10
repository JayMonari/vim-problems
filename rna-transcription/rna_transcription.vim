"
" This function takes a DNA strand and returns its RNA complement.
"
"   G -> C
"   C -> G
"   T -> A
"   A -> U
"
" If the input is invalid, return an empty string.
"
" Example:
"
"   :echo ToRna('ACGTGGTCTTAA')
"   UGCACCAGAAUU
"
function! ToRna(strand) abort
  if a:strand !~# '\v^[ACGT]+$'
    return ""
  endif

  let rna = []
  for i in range(len(a:strand))
    let nuc = a:strand[i]
    if nuc ==# 'A' | let rna = add(rna, 'U') | endif
    if nuc ==# 'T' | let rna = add(rna, 'A') | endif
    if nuc ==# 'C' | let rna = add(rna, 'G') | endif
    if nuc ==# 'G' | let rna = add(rna, 'C') | endif
  endfor

  return join(rna, '')
endfunction
