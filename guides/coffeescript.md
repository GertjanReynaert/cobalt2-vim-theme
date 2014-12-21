Coffeescript
============

element                | meaning
-----------------------|-------------------------
coffeeComment          | comment
coffeeBlockComment     | multiln comment
coffeeTodo             | no idea
coffeeKeyword          | class
coffeeObject           | className
coffeeObjAssign        | methodname
coffeeExtendedOp       | operators : -> =
coffeeParen            | ( )
coffeeParens           | parameter
coffeeSpecialOp        | , in function parameters
coffeeStatement        | return
coffeeString           | string
coffeeHeredoc          | multiline string
coffeeInterpDelim      | interpolation #{}
coffeeInterp           | interpolation content
coffeeSpecialIdent     | class var
coffeeBracket          | [ ]
coffeeBrackets         | array value
coffeeNumber           | integer
coffeeFloat            | float
coffeeCurly            | { }
coffeeCurlies          | hash value
coffeeConditional      | if else
coffeeBoolean          | true false
coffeeSpecialVar       | this
coffeeDotAccess        | . for method call
coffeeConstant         | constant
coffeeRepeat           | for loop keyword
coffeeGlobal           | undefined
coffeeOperator         | typof

Errors
------

coffeeSemicolonError   unnecessary ;
coffeeReservedError    unnecessary function
coffeeSpaceError       no idea

Regex
-----

coffeeHeregexComment   no idea
coffeeRegex            regular expression
coffeeEscape           regex esc val
coffeeRegexCharSet     regex [A-z]
coffeeHeregex          no idea
coffeeHeregexCharSet   no idea
