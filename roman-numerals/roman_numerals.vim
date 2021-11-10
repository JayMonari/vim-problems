let s:numerals = [
      \ [ "M",  1000 ],
      \ [ "CM", 900 ],
      \ [ "D",  500 ],
      \ [ "CD", 400 ],
      \ [ "C",  100 ],
      \ [ "XC", 90 ],
      \ [ "L",  50 ],
      \ [ "XL", 40 ],
      \ [ "X",  10 ],
      \ [ "IX", 9 ],
      \ [ "V",  5 ],
      \ [ "IV", 4 ],
      \ [ "I",  1 ],
      \ ]

"
" Write a function to convert Arabic numbers to Roman numerals.
"
" Examples:
"
"   :echo ToRoman(1990)
"   MCMXC
"
"   :echo ToRoman(2008)
"   MMVIII
"
function! ToRoman(number) abort
  let num = a:number

  let numeral = ''
  for [ roman, value ] in s:numerals
    while num >= value
      let numeral .= roman
      let num -= value
    endwhile
  endfor

  return numeral
endfunction
