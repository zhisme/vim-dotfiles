-- Fix for lazygit.nvim blank window issue
-- The plugin doesn't call startinsert after opening the terminal,
-- causing the window to appear blank in some terminal emulators.

-- Override the lazygit module's main function to add startinsert
local lazygit = require('lazygit')

-- Store all original functions
local original_functions = {
  lazygit = lazygit.lazygit,
  lazygitcurrentfile = lazygit.lazygitcurrentfile,
  lazygitfilter = lazygit.lazygitfilter,
  lazygitfiltercurrentfile = lazygit.lazygitfiltercurrentfile,
  lazygitlog = lazygit.lazygitlog,
}

-- Helper function to wrap a lazygit function
local function wrap_lazygit_function(original_fn)
  return function(...)
    -- Call the original function
    original_fn(...)

    -- Enter insert mode in the new window
    -- Use schedule to ensure we're in the right context
    vim.schedule(function()
      -- Find the floating window (it should be the current window after lazygit opens)
      local current_win = vim.api.nvim_get_current_win()
      local config = vim.api.nvim_win_get_config(current_win)

      -- Check if it's a floating window (lazygit uses floating windows)
      if config.relative ~= "" then
        vim.cmd('startinsert')
      end
    end)
  end
end

-- Override all lazygit functions
for name, original_fn in pairs(original_functions) do
  lazygit[name] = wrap_lazygit_function(original_fn)
end
