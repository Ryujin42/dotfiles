return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable({ "pyright", "ruff", "rust_analyzer", "ts_ls", "clangd" })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "ruff",
        -- Rust
        "rust-analyzer",
        -- JS/TS
        "typescript-language-server",
        "prettier",
        -- C/C++
        "clangd",
        "clang-format",
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPre",
    dependecies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.clang_format,
        },
      })
    end,
  }


  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
