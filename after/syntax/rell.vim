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

hi def link rellComment Comment
hi def link rellBlockComment Comment
hi def link rellString String
