"
" Given a DNA string, compute how many times each nucleotide occurs in the
" string.
"
" Examples:
"
"   :echo NucleotideCounts('ACGTACGT')
"   {'A': 2, 'C': 2, 'T': 2, 'G': 2}
"
"   :echo NucleotideCounts('ACGTXACGT')
"   E605: Exception not caught: Invalid nucleotide in strand
"
function! NucleotideCounts(strand) abort
  if a:strand !~# '^\v[ACGT]+$' && a:strand !=# ''
    throw 'Invalid nucleotide in strand'
  endif

  let ACount = count(a:strand, 'A')
  let CCount = count(a:strand, 'C')
  let GCount = count(a:strand, 'G')
  let TCount = count(a:strand, 'T')

  return  #{A: l:ACount, G: l:GCount, C: l:CCount, T: l:TCount}
endfunction
