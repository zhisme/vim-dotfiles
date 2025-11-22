# Vim Dotfiles

A modular, feature-rich Neovim configuration focused on modern development workflows with support for multiple programming languages.

> **Note:** This configuration now uses **Lazy.nvim** for plugin management. For migration details from vim-plug, see [MIGRATION_GUIDE.md](MIGRATION_GUIDE.md).

## Features

### Core Functionality
- **Neovim-only** configuration (Vim support dropped for modern features)
- **Modular configuration** split into numbered files for easy maintenance
- **Dynamic window title** showing current working directory
- **Smart defaults** for editing, searching, and navigation

### Plugins & Tools

#### Plugin Management
- **Lazy.nvim** - Modern plugin manager with:
  - Automatic bootstrap (no manual installation needed)
  - Lazy loading for faster startup
  - Beautiful UI for managing plugins
  - Built-in profiling and update capabilities

#### File Navigation & Search
- **neo-tree.nvim** - Modern file explorer with git status integration
- **fzf-lua** - Fast fuzzy finder for files and content
- **ripgrep** integration for powerful search capabilities

#### Git Integration
- **vim-fugitive** - Comprehensive Git wrapper
- **lazygit.nvim** - Terminal UI for Git with intuitive commands

#### Code Quality & Linting
- **ALE** (Asynchronous Lint Engine) with support for:
  - **Ruby**: Rubocop, Brakeman
  - **Elixir**: elixir-ls, mix_format
  - **JavaScript/TypeScript**: ESLint
  - **Go**: gofmt, gopls, go vet
  - **Rust**: analyzer
  - **ERB**: erblint
  - **JSON**: prettier

#### Language Support
- Ruby & Rails
- Elixir
- JavaScript & JSX
- TypeScript & TSX
- Go
- Rust
- JSON
- Slim templates

#### AI & Productivity
- **GitHub Copilot** with toggle function (F12)
- **copy_with_context.nvim** - Copy code with file path context
- **vim-commentary** - Easy commenting
- **vim-endwise** - Auto-close structures
- **vim-airline** - Enhanced status line

#### Theme
- **Eldritch** - Modern color scheme

## Installation

### Prerequisites
- Neovim 0.8+ (required - Vim is not supported)
- Git
- curl

### Quick Install

```bash
# Clone the repository
git clone https://github.com/yourusername/vim-dotfiles.git ~/.vim-dotfiles

# Run the installation script
cd ~/.vim-dotfiles
./install.sh
```

The install script will:
1. Create symlinks for `.vimrc` in your home directory
2. Set up `init.vim` for Neovim at `~/.config/nvim/`
3. Backup any existing configuration files

### Manual Installation

```bash
# Create symlink for .vimrc
ln -s ~/.vim-dotfiles/.vimrc ~/.vimrc

# Copy init.vim for Neovim
mkdir -p ~/.config/nvim/
cp ~/.vim-dotfiles/init.vim ~/.config/nvim/init.vim
```

### Install Plugins

**Lazy.nvim** will automatically bootstrap itself and install all plugins on first launch!

Simply open Neovim:

```bash
nvim
```

Lazy.nvim will:
1. Clone itself if not already installed
2. Automatically install all configured plugins
3. Show a progress window during installation

After installation, you can manage plugins with:

```vim
:Lazy          " Open Lazy.nvim UI
:Lazy update   " Update all plugins
:Lazy sync     " Install, update, and clean plugins
```

## Configuration Structure

The configuration is organized into modular files:

- `00_init.lua` - Lazy.nvim bootstrap, initialization, runtime setup, and config loader
- `01_plugins.lua` - Plugin definitions and configurations (Lazy.nvim)
- `02_options.vim` - Editor options and settings
- `03_variables.vim` - Custom variables
- `04_colorscheme.vim` - Theme configuration
- `05_autocommands.vim` - Auto-commands (filetype detection, whitespace removal)
- `06_linters.vim` - ALE linter and fixer configuration
- `07_user_functions.vim` - Custom functions (Copilot toggle)
- `10_lazygit_fix.lua` - Custom lazygit implementation
- `09_mappings.vim` - Key mappings and shortcuts

## Key Mappings

### General
- `<Leader>p` - Run ALE fix
- `<F2>` - Toggle Neo-tree file explorer
- `<S-Right>` / `<S-Left>` - Next/previous tab
- `<C-a>` - Select all
- `<Leader>hl` - Toggle search highlighting
- `<C-P>` - Fuzzy file finder (fzf-lua)
- `<F8>` - Toggle paste mode

### File Navigation
- `<Leader>ntf` - Reveal current file in Neo-tree

### Copy File Paths (macOS only)
- `<leader>cf` - Copy relative path
- `<leader>cF` - Copy absolute path
- `<leader>ct` - Copy filename
- `<leader>ch` - Copy directory name

### Copy with Context
- `<leader>cy` - Copy selection with relative path context
- `<leader>cY` - Copy selection with absolute path context

### Git & AI Tools
- `<F10>` - Open LazyGit
- `<F12>` - Toggle GitHub Copilot

### Tab Navigation (macOS Alt+Number)
- `Alt+1` through `Alt+8` - Jump to tab 1-8
- `Alt+9` - Jump to last tab

## Editor Settings

- **No swap files** - Cleaner working directory
- **Line numbers** enabled
- **Smart case** searching
- **Scroll offset** of 10 lines
- **Clipboard** integration with system clipboard
- **Auto-indent** with 2-space tabs (expandtab)
- **Auto-remove trailing whitespace** on save
- **Fold method** set to indent with all folds open by default

## Language-Specific Configuration

### Elixir
- Configure elixir-ls path in `06_linters.vim`:
  ```vim
  let g:ale_elixir_elixir_ls_release=expand("~/path/to/elixir-ls/rel")
  ```

### Ruby
- Uses bundled Rubocop for project-specific versions
- Includes Brakeman for security analysis

### Go
- Configured with gofmt, gopls, and go vet

## Customization

### Adding Plugins
Add plugins to `01_plugins.lua` in the returned table:

```lua
-- Simple plugin
'username/plugin-name',

-- Plugin with configuration
{
  'username/plugin-name',
  dependencies = { 'dep1', 'dep2' },
  config = function()
    require('plugin-name').setup({
      -- your config here
    })
  end,
}

-- Lazy-loaded plugin (loaded on command)
{
  'username/plugin-name',
  cmd = 'PluginCommand',
}
```

Lazy.nvim will automatically install new plugins on next launch, or run `:Lazy sync`.

### Plugin Manager Commands
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install, update, and clean plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy profile` - View plugin load times
- `:Lazy log` - View update log

### Modifying Key Mappings
Edit `09_mappings.vim` to customize shortcuts.

### Adjusting Linters
Configure linters and fixers in `06_linters.vim`.

## Troubleshooting

### Profile Reload Counter
The configuration tracks reload counts. If you see "reloading profile" messages, it indicates the config has been sourced multiple times in the session.

### Linter Issues
- Ensure language-specific linters are installed (rubocop, eslint, etc.)
- Check ALE configuration paths in `06_linters.vim`
- Run `:ALEInfo` to debug linter setup

## License

This configuration is provided as-is for personal use and modification.
