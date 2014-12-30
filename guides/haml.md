Haml
====

Tags & attributes
-----------------

hamlTag                     Special         %
  tagname => htmlTagName

hamlIdChar                  Special         #
hamlId                      Identifier      id text

hamlClassChar               Special         .
hamlClass                   Type            class text

hamlAttributesDelimiter     Delimiter       {}
hamlAttributesHash          cleared         : or => between k & v
hamlAttributeString         String
hamlAttributes              cleared

Ruby stuff
----------

hamlRubyChar                Special         -
hamlRubyOutputChar          hamlRubyChar    =

hamlInterpolationDelimiter  Delimiter       #{} in a tag string
hamlInterpolationEscape     Special

hamlInterpolation           cleared
hamlErbInterpolation        cleared

hamlObject                  cleared
hamlDespacer                Special
hamlSelfCloser              Special
hamlRuby                    cleared           methods, paths, ,[] ::
hamlPlainChar               Special
hamlInterpolatable          cleared
hamlRubyFilter              cleared
hamlBegin                   cleared
hamlPlainFilter             cleared
hamlSassFilter              cleared
hamlComment                 Comment
hamlHtmlComment             hamlComment
hamlAttributeVariable       Identifier
hamlObjectDelimiter         Delimiter
hamlDocType                 PreProc
hamlInterpolatableChar      hamlRubyChar
hamlHelper                  Function
hamlFilter                  PreProc
hamlEscapedFilter           cleared
hamlErbFilter               cleared
hamlJavascriptFilter        cleared
hamlCSSFilter               cleared
hamlError                   Error
hamlJavascriptBlock         cleared
hamlCssBlock                cleared
hamlIEConditional           SpecialComment
hamlCoffeescriptFilter      cleared
