local configs = {
  '01_plugins.vim',
  '02_options.vim',
  '03_variables.vim',
  '04_colorscheme.vim',
  '05_autocommands.vim',
  '06_linters.vim',
  '07_user_functions.vim',
  '08_setup.lua',
  '09_mappings.vim',
}

-- Vim profile load counter
if not _G.profile_loads then _G.profile_loads = 0 end
if _G.profile_loads > 1 then vim.print("reloading profile " .. tostring(_G.profile_loads)) end

-- Detect settings directory
local vim_files_path  = vim.fn.resolve(vim.fn.expand('<sfile>:p'))
vim_files_path        = vim.fn.substitute(vim_files_path, "00_init.lua", '', '')

-- Load all configuration files
for _, setting_file in ipairs(configs) do
  vim.fn.execute('source ' .. vim_files_path .. setting_file)
end

-- Track profile load
_G.profile_loads = _G.profile_loads + 1
