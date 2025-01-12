-- neo-tree
require("neo-tree").setup({
  enable_git_status = true,
  window            = { width = 30 },
  default_component_configs = {
    container = { enable_character_fade = false },
    indent    = { indent_size = 1, padding = 0, with_markers = false, },
    icon      = { folder_closed = ">", folder_open = "-", folder_empty = "ﰊ", },
    modified  = { symbol = "[+]" }
  },
  filesystem = {
    filtered_items = {
      visible         = false,
      hide_dotfiles   = false,
      hide_gitignored = false,
      hide_by_name    = { "node_modules", "tags", },
      never_show      = { ".DS_Store" }
    },
    follow_current_file  = { enabled = true }, use_libuv_file_watcher = true,
  },
  source_selector = {
    winbar = true,
    sources = {
      { source = "filesystem" },
      { source = "buffers" },
      { source = "git_status" },
      { source = "document_symbols" },
    },
  },
  sources = { "filesystem", "buffers", "git_status", "document_symbols" }
})

-- zsh
vim.opt.shell = '/bin/zsh -l'

-- fzf
vim.cmd [[
  set rtp+=/usr/local/opt/fzf
]]

-- ripgrep
vim.opt.grepprg = 'rg --color=never'

-- 3rd/image preview images
require("image").setup({
  backend = "kitty",
  processor = "magick_rock", -- or "magick_cli"
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      floating_windows = false, -- if true, images will be rendered in floating markdown windows
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    neorg = {
      enabled = true,
      filetypes = { "norg" },
    },
    typst = {
      enabled = true,
      filetypes = { "typst" },
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})
