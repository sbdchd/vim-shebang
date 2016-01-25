command! -bang -nargs=* ShebangInsert let s:view = winsaveview() |
            \ call g:shebang#CommandShebang(<bang>0, <q-args>) |
            \ call winrestview(s:view)
