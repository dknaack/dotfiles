syn keyword cType i8 i16 i32 i64 isz u8 u16 u32 u64 usz f32 f64 uint
syn keyword cType v2 v3 v4 m3x3 m4x4 m4x4_inv string box2 box3 box4
syn keyword cKeyword static const volatile inline case default typedef extern
syn keyword Number NULL true false
syn match cOperator "\v\="
syn match cOperator "\v\+"
syn match cOperator "\v\-"
syn match cOperator "\v\*"
syn match cOperator "\v\/"
syn match cOperator "\v\>"
syn match cOperator "\v\<"
syn match cOperator "\v!"
syn match cOperator "\v\&"
syn match cOperator "\v\|"
syn match cOperator "\v\^"
syn match cOperator "\v\."
syn match cComment "\v\/\/.*$"
syn region cComment start="\/\*" end="\*\/"
syn match cTodo /\<TODO\>/ containedin=cComment
syn match cNote /\<NOTE\>/ containedin=cComment
syn match cType "\v<struct>\s+[a-zA-Z0-9_]+"hs=s+7 containedin=cKeyword
syn match cType "\v<union>\s+[a-zA-Z0-9_]+"hs=s+6 containedin=cKeyword
syn match cType "\v<enum>\s+[a-zA-Z0-9_]+"hs=s+5 containedin=cKeyword
syn match cKeyword "\v<struct>"
syn match cKeyword "\v<union>"
syn match cKeyword "\v<enum>"
syn clear cStructure

hi link cType Type
hi link cKeyword Keyword
hi link cOperator Operator
hi link cConstant Constant
hi link cComment Comment
hi link cNote Constant
hi link cTodo Keyword
