-- Debug script to see what TermOpen pattern lazygit uses
print("Setting up TermOpen debug autocmd...")

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function(args)
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    print("TermOpen fired!")
    print("  Buffer name: " .. bufname)
    print("  Pattern that would match: " .. vim.fn.expand("<afile>"))

    -- Check if this is lazygit
    if bufname:match("lazygit") then
      print("  -> This is a lazygit terminal!")
      print("  -> Calling startinsert in 100ms...")
      vim.defer_fn(function()
        vim.cmd('startinsert')
        print("  -> startinsert called")
      end, 100)
    end
  end,
  desc = "Debug TermOpen events"
})

print("Debug autocmd set up. Now try :LazyGit")
