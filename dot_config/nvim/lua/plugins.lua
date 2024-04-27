-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- theme
    use 'tanvirtin/monokai.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip',
                build = "make install_jsregexp"
            },
        }
    }

    use { 'vim-airline/vim-airline' }      -- status bar
    use { 'preservim/nerdtree' }           -- sidebar
    use { 'tpope/vim-surround' }           -- surround! ysw(
    use { 'tpope/vim-commentary' }         -- comments; gc1j, gcc
    use { 'preservim/tagbar' }             -- tag list
    use { 'LunarWatcher/auto-pairs' }      -- automatically pair braces
    use { 'nvim-telescope/telescope.nvim', -- Search/fuzzy finder
        branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'mbbill/undotree' }     -- undo history
    use { 'tpope/vim-fugitive' }  -- git integration
    use { 'folke/which-key.nvim', -- hotkey helper
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end
    }
    use { 'nvim-treesitter/nvim-treesitter', run = { ':TSUpdate' } } -- AST generator
    use { 'ryanoasis/vim-devicons' }

    use { 'willothy/nvim-cokeline',
        requires = { { "nvim-lua/plenary.nvim", -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons",      -- If you want devicons
            "stevearc/resession.nvim"           -- Optional, for persistent history
        } }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
