-- Fix for lazygit.nvim blank window issue
-- This is the working implementation - simple floating window with startinsert

-- Create a global function that can be called from anywhere
_G.OpenLazyGit = function()
  -- Calculate window size
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

  -- Start lazygit in the buffer
  local job_id = vim.fn.termopen('lazygit', {
    on_exit = function(job_id, exit_code, event_type)
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end
  })

  if job_id > 0 then
    -- Enter insert mode immediately (this is the key!)
    vim.cmd('startinsert')
  else
    print("ERROR: Failed to start lazygit")
    vim.api.nvim_win_close(win, true)
  end
end
