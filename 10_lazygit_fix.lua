-- Fix for lazygit.nvim blank window issue
-- The plugin doesn't call startinsert after opening the terminal,
-- causing the window to appear blank in some terminal emulators.

-- Store the original LazyGit functions
local lazygit = require('lazygit')
local original_lazygit = lazygit.lazygit
local original_lazygitcurrentfile = lazygit.lazygitcurrentfile
local original_lazygitfilter = lazygit.lazygitfilter
local original_lazygitfiltercurrentfile = lazygit.lazygitfiltercurrentfile

-- Wrapper function that enters insert mode after opening lazygit
local function enter_insert_after_delay()
  -- Use a small delay to ensure the terminal is fully initialized
  vim.defer_fn(function()
    if vim.api.nvim_get_mode().mode ~= 'i' then
      vim.cmd('startinsert')
    end
  end, 50)
end

-- Override the lazygit functions to add startinsert
lazygit.lazygit = function(...)
  original_lazygit(...)
  enter_insert_after_delay()
end

lazygit.lazygitcurrentfile = function(...)
  original_lazygitcurrentfile(...)
  enter_insert_after_delay()
end

lazygit.lazygitfilter = function(...)
  original_lazygitfilter(...)
  enter_insert_after_delay()
end

lazygit.lazygitfiltercurrentfile = function(...)
  original_lazygitfiltercurrentfile(...)
  enter_insert_after_delay()
end

print("✓ Lazygit startinsert fix applied")
