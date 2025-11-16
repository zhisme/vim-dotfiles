-- Test floating window with lazygit
print("=== Testing Floating Window with Lazygit ===")

-- Create a floating window similar to what lazygit.nvim does
local width = math.floor(vim.o.columns * 0.9)
local height = math.floor(vim.o.lines * 0.9)
local row = math.floor((vim.o.lines - height) / 2)
local col = math.floor((vim.o.columns - width) / 2)

-- Create buffer
local buf = vim.api.nvim_create_buf(false, true)

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

-- Start lazygit in the buffer
local job_id = vim.fn.termopen('lazygit', {
  on_exit = function(job_id, exit_code, event_type)
    print("Lazygit exited with code: " .. exit_code)
    vim.api.nvim_win_close(win, true)
  end
})

if job_id > 0 then
  print("Terminal started with job ID: " .. job_id)
  print("Entering insert mode...")
  vim.cmd('startinsert')
  print("")
  print("If you see lazygit now, the fix is to add 'startinsert'")
  print("Press 'q' to quit lazygit when done")
else
  print("ERROR: Failed to start terminal. Job ID: " .. job_id)
  vim.api.nvim_win_close(win, true)
end
