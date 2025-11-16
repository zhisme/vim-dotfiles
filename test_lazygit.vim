" Test LazyGit with error catching
echo "=== Testing LazyGit ==="
echo ""

try
  echo "Attempting to call :LazyGit..."
  LazyGit
  echo "✓ Command executed without errors"
catch
  echo "✗ Error occurred:"
  echo "  " . v:exception
  echo "  at " . v:throwpoint
endtry

echo ""
echo "Check :messages for any additional output"
