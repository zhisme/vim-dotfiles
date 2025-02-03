" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'yous/vim-open-color'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'vim-airline/vim-airline'
Plugin 'slim-template/vim-slim'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-dispatch'
Plugin 'embear/vim-localvimrc'

Plugin 'elixir-editors/vim-elixir'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'dense-analysis/ale'
Plugin 'posva/vim-vue'
Plugin 'hashivim/vim-terraform'
Plugin 'github/copilot.vim'

Plugin 'ibhagwan/fzf-lua', {'branch': 'main'}
Plugin 'nvim-neo-tree/neo-tree.nvim'
Plugin 'nvim-tree/nvim-web-devicons'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'MunifTanjim/nui.nvim'
Plugin '3rd/image.nvim'

call vundle#end()

