# vim-shebang [![Build Status](https://travis-ci.org/sbdchd/vim-shebang.svg?branch=master)](https://travis-ci.org/sbdchd/vim-shebang) [![Circle CI](https://circleci.com/gh/sbdchd/vim-shebang.svg?style=svg)](https://circleci.com/gh/sbdchd/vim-shebang) [![Build Status](https://drone.io/github.com/sbdchd/vim-shebang/status.png)](https://drone.io/github.com/sbdchd/vim-shebang/latest)

A simple plugin to insert the correct shebang of the file.

## Install

[vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'sbdchd/vim-shebang'
```

## Usage

Run the command `:ShebangInsert` or use an autocmd e.g., `au! BufNewFile * ShebangInsert`.

Normally, `:ShebangInsert` will not overwrite an existing shebang.
By calling the command with a bang, `:ShebangInsert!`, any existing shebang
will be overwritten.

Additionally, a shebang can be specified by passing a name/filetype to `:ShebangInsert`.

```viml
:ShebangInsert python
```

or

```viml
:ShebangInsert node
```

You can also directly pass your desired shebang to the function.

```viml
:ShebangInsert #!/bin/sh
```

## Config

To add/change/remove a shebang and filetype, simple create the dictionary `g:shebang#shebangs`
in your `.vimrc`.

```viml
let g:shebang#shebangs = {
            \ 'python': '#!/bin/python',
            \ 'sh': '',
            \ 'newfiletype': '#!/bin/newshebang'
            \ }
```

## Supported Filetypes

- Applescript
- Bash
- Erlang (Escript)
- Fish
- Lua
- Node
- Perl
- PHP
- Python
- Ruby
- Sh
- Zsh
