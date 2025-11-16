" Alternative fix: Override the LazyGit commands to add startinsert

" Store original commands don't exist yet when this loads, so we'll
" redefine the commands completely with our wrapper

function! s:LazyGitWithInsert(cmd)
  " Execute the original lazygit lua function
  execute 'lua require("lazygit").' . a:cmd . '()'
  " Enter insert mode after a short delay
  call timer_start(100, {-> execute('startinsert')})
endfunction

" Redefine all LazyGit commands with our wrapper
command! -nargs=0 LazyGit call s:LazyGitWithInsert('lazygit')
command! -nargs=0 LazyGitCurrentFile call s:LazyGitWithInsert('lazygitcurrentfile')
command! -nargs=0 LazyGitFilter call s:LazyGitWithInsert('lazygitfilter')
command! -nargs=0 LazyGitFilterCurrentFile call s:LazyGitWithInsert('lazygitfiltercurrentfile')
command! -nargs=0 LazyGitLog call s:LazyGitWithInsert('lazygitlog')

echo "Alternative LazyGit fix loaded - try :LazyGit now"
