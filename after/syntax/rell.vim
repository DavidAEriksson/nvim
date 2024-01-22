" Clear any existing syntax
syntax clear

" Define comments
syntax match rellComment "//.*" contains=@Comment
syntax region rellBlockComment start="/\*" end="\*/" contains=@Comment

" Define strings
syntax match rellString 'x".*"' contains=@String
syntax match rellString "x'.*'" contains=@String
syntax region rellString start='"' end='"' contains=@String
syntax region rellString start="'" end="'" contains=@String

" Define keywords
syntax keyword rellKeyword abstract class create delete entity enum false function guard in include index key limit list map module mutable namespace not null object offset operation or override query record set struct true update val var virtual and break continue else for if import return when while


hi def link rellComment Comment
hi def link rellBlockComment Comment
hi def link rellString String
hi def link rellKeyword Keyword
