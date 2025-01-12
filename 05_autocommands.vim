augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" vim-slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

augroup auto_remove_trailing_whitespaces
  au BufWritePre * :%s/\s\+$//e
augroup END
