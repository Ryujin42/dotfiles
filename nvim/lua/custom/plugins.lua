local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "ruff",
                "pyright",
                "mypy",
                "phpactor",
                "nvim-ts-autotag",
            },
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = { "python" },
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    },
}

return plugins
