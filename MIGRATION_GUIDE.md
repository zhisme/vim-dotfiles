# Migration Guide: vim-plug to Lazy.nvim

This guide documents the migration from vim-plug to Lazy.nvim package manager.

## What Changed

### Files Modified

1. **00_init.lua** - Added Lazy.nvim bootstrap and initialization
2. **01_plugins.vim** → **01_plugins.lua** - Converted from vim-plug to Lazy.nvim format
3. **08_setup.lua** - Removed plugin configurations now handled in 01_plugins.lua

### Key Differences

#### Before (vim-plug)
```vim
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'nvim-neo-tree/neo-tree.nvim'
call plug#end()
```

#### After (Lazy.nvim)
```lua
return {
  'tpope/vim-fugitive',
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = { ... },
    config = function()
      -- Setup code here
    end,
  },
}
```

## Migration Steps

### 1. Remove vim-plug

Before starting Neovim, clean up the old vim-plug installation:

```bash
# Remove vim-plug directory
rm -rf ~/.local/share/nvim/plugged

# Remove vim-plug autoload (optional, won't interfere but not needed)
rm -f ~/.local/share/nvim/site/autoload/plug.vim
```

### 2. Start Neovim

When you first start Neovim with the new configuration:

```bash
nvim
```

Lazy.nvim will:
- Automatically clone itself on first run
- Install all plugins defined in `01_plugins.lua`
- Set up the configuration

You should see a Lazy.nvim install window showing the progress.

### 3. Verify Installation

After installation completes:

```vim
:Lazy
```

This opens the Lazy.nvim UI where you can:
- View all installed plugins
- Check for updates
- See plugin status
- Manage plugins

### 4. Check Plugin Health

Run Neovim's health check:

```vim
:checkhealth
```

This will verify that all plugins are working correctly.

## New Lazy.nvim Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open Lazy.nvim UI |
| `:Lazy update` | Update all plugins |
| `:Lazy sync` | Install missing, update, and clean plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy check` | Check for plugin updates |
| `:Lazy log` | View recent updates |
| `:Lazy profile` | Profile plugin load times |

## Benefits of Lazy.nvim

1. **Lazy Loading** - Plugins load only when needed, faster startup
2. **Modern UI** - Beautiful interface for managing plugins
3. **Better Performance** - Optimized plugin loading and caching
4. **Lockfile** - Reproducible plugin versions (lazy-lock.json)
5. **Built-in Profiling** - See exactly how long each plugin takes to load

## Plugin Configuration Strategy

With Lazy.nvim, plugin configurations can be:

### Option 1: Inline (Current Approach)
Define setup in the plugin spec using `config` function:

```lua
{
  'nvim-neo-tree/neo-tree.nvim',
  config = function()
    require("neo-tree").setup({ ... })
  end,
}
```

### Option 2: Separate Files (For Complex Configs)
For more complex setups, you can use:

```lua
{
  'plugin-name',
  config = function()
    require('config.plugin-name')
  end,
}
```

## Lazy Loading Examples

To optimize startup time, you can lazy-load plugins:

```lua
-- Load on specific file types
{
  'vim-ruby/vim-ruby',
  ft = 'ruby',
}

-- Load on command
{
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
}

-- Load on keymap
{
  'plugin-name',
  keys = {
    { '<leader>f', '<cmd>SomeCommand<cr>', desc = 'Description' },
  },
}

-- Load on event
{
  'plugin-name',
  event = 'VeryLazy', -- or 'BufReadPost', 'InsertEnter', etc.
}
```

## Troubleshooting

### Plugins not loading
```vim
:Lazy sync
```

### Check plugin load order
```vim
:Lazy profile
```

### Clear cache and reinstall
```bash
rm -rf ~/.local/share/nvim/lazy
rm ~/.config/nvim/lazy-lock.json
nvim  # Then run :Lazy sync
```

### View logs
```vim
:Lazy log
```

## Next Steps

1. Consider adding lazy-loading to improve startup time
2. Review `:Lazy profile` to identify slow plugins
3. Explore Lazy.nvim's lockfile (`lazy-lock.json`) for version control
4. Check out [Lazy.nvim documentation](https://github.com/folke/lazy.nvim) for advanced features

## Rollback (If Needed)

If you need to rollback to vim-plug:

1. Restore the backed-up files
2. Reinstall vim-plug:
   ```bash
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   ```
3. Run `:PlugInstall` in Neovim

## Additional Resources

- [Lazy.nvim GitHub](https://github.com/folke/lazy.nvim)
- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim#-plugin-spec)
- [Migration Guide](https://github.com/folke/lazy.nvim#-migration-guide)
