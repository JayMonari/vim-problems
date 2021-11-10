let s:scores = #{
    \ eggs: 1,
    \ peanuts: 2,
    \ shellfish: 4,
    \ strawberries: 8,
    \ tomatoes: 16,
    \ chocolate: 32,
    \ pollen: 64,
    \ cats: 128,
    \ }
let s:allergens = [
    \ "eggs",
    \ "peanuts",
    \ "shellfish",
    \ "strawberries",
    \ "tomatoes",
    \ "chocolate",
    \ "pollen",
    \ "cats",
    \ ]

"
" Given a person's allergy score, determine whether or not they're allergic to
" a given item, and their full list of allergies.
"
"   eggs          1
"   peanuts       2
"   shellfish     4
"   strawberries  8
"   tomatoes      16
"   chocolate     32
"   pollen        64
"   cats          128
"
" Examples:
"
"   :echo AllergicTo(5, 'shellfish')
"   1
"
"   :echo List(5)
"   ['eggs', 'shellfish']
"
function! AllergicTo(score, allergy) abort
    return and(a:score, s:scores[a:allergy]) != 0
endfunction

function! List(score) abort
    let allergies = []
    for i in range(len(s:scores))
        if and(a:score, float2nr(pow(2, (i)))) != 0
            let allergies += [s:allergens[i]]
        endif
    endfor

    return allergies
endfunction
