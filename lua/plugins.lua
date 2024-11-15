local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd("packadd packer.nvim")
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "folke/neodev.nvim"
    -- use "nekonako/xresources-nvim"
    use "aishenreemo/kizu.nvim"
    use "vim-scripts/dbext.vim"
    use "nvim-lua/plenary.nvim"
    use "nvim-treesitter/playground"
    use "nvim-tree/nvim-web-devicons"
    use "mbbill/undotree"
    use "gpanders/editorconfig.nvim"
    use "andweeb/presence.nvim"
    use "l-zeuch/yagpdb.vim"
    use "ThePrimeagen/vim-be-good"
    use "lewis6991/gitsigns.nvim"

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim",
        tag = "0.1.2",
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = "<cmd>TSUpdate",
    }

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        }
    }

    use {
        "nvim-tree/nvim-tree.lua",
        requires = "nvim-tree/nvim-web-devicons",
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
