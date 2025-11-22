-- Plugin configurations are now handled in 01_plugins.lua via Lazy.nvim
-- This file is kept for any additional runtime setup

-- fzf
vim.cmd [[
  set rtp+=/usr/local/opt/fzf
]]

-- ripgrep
vim.opt.grepprg = 'rg --color=never'
