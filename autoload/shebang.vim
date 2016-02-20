let s:shebangs_local = {
            \ 'applescript': '#!/usr/bin/env osascript',
            \ 'bash':        '#!/usr/bin/env bash',
            \ 'erlang':      '#!/usr/bin/env escript',
            \ 'fish':        '#!/usr/bin/env fish',
            \ 'lua':         '#!/usr/bin/env lua',
            \ 'node':        '#!/usr/bin/env node',
            \ 'perl':        '#!/usr/bin/env perl',
            \ 'php':         '#!/usr/bin/env php',
            \ 'py2':         '#!/usr/bin/env python2',
            \ 'py3':         '#!/usr/bin/env python3',
            \ 'python':      '#!/usr/bin/env python',
            \ 'python2':     '#!/usr/bin/env python2',
            \ 'python3':     '#!/usr/bin/env python3',
            \ 'ruby':        '#!/usr/bin/env ruby',
            \ 'sh':          '#!/usr/bin/env sh',
            \ 'zsh':         '#!/usr/bin/env zsh',
            \ }

if exists('g:shebang#shebangs')
    "override/add specified shebangs with defaults
    call extend(g:shebang#shebangs, s:shebangs_local, 'keep')
else
    let g:shebang#shebangs = s:shebangs_local
endif

function! g:shebang#InsertShebang(shebang) abort
    if a:shebang !=? ''
        0put = a:shebang
        echom 'Shebang: inserted' a:shebang 'shebang'
    endif
endfunction

function! g:shebang#CheckShebang(...) abort
    "check to see that there are arguments
    if a:000 !=? ['']
        let l:argument = a:1
    else
        let l:argument = &filetype
    endif
    if l:argument =~# '#!.*'
        call g:shebang#InsertShebang(l:argument)
        return 0
    endif

    "see if specified shebang is defined in shebangs dict
    if has_key(g:shebang#shebangs, l:argument)
        call g:shebang#InsertShebang(g:shebang#shebangs[l:argument])
        return 0
    else
        return 1
    endif
endfunction

function! g:shebang#CommandShebang(bang, ...) abort
    let l:vargs = join(a:000)
    if getline(1) =~? '#!.*' && a:bang
        if !g:shebang#CheckShebang(l:vargs) | 2delete _ | endif
        "check that the first line isn't a shebang
    elseif getline(1) !~? '#!.*'
        call g:shebang#CheckShebang(l:vargs)
    else
        echom 'Shebang: a shebang already exists.'
    endif
endfunction
