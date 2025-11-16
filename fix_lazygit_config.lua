-- Lazygit configuration fixes for blank window issue

-- Try using plenary for floating window management
vim.g.lazygit_floating_window_use_plenary = 1

-- Adjust window scaling (try full screen)
vim.g.lazygit_floating_window_scaling_factor = 0.95

-- Disable transparency
vim.g.lazygit_floating_window_winblend = 0

-- Ensure neovim-remote is used if available
vim.g.lazygit_use_neovim_remote = 1

print("Lazygit configuration applied:")
print("  - Using plenary for window management")
print("  - Window scaling: 0.95")
print("  - Window blend: 0")
print("  - Neovim remote: enabled")
print("")
print("Try running :LazyGit now")
