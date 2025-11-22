-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Detect settings directory
local vim_files_path = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
vim_files_path = vim.fn.substitute(vim_files_path, "00_init.lua", '', '')

-- Add vim_files_path to package.path so Lua can find our plugin specs
package.path = package.path .. ";" .. vim_files_path .. "?.lua"

-- Load plugin specifications directly from the file
local plugins = dofile(vim_files_path .. "01_plugins.lua")

-- Setup lazy.nvim with plugin specifications
require("lazy").setup(plugins, {
  -- Configure lazy.nvim behavior
  install = {
    colorscheme = { "eldritch" },
  },
  checker = {
    enabled = false, -- Don't automatically check for updates
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Additional runtime setup
-- fzf
vim.cmd [[
  set rtp+=/usr/local/opt/fzf
]]

-- ripgrep
vim.opt.grepprg = 'rg --color=never'

-- Configuration files to load after plugins
local configs = {
  '02_options.vim',
  '03_variables.vim',
  '04_colorscheme.vim',
  '05_autocommands.vim',
  '06_linters.vim',
  '07_user_functions.vim',
  '10_lazygit_fix.lua',
  '09_mappings.vim',
}

-- Vim profile load counter
if not _G.profile_loads then _G.profile_loads = 0 end
if _G.profile_loads > 1 then vim.print("reloading profile " .. tostring(_G.profile_loads)) end

-- Load all configuration files
for _, setting_file in ipairs(configs) do
  vim.fn.execute('source ' .. vim_files_path .. setting_file)
end

-- Track profile load
_G.profile_loads = _G.profile_loads + 1

-- set dynamic title showing current working directory
vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')} - nvim"
