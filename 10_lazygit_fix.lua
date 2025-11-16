-- Fix for lazygit.nvim blank window issue
-- The plugin doesn't call startinsert after opening the terminal,
-- causing the window to appear blank in some terminal emulators.

-- Use an autocmd to automatically enter insert mode when lazygit terminal opens
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*lazygit*",
  callback = function()
    -- Small delay to ensure terminal is fully initialized
    vim.defer_fn(function()
      if vim.api.nvim_get_mode().mode ~= 'i' then
        vim.cmd('startinsert')
      end
    end, 100)
  end,
  desc = "Auto-enter insert mode for lazygit terminals"
})
