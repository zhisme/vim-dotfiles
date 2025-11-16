-- Test floating window with lazygit (WORKING VERSION with debug logging)
print("=== Testing Floating Window with Lazygit (DEBUG) ===")

-- Calculate window size
local width = math.floor(vim.o.columns * 0.9)
local height = math.floor(vim.o.lines * 0.9)
local row = math.floor((vim.o.lines - height) / 2)
local col = math.floor((vim.o.columns - width) / 2)

print("Window dimensions:")
print("  width: " .. width)
print("  height: " .. height)
print("  row: " .. row)
print("  col: " .. col)

-- Create buffer
local buf = vim.api.nvim_create_buf(false, true)
print("Created buffer: " .. buf)

-- Create window
local win = vim.api.nvim_open_win(buf, true, {
  relative = 'editor',
  width = width,
  height = height,
  row = row,
  col = col,
  style = 'minimal',
  border = 'rounded'
})

print("Created floating window: " .. win)
print("Window size: " .. width .. "x" .. height)

-- Get current mode before termopen
local mode_before = vim.api.nvim_get_mode().mode
print("Mode before termopen: " .. mode_before)

-- Get current window before termopen
local win_before = vim.api.nvim_get_current_win()
print("Current window before termopen: " .. win_before)

-- Start lazygit in the buffer
local job_id = vim.fn.termopen('lazygit', {
  on_exit = function(job_id, exit_code, event_type)
    print("Lazygit exited with code: " .. exit_code)
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end
})

if job_id > 0 then
  print("Terminal started with job ID: " .. job_id)

  -- Get mode after termopen
  local mode_after = vim.api.nvim_get_mode().mode
  print("Mode after termopen: " .. mode_after)

  -- Get current window after termopen
  local win_after = vim.api.nvim_get_current_win()
  print("Current window after termopen: " .. win_after)

  print("Entering insert mode...")
  vim.cmd('startinsert')

  -- Get mode after startinsert
  local mode_final = vim.api.nvim_get_mode().mode
  print("Mode after startinsert: " .. mode_final)

  print("")
  print("If you see lazygit now, the fix is to add 'startinsert'")
  print("Press 'q' to quit lazygit when done")
else
  print("ERROR: Failed to start terminal. Job ID: " .. job_id)
  vim.api.nvim_win_close(win, true)
end
