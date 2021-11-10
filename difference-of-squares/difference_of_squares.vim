"
" Find the difference between the square of the sum and the sum of the squares
" of the first N natural numbers.
"
" Examples:
"
"   :echo SquareOfSum(3)
"   36
"   :echo SumOfSquares(3)
"   14
"   :echo DifferenceOfSquares(3)
"   22
"
function! DifferenceOfSquares(number) abort
  return SquareOfSum(a:number) - SumOfSquares(a:number)
endfunction

function! SquareOfSum(number) abort
  let sum = 0
  for num in range(1, a:number)
    let sum += l:num
  endfor

  return float2nr(pow(l:sum, 2))
endfunction

function! SumOfSquares(number) abort
  let sum = 0
  for num in range(1, a:number)
    let sum += pow(l:num, 2)
  endfor

  return float2nr(l:sum)
endfunction
