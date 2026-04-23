-- Lazy.nvim plugin specifications
return {
  -- Git integration
  'tpope/vim-fugitive',

  -- Ruby/Rails support
  'tpope/vim-endwise',
  'vim-ruby/vim-ruby',
  'tpope/vim-rails',

  -- Colorscheme
  'eldritch-theme/eldritch.nvim',

  -- Utilities
  'tpope/vim-commentary',
  'vim-airline/vim-airline',

  -- Language support
  'slim-template/vim-slim',
  'elixir-editors/vim-elixir',
  'elzr/vim-json',
  'maxmellon/vim-jsx-pretty',
  'hashivim/vim-terraform',

  -- Linting
  'dense-analysis/ale',

  -- Core dependencies
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',

  -- File explorer with dependencies
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
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
          follow_current_file  = { enabled = true },
          use_libuv_file_watcher = true,
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
    end,
  },

  -- LazyGit integration (removed - using custom implementation)
  -- We keep the custom implementation in 10_lazygit_fix.lua

  -- FZF integration
  {
    'ibhagwan/fzf-lua',
    branch = 'main',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Paste images from clipboard
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {
      default = {
        dir_path = '%:p:h',
        file_name = 'image-%H%M%S',
        relative_to_current_file = true,
        prompt_for_file_name = false,
        use_absolute_path = false,
      },
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = '![$CURSOR]($FILE_PATH)',
        },
      },
    },
    keys = {
      { '<leader>pi', '<cmd>PasteImage<cr>', mode = { 'n' }, desc = 'Paste image from clipboard' },
    },
  },

  -- Copy with context
  {
    'zhisme/copy_with_context.nvim',
    branch = 'master',
    config = function()
      require('copy_with_context').setup({
        mappings = {
          relative = '<leader>cy',
          absolute = '<leader>cY',
          remote = '<leader>cr',
          markdown = '<leader>cx',
        },
        trim_lines = false,
        formats = {
          default = '# {filepath}:{line}',
          remote = '# {remote_url}',
        },
        output_formats = {
          default = "{copied_text}\n\n# {filepath}:{line}",
          markdown = "```\n{copied_text}\n```\n\n{filepath}:{line}",
        },
      })
    end,
  },
}
