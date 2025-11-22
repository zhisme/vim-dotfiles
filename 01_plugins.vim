call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'eldritch-theme/eldritch.nvim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'slim-template/vim-slim'

Plug 'elixir-editors/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'elzr/vim-json'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'

" Core dependencies - must load before plugins that use them
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'

" Plugins that depend on the above
Plug 'kdheepak/lazygit.nvim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'zhisme/copy_with_context.nvim'

call plug#end()

