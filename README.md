Cobalt2 Vim
===========

Install
-------

With [Plug](https://github.com/junegunn/vim-plug):

    Plug 'gertjanreynaert/cobalt2-vim-theme'

For terminal vim: the only way to accomplish the background color is by
installing the [cobalt2 iterm color
scheme](https://github.com/wesbos/Cobalt2-iterm/blob/master/cobalt2.itermcolors)

Installing xcode theme
----------------------

Download the Cobalt2.dvtcolortheme file

Create the destination folder for the theme

```
  mkdir ~/Library/Developer/Xcode/UserData/FontAndColorThemes
```

Copy the theme from Downloads folder to the xcode destination folder

```
  cp ~/Downloads/Cobalt2.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes
```

The colortheme must be an executable, which can be achieved by following command

```
  chmod +x ~/Library/Developer/Xcode/UserData/FontAndColorThemes/Cobalt2.dvtcolortheme
```

Restart xcode and the theme should be available in xcode preferences

Contributions
-------------

Pr's are always welcome. Please include a screenshot and a test file that
demonstrates all the highlighted elements

Language support
----------------

- [x] Ruby
- [x] Javascript
  - [x] Coffeescript

- [x] Css
  - [x] Scss
  - [ ] Less

- [x] Html
  - [ ] Erb
  - [x] Haml
  - [ ] Handlebars
  - [x] XML/JSX

- [x] Markdown
- [ ] JSON
- [x] Yaml
- [ ] SQL
- [ ] Shell

- [x] NERDtree (plugin)
- [ ] airplane (plugin)
- [ ] CTRL-P (plugin)

All unsupported languages have a fallback to the default linked elements, or
to predefined colors of the jellybeans color theme

Currently not scheduled
-----------------------

- Python
- PHP
- Objective C
- C
- Erlang
- Lua
- ...

License
-------

MIT
