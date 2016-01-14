command! -bang -nargs=? InsertShebang let s:view = winsaveview() |
            \ call g:shebang#CommandShebang(<bang>0, <q-args>) |
            \ call winrestview(s:view)
