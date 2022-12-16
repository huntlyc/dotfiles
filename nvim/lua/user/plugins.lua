-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

local packer = require 'lib.packer-init'

packer.startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- game
    use 'ThePrimeagen/vim-be-good'


    -- misc
    use 'ThePrimeagen/harpoon'
    use 'kdheepak/lazygit.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'numToStr/Comment.nvim'

    use {
        'editorconfig/editorconfig-vim',
        as = 'editorconfig',
        setup = function()
            vim.g.EditorConfig_exclude_patterns = 'fugitive://.*'
        end
    }
    use 'captbaritone/better-indent-support-for-php-with-html'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    use 'ray-x/lsp_signature.nvim'
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
        config = function()
            require("nvim-lsp-installer").setup {}
        end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- file icons
        },
        tag = 'nightly',
        config = function()
            require("nvim-tree").setup()
        end
    }


    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require('catppuccin').setup{}
            vim.cmd[[colorscheme catppuccin]]
        end,
        setup = function()
            vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
        end
    }
    -- completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'sbdchd/neoformat'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

end)
