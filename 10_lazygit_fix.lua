-- Fix for lazygit.nvim blank window issue
-- The plugin doesn't call startinsert after opening the terminal,
-- causing the window to appear blank in some terminal emulators.

-- Instead of trying to fix the plugin, we create our own simple implementation
-- that does exactly what works in the test file

-- Simple function to open lazygit in a floating window
local function open_lazygit(cmd)
  cmd = cmd or 'lazygit'

  -- Calculate window size (90% of screen)
  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.9)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- Create floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded'
  })

  -- Start lazygit terminal
  local job_id = vim.fn.termopen(cmd, {
    on_exit = function(job_id, exit_code, event_type)
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end
  })

  if job_id > 0 then
    -- Enter insert mode immediately (this is the key!)
    vim.cmd('startinsert')
  else
    print("Error: Failed to start " .. cmd)
    vim.api.nvim_win_close(win, true)
  end
end

-- Delete the original lazygit.nvim commands
vim.cmd([[
  silent! delcommand LazyGit
  silent! delcommand LazyGitCurrentFile
  silent! delcommand LazyGitFilter
  silent! delcommand LazyGitFilterCurrentFile
  silent! delcommand LazyGitLog
  silent! delcommand LazyGitConfig
]])

-- Create our own commands using our working implementation
vim.api.nvim_create_user_command('LazyGit', function()
  open_lazygit('lazygit')
end, {})

vim.api.nvim_create_user_command('LazyGitCurrentFile', function()
  local file = vim.fn.expand('%:p')
  if file ~= '' then
    open_lazygit('lazygit -f ' .. vim.fn.shellescape(file))
  else
    open_lazygit('lazygit')
  end
end, {})

vim.api.nvim_create_user_command('LazyGitFilter', function()
  open_lazygit('lazygit --filter')
end, {})

vim.api.nvim_create_user_command('LazyGitFilterCurrentFile', function()
  local file = vim.fn.expand('%:p')
  if file ~= '' then
    open_lazygit('lazygit --filter ' .. vim.fn.shellescape(file))
  else
    open_lazygit('lazygit --filter')
  end
end, {})

vim.api.nvim_create_user_command('LazyGitLog', function()
  open_lazygit('lazygit log')
end, {})

vim.api.nvim_create_user_command('LazyGitConfig', function()
  open_lazygit('lazygit --edit-config')
end, {})
