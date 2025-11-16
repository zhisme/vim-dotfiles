-- Debug version of custom lazygit implementation
print("=== Custom LazyGit Implementation (DEBUG) ===")

local M = {}

function M.open_lazygit(cmd)
  cmd = cmd or 'lazygit'
  print("Opening lazygit with command: " .. cmd)

  -- Calculate window size (90% of screen)
  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.9)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  print("Window dimensions:")
  print("  width: " .. width)
  print("  height: " .. height)

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  print("Created buffer: " .. buf)

  -- Create floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded'
  })
  print("Created window: " .. win)

  -- Get current mode before termopen
  local mode_before = vim.api.nvim_get_mode().mode
  print("Mode before termopen: " .. mode_before)

  -- Get current window
  local win_before = vim.api.nvim_get_current_win()
  print("Current window before termopen: " .. win_before)

  -- Start lazygit terminal
  local job_id = vim.fn.termopen(cmd, {
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

    -- Enter insert mode immediately (this is the key!)
    print("Calling startinsert...")
    vim.cmd('startinsert')

    -- Get mode after startinsert
    local mode_final = vim.api.nvim_get_mode().mode
    print("Mode after startinsert: " .. mode_final)

    print("Done!")
  else
    print("Error: Failed to start " .. cmd)
    vim.api.nvim_win_close(win, true)
  end
end

-- Test it
print("")
print("Now testing M.open_lazygit('lazygit')...")
print("")
M.open_lazygit('lazygit')

return M
