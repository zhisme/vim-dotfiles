" Test lazygit directly in a terminal buffer
echo "=== Testing lazygit in terminal buffer ==="
echo ""

" Open a new buffer and try running lazygit directly
enew
let result = termopen('lazygit', {'on_exit': {j,c,e -> execute("echo 'Lazygit exited with code: ' . c")}})

if result > 0
  echo "✓ Terminal opened with job ID: " . result
  echo "  If you see lazygit UI, the issue is with floating window"
  echo "  If blank, the issue is with terminal/lazygit itself"
else
  echo "✗ Failed to open terminal. Error code: " . result
endif
