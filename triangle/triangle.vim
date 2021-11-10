"
" Determine if a triangle is equilateral, isosceles, or scalene.
"
" An equilateral triangle has all three sides the same length.
"
" An isosceles triangle has at least two sides the same length.
" (It is sometimes specified as having exactly two sides the
" same length, but for the purposes of this exercise we'll say
" at least two.)
"
" A scalene triangle has all sides of different lengths.
"

function! Equilateral(triangle) abort
  let sides = sort(copy(a:triangle))
  return s:Valid(sides) && len(uniq(sides)) == 1
endfunction

function! Isosceles(triangle) abort
  let sides = sort(copy(a:triangle))
  return s:Valid(sides) && len(uniq(sides)) <= 2
endfunction

function! Scalene(triangle) abort
  let sides = sort(copy(a:triangle))
  return s:Valid(sides) && len(uniq(sides)) == 3
endfunction

function! s:Valid(triangle)
  let [a, b, c] = a:triangle
  return a > 0 && b > 0 && c > 0 && a + b > c
endfunction

