" Lazygit Diagnostic Script
" Run this in nvim with: :source debug_lazygit.vim

echo "=== Lazygit Diagnostics ==="
echo ""

" Check if lazygit binary is available
if executable('lazygit')
  echo "✓ lazygit binary found in PATH"
  echo "  Location: " . exepath('lazygit')
  echo "  Version: " . system('lazygit --version')
else
  echo "✗ lazygit binary NOT found in PATH"
  echo "  Current PATH: " . $PATH
  echo ""
  echo "  Install lazygit:"
  echo "    macOS:    brew install lazygit"
  echo "    Ubuntu:   sudo apt install lazygit"
  echo "    Arch:     sudo pacman -S lazygit"
  echo "    Go:       go install github.com/jesseduffield/lazygit@latest"
endif

echo ""

" Check if plenary is loaded
echo "Checking plenary.nvim..."
lua << EOF
local status, plenary = pcall(require, 'plenary')
if status then
  vim.api.nvim_echo({{"✓ plenary.nvim loaded successfully", "Normal"}}, false, {})
else
  vim.api.nvim_echo({{"✗ plenary.nvim NOT loaded: " .. plenary, "ErrorMsg"}}, false, {})
end
EOF

echo ""

" Check if lazygit.nvim is loaded
echo "Checking lazygit.nvim..."
lua << EOF
local status, lazygit = pcall(require, 'lazygit')
if status then
  vim.api.nvim_echo({{"✓ lazygit.nvim loaded successfully", "Normal"}}, false, {})
else
  vim.api.nvim_echo({{"✗ lazygit.nvim NOT loaded: " .. lazygit, "ErrorMsg"}}, false, {})
end
EOF

echo ""

" Check if LazyGit command exists
if exists(':LazyGit')
  echo "✓ :LazyGit command is defined"
else
  echo "✗ :LazyGit command is NOT defined"
  echo "  Run :PlugInstall to install plugins"
endif

echo ""
echo "=== End Diagnostics ==="
