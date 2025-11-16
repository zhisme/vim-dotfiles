-- Fix for lazygit.nvim blank window issue
-- The plugin doesn't call startinsert after opening the terminal,
-- causing the window to appear blank in some terminal emulators.

-- This must be loaded AFTER the lazygit commands are defined
-- We redefine the commands to add startinsert with proper timing

-- Delete the existing commands first
vim.cmd([[
  silent! delcommand LazyGit
  silent! delcommand LazyGitCurrentFile
  silent! delcommand LazyGitFilter
  silent! delcommand LazyGitFilterCurrentFile
  silent! delcommand LazyGitLog
  silent! delcommand LazyGitConfig
]])

-- Helper function to call lazygit function and enter insert mode
local function call_lazygit_with_insert(fn_name)
  local lazygit = require('lazygit')
  local fn = lazygit[fn_name]

  if fn then
    fn()
    -- Multiple attempts with increasing delays to catch the window
    for i = 1, 5 do
      vim.defer_fn(function()
        if vim.api.nvim_get_mode().mode ~= 'i' then
          local win = vim.api.nvim_get_current_win()
          local config = vim.api.nvim_win_get_config(win)
          if config.relative ~= "" then
            vim.cmd('startinsert')
          end
        end
      end, i * 20) -- Try at 20ms, 40ms, 60ms, 80ms, 100ms
    end
  end
end

-- Redefine all commands
vim.api.nvim_create_user_command('LazyGit', function()
  call_lazygit_with_insert('lazygit')
end, {})

vim.api.nvim_create_user_command('LazyGitCurrentFile', function()
  call_lazygit_with_insert('lazygitcurrentfile')
end, {})

vim.api.nvim_create_user_command('LazyGitFilter', function()
  call_lazygit_with_insert('lazygitfilter')
end, {})

vim.api.nvim_create_user_command('LazyGitFilterCurrentFile', function()
  call_lazygit_with_insert('lazygitfiltercurrentfile')
end, {})

vim.api.nvim_create_user_command('LazyGitLog', function()
  call_lazygit_with_insert('lazygitlog')
end, {})

vim.api.nvim_create_user_command('LazyGitConfig', function()
  require('lazygit').lazygitconfig()
end, {})
