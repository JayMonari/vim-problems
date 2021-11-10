"
" Produce the lyrics to that beloved classic, that field-trip favorite: 99
" Bottles of Beer on the Wall.
"
"   :echo Verse(99)
"   99 bottles of beer on the wall, 99 bottles of beer.
"   Take one down and pass it around, 98 bottles of beer on the wall.
"
"
"   :echo Verses(99, 98)
"   99 bottles of beer on the wall, 99 bottles of beer.
"   Take one down and pass it around, 98 bottles of beer on the wall.
"
"   98 bottles of beer on the wall, 98 bottles of beer.
"   Take one down and pass it around, 97 bottles of beer on the wall.
"
function! Verse(verse) abort
  let n = a:verse
  if n == 2
    return "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  elseif n == 1
    return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  elseif n == 0
    return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  endif

  return printf("%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n", n, n, n-1)
endfunction

function! Verses(start, end) abort
  let verses = []
  for v in range(a:start, a:end, -1)
    let verses += [Verse(v)]
  endfor
  return join(verses, "\n")
endfunction
