"
" Given a string of digits, calculate the largest product for a contiguous
" substring of digits of length n.
"
"   :echo LargestProduct('1234', 1)
"   4
"   :echo LargestProduct('1234', 2)
"   12
"   :echo LargestProduct('1234', 3)
"   24
"   :echo LargestProduct('1234', 4)
"   24
"
function! LargestProduct(digits, span) abort
  " All the error checks
  if a:span == 0 | return 1 | endif
  if a:span < 0 | return -1 | endif
  if a:digits =~? '[^0-9]' | throw 'invalid input' | endif
  if len(a:digits) < a:span | return -1 | endif

  let products = []
  let endIdx = a:span - 1
  for idx in range(0, len(a:digits) - a:span)
    let product = 1
    for num in str2list(a:digits[idx:idx+endIdx])
      let product *= nr2char(num)
    endfor
    let products += [product]
  endfor

  return max(products)
endfunction
