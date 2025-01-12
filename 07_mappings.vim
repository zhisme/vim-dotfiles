nmap <Leader>p :ALEFix<CR>
map <F2>      :Neotree toggle<cr>
map <S-Right> :tabn<CR>
map <S-Left>  :tabp<CR>
map <C-a> <esc>ggVG<CR>
nnoremap <Leader>ntf :Neotree reveal<cr>
nmap <Leader>hl :set hlsearch! hlsearch?<CR>
" vnoremap p "0p

if has("mac") || has("gui_macvim") || has("gui_mac")
  " copy relative path
  nnoremap <leader>cf :let @*=expand("%")<CR>
  " copy absolute path
  nnoremap <leader>cF :let @*=expand("%:p")<CR>
  " copy filename
  nnoremap <leader>ct :let @*=expand("%:t")<CR>
  " copy directory name
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

" Map alt-x keys to jump to a tab (mac-only)
nnoremap ¡ 1gt <CR>
nnoremap ™ 2gt <CR>
nnoremap £ 3gt <CR>
nnoremap ¢ 4gt <CR>
nnoremap ∞ 5gt <CR>
nnoremap § 6gt <CR>
nnoremap ¶ 7gt <CR>
nnoremap • 8gt <CR>
nnoremap ª :tablast <CR>
" alt-9 ta last tab
"
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
