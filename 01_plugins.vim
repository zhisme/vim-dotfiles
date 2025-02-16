" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-endwise'
Plugin 'eldritch-theme/eldritch.nvim'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'slim-template/vim-slim'

Plugin 'elixir-editors/vim-elixir'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'elzr/vim-json'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'dense-analysis/ale'
Plugin 'github/copilot.vim'
Plugin 'kdheepak/lazygit.nvim'

Plugin 'ibhagwan/fzf-lua', {'branch': 'main'}
Plugin 'nvim-neo-tree/neo-tree.nvim'
Plugin 'nvim-tree/nvim-web-devicons'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'MunifTanjim/nui.nvim'

call vundle#end()

