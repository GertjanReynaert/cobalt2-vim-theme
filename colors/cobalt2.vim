" Vim color file
" Author: Gertjan Reynaert (port from theme of Wes Bos)
" Notes:  Cobalt2 color scheme port for VIM

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "cobalt"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  let s:low_color = 0
else
  let s:low_color = 1
endif
" Color approximation functions by Henry So, Jr. and David Liang

" returns an approximate grey index for the given grey level
fun! s:grey_number(x)
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" returns the actual grey level represented by the grey index
fun! s:grey_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endif
endfun

" returns the palette index for the given grey index
fun! s:grey_color(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfun

" returns an approximate color index for the given color level
fun! s:rgb_number(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" returns the actual color level for the given color index
fun! s:rgb_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endif
endfun

" returns the palette index for the given R/G/B color indices
fun! s:rgb_color(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
  " get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " get the closest color
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " there are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " use the grey
      return s:grey_color(l:gx)
    else
      " use the color
      return s:rgb_color(l:x, l:y, l:z)
    endif
  else
    " only one possibility
    return s:rgb_color(l:x, l:y, l:z)
  endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
  return s:color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr, lcfg, lcbg)
  if s:low_color
    let l:fge = empty(a:lcfg)
    let l:bge = empty(a:lcbg)

    if !l:fge && !l:bge
      exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=".a:lcbg
    elseif !l:fge && l:bge
      exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=NONE"
    elseif l:fge && !l:bge
      exec "hi ".a:group." ctermfg=NONE ctermbg=".a:lcbg
    endif
  else
    let l:fge = empty(a:fg)
    let l:bge = empty(a:bg)

    if !l:fge && !l:bge
      exec "hi ".a:group." guifg=#".a:fg." guibg=#".a:bg." ctermfg=".s:rgb(a:fg)." ctermbg=".s:rgb(a:bg)
    elseif !l:fge && l:bge
      exec "hi ".a:group." guifg=#".a:fg." guibg=NONE ctermfg=".s:rgb(a:fg)." ctermbg=NONE"
    elseif l:fge && !l:bge
      exec "hi ".a:group." guifg=NONE guibg=#".a:bg." ctermfg=NONE ctermbg=".s:rgb(a:bg)
    endif
  endif

  if a:attr == ""
    exec "hi ".a:group." gui=none cterm=none"
  else
    let l:noitalic = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
    if empty(l:noitalic)
      let l:noitalic = "none"
    endif
    exec "hi ".a:group." gui=".a:attr." cterm=".l:noitalic
  endif
endfun

if !exists("g:cobalt_bg")
  let g:cobalt_bg = "193549"
end

let g:black = "000000"         " #000000
let g:light_grey = "CCCCCC"    " #CCCCCC
let g:white = "FFFFFF"         " #FFFFFF
let g:dark_orange = "FF9A00"   " #FF9A00
let g:light_orange = "FF9D00"  " #FF9D00
let g:yellow = "FFC600"        " #FFC600
let g:green = "3AD900"         " #3AD900
let g:light_green = "193549"
let g:purple = "967EFB"        " #967EFB
let g:darkest_blue = "0050A4"  " #0050A4
let g:dark_blue = "0088FF"     " #0088FF
let g:blue = "00AAFF"          " #00AAFF
let g:light_blue = "80FCFF"    " #80FCFF
let g:dark_red = "902020"      " #902020
let g:red = "FF0000"           " #FF0000
let g:dark_pink = "FF628C"     " #FF628C
let g:pink = "FF00FF"          " #FF00FF
let g:light_pink = "EE80E1"    " #EE80E1
let g:lightest_pink = "FFA5F3" " #FFA5F3

" regex
let g:regex_or = "22FF00"         " #22FF00
let g:regex_group = "22FF00"      " #22FF00
let g:regex_quantifier = "55FF66" " #55FF66
let g:regex_boundary = "88FF88"   " #88FF88
let g:regex_char_group = "9DFF99" " #9DFF99
let g:regex_string = "BBFFDD"     " #BBFFDD

call s:X("Normal",g:white,g:cobalt_bg,"","White","")
set background=dark

let s:termBlack = "Black"

call s:X("MatchParen",g:white,"556779","bold","","DarkCyan")

" vim tabpane headers
call s:X("TabLine",g:black,"b0b8c0","italic","",s:termBlack)
call s:X("TabLineFill","9098a0","","","",s:termBlack)
call s:X("TabLineSel",g:black,g:yellow,"italic,bold",s:termBlack,"White")

" Auto-completion
call s:X("Pmenu",g:white,"606060","","White",s:termBlack)
call s:X("PmenuSel","101010","eeeeee","",s:termBlack,"White")

call s:X("Visual","",g:darkest_blue,"","",s:termBlack)

call s:X("Cursor",g:cobalt_bg,g:yellow,"","","")
call s:X("CursorColumn","",g:yellow,"","",s:termBlack)
call s:X("CursorLine","",g:yellow,"","",s:termBlack)
call s:X("CursorLineNr",g:light_blue,"","none","White","")

call s:X("LineNr","605958",g:cobalt_bg,"none",s:termBlack,"")
call s:X("Comment",g:dark_blue,"","italic","Grey","")
call s:X("Todo",g:dark_blue,"","bold","Grey", "")

call s:X("StatusLine",g:black,"dddddd","italic","","White")
call s:X("StatusLineNC",g:white,"403c41","italic","White","Black")
call s:X("VertSplit",g:yellow,"","","","")
call s:X("WildMenu","f0a0c0","302028","","Magenta","")

call s:X("Folded","a0a8b0","384048","italic",s:termBlack,"")
call s:X("FoldColumn","535D66","1f1f1f","","",s:termBlack)
call s:X("SignColumn","777777","333333","","",s:termBlack)
call s:X("ColorColumn","",g:black,"","",s:termBlack)

call s:X("Title","70b950","","bold","Green","")

call s:X("Constant",g:dark_pink,"","","Red","")
call s:X("Special","80FF82","","","Green","")
call s:X("Delimiter","668799","","","Grey","")

call s:X("String",g:green,"","","Green","")
call s:X("StringDelimiter",g:green,"","","Green","")

call s:X("Identifier",g:dark_orange,"","",g:dark_orange,"")
hi! link Structure Comment
" call s:X("Structure","#8fbfdc","","","LightCyan","")
call s:X("Function",g:yellow,"","","","")
call s:X("Statement",g:dark_orange,"","","","")
hi! link PreProc Identifier

hi! link Operator Structure

call s:X("Type",g:yellow,"","","Yellow","")
call s:X("NonText","606060",g:cobalt_bg,"",s:termBlack,"")

call s:X("SpecialKey","444444","1c1c1c","",s:termBlack,"")

call s:X("Search",g:yellow,"302028","underline","Magenta","")

call s:X("Directory","dad085","","","Yellow","")
call s:X("ErrorMsg","",g:dark_red,"","","DarkRed")
hi! link Error ErrorMsg
hi! link MoreMsg Special
call s:X("Question","65C254","","","Green","")

" Spell Checking

call s:X("SpellBad",g:dark_red,"","underline","","DarkRed")
call s:X("SpellCap","","0000df","underline","","Blue")
call s:X("SpellRare","","540063","underline","","DarkMagenta")
call s:X("SpellLocal","","2D7067","underline","","Green")

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String

" VimDiff

call s:X("DiffAdd","D2EBBE","437019","","White","DarkGreen")
call s:X("DiffDelete","40000A","700009","","DarkRed","DarkRed")
call s:X("DiffChange","","2B5B77","","White","DarkBlue")
call s:X("DiffText","8fbfdc",g:black,"reverse","Yellow","")

" PHP

hi! link phpFunctions Function
call s:X("StorageClass","c59f6f","","","Red","")
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python

hi! link pythonOperator Statement

" Ruby

call s:X("rubyClass",g:dark_orange,"","","DarkBlue","")
hi! link rubyModule rubyClass

call s:X("rubyInstanceVariable",g:light_grey,"","","Cyan","")
call s:X("rubySymbol",g:dark_pink,"","","Magenta","")
hi! link rubyGlobalVariable rubyInstanceVariable

call s:X("rubyAccess",g:purple,"","","","")

" params between pipes after do, and pipes themselfs
call s:X("rubyBlockParameter",g:light_grey,"","","Blue","")
call s:X("rubyBlockParameterList",g:white,"","","Blue","")

call s:X("rubyInterpolation","9EFF80","","","Magenta","")
call s:X("rubyInterpolationDelimiter",g:white,"","","Magenta","")

call s:X("rubyRegexpDelimiter","80FFC2","","","","")
call s:X("rubyRegexp","80FFC2","","","","")
call s:X("rubyRegexpSpecial",g:white,"","","","")
call s:X("rubyRegexpEscape","80FFC2","","","","")

" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp

call s:X("jsFunction",g:light_pink,"","","","")
call s:X("jsFuncCall",g:yellow,"","","","")
call s:X("jsOperator",g:light_orange,"","","","")
call s:X("jsStorageClass",g:yellow,"","","","")
call s:X("jsFuncArgs",g:light_grey,"","","","")

call s:X("jsBuiltins",g:light_orange,"","","","")
call s:X("jsUndefined",g:dark_pink,"","","","")
call s:X("jsThis",g:light_pink,"","","","")
call s:X("jsPrototype","EB939A","","","","")

call s:X("jsRegexpOr","22FF00","","","","")         " #22FF00 | highlight
call s:X("jsRegexpQuantifier","55FF66","","","","") " #55FF66 ? and {4}
call s:X("jsRegexpGroup","22FF00","","","","")      " #22FF00 ( and )
call s:X("jsRegexpBoundary","88FF88","","","","")   " #88FF88 start and end of regex
call s:X("jsRegexpCharClass","9DFF99","","","","")  " #9DFF99 [A-z]
call s:X("jsRegexpString","BBFFDD","","","","")     " #BBFFDD regular text
call s:X("jsRegexpMod",g:pink,"","","","")
call s:X("jsRegexpBackRef",g:light_orange,"","","","")

" CoffeeScript

hi! link coffeeComment comment
hi! link coffeeBlockComment comment
hi! link coffeeTodo comment
hi! link coffeeHeregexComment comment
call s:X("coffeeKeyword",g:dark_orange,"","","","")
call s:X("coffeeObject",g:blue,"","","","")
call s:X("coffeeObjAssign",g:yellow,"","","","")
call s:X("coffeeExtendedOp",g:dark_orange,"","","","")
call s:X("coffeeParen",g:light_grey,"","","","")
call s:X("coffeeParens",g:light_grey,"","","","")
call s:X("coffeeSpecialOp",g:light_grey,"","","","")
call s:X("coffeeStatement",g:dark_orange,"","","","")
hi! link coffeeString String
hi! link coffeeHeredoc String
call s:X("coffeeInterpDelim",g:white,"","","","")
call s:X("coffeeInterp","9EFF80","","","","")         " #9EFF80
call s:X("coffeeRegex","80FFC2","","","","")          " #80FFC2
call s:X("coffeeEscape","98F99D","","","","")         " #98F99D
call s:X("coffeeRegexCharSet","22FF00","","","","")   " #22FF00
call s:X("coffeeHeregex","80FFC2","","","","")        " #80FFC2
call s:X("coffeeHeregexCharSet","22FF00","","","","") " #22FF00
call s:X("coffeeSpecialIdent",g:light_grey,"","","","")
call s:X("coffeeBracket",g:white,"","","","")
call s:X("coffeeBrackets",g:white,"","","","")
call s:X("coffeeNumber",g:dark_pink,"","","","")
call s:X("coffeeFloat",g:dark_pink,"","","","")
call s:X("coffeeCurly",g:white,"","","","")
call s:X("coffeeCurlies",g:white,"","","","")
call s:X("coffeeConditional",g:dark_orange,"","","","")
call s:X("coffeeBoolean",g:dark_pink,"","","","")
call s:X("coffeeSpecialVar",g:light_pink,"","","","")
call s:X("coffeeDotAccess",g:white,"","","","")
call s:X("coffeeConstant",g:dark_pink,"","","","")
call s:X("coffeeRepeat",g:dark_orange,"","","","")
call s:X("coffeeGlobal",g:dark_pink,"","","","")
call s:X("coffeeOperator",g:dark_orange,"","","","")
hi! link coffeeSemicolonError ErrorMsg
hi! link coffeeReservedError ErrorMsg
hi! link coffeeSpaceError ErrorMsg

" HTML
call s:X("htmlTag",g:light_grey,"","","","")
call s:X("htmlEndTag",g:light_grey,"","","","")
call s:X("htmlTagName",g:light_blue,"","","","")
call s:X("htmlSpecialTagName",g:blue,"","","","")


call s:X("htmlArg",g:dark_orange,"","","","")
call s:X("htmlEvent",g:dark_orange,"","","","")
call s:X("htmlString",g:yellow,"","","","")

call s:X("htmlTitle",g:purple,"","","","")
call s:X("htmlH1",g:light_orange,"","","","")
call s:X("htmlItalic",g:pink,"","","","")

" Markdown
call s:X("markdownH1",g:yellow,"","","","")
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
call s:X("markdownHeadingRule",g:dark_orange,"","","","")
hi! link markdownHeadingDelimiter markdownHeadingRule

call s:X("markdownRule",g:light_blue,"","","","")

call s:X("markdownCode","AAAAAA","","","","")
hi! link markdownCodeBlock markdownCode
call s:X("markdownCodeDelimiter",g:dark_blue,"","","","")

call s:X("markdownLinkText",g:green,"","","","")
call s:X("markdownUrl",g:dark_pink,"","","","")

call s:X("markdownId",g:yellow,"","","","")
hi! link markdownIdDeclaration markdownId

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Vimscript

hi! link vimOper Normal

" Debugger.vim

call s:X("DbgCurrent","DEEBFE","345FA8","","White","DarkBlue")
call s:X("DbgBreakPt","","4F0037","","","DarkMagenta")

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","","232323","","","")
call s:X("IndentGuidesEven","","1b1b1b","","","")

" Plugins, etc.

hi! link TagListFileName Directory
call s:X("PreciseJumpTarget","B9ED67","405026","","White","Green")

" NERDTree

call s:X("NERDTreeHelp","345FA8","","","","")
call s:X("NERDTreeUp","345FA8","","","","")

call s:X("NERDTreeOpenable",g:yellow,"","","","")
call s:X("NERDTreeClosable",g:red,"","","","")
call s:X("NERDTreeDir",g:yellow,"","","","")
hi! link NERDTreeDirSlash Ignore

call s:X("NERDTreeExecFile",g:purple,"","","","")

if !exists("g:cobalt_bg_256")
  let g:cobalt_bg_256="NONE"
end

" Manual overrides for 256-color terminals. Dark colors auto-map badly.
if !s:low_color
  hi StatusLineNC ctermbg=232
  hi Folded ctermbg=236
  hi FoldColumn ctermbg=234
  hi SignColumn ctermbg=236
  hi CursorColumn ctermbg=234
  hi CursorLine ctermbg=235
  hi SpecialKey ctermbg=234
  exec "hi NonText ctermbg=".g:cobalt_bg_256
  exec "hi LineNr ctermbg=".g:cobalt_bg_256
  hi DiffText ctermfg=81
  exec "hi Normal ctermbg=".g:cobalt_bg_256
  hi DbgBreakPt ctermbg=53
  hi IndentGuidesOdd ctermbg=235
  hi IndentGuidesEven ctermbg=234
endif

" delete functions
delf s:X
delf s:rgb
delf s:color
delf s:rgb_color
delf s:rgb_level
delf s:rgb_number
delf s:grey_color
delf s:grey_level
delf s:grey_number
