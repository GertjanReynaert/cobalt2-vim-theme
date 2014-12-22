Markdown
========

Links
-----

markdownLinkText           htmlLink             url text
markdownLinkTextDelimiter  cleared              [] around url text
markdownUrl                Float                url (link)
markdownLinkDelimiter      cleared              () around url

markdownId                 Type                 id
markdownIdDeclaration      Typedef              id declaration of id value (var
in js)
markdownIdDelimiter        markdownLinkDelimiter  [] around id

Titles
------

markdownH1                 htmlH1
markdownH2                 htmlH2
markdownH3                 htmlH3
markdownH4                 htmlH4
markdownH5                 htmlH5
markdownH6                 htmlH6

markdownRule               PreProc              horizontal line (-, +, \*)
markdownHeadingRule        markdownRule         line below a title
markdownHeadingDelimiter   Delimiter            # before a title

Lists
-----

markdownListMarker         htmlTagName          ul marker (\*, +, -)
markdownOrderedListMarker  markdownListMarker   ol marker

markdownItalic             htmlItalic           italic, text between single
asterisk
markdownBold               htmlBold             bold, text between double
asterisk

Code
----

markdownCode               cleared              code between single backticks
markdownCodeDelimiter      Delimiter            backticks
markdownCodeBlock          cleared              indented piece of text

markdownBlockquote         Comment              > sign before blockquote
markdownEscape             Special              backslash escape of a char

No idea
-------

markdownError              Error
markdownAutomaticLink      markdownUrl
markdownUrlTitle           String
markdownUrlDelimiter       htmlTag
markdownUrlTitleDelimiter  Delimiter
markdownBoldItalic         htmlBoldItalic

markdownValid              cleared
markdownLink               cleared
