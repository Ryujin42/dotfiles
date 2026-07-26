require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

local lspconfig = require("lspconfig")
local on_attach = require("nvchad.lsp").on_attach
local capabilities = require("nvchad.lsp").capabilities

-- Python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Rust
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- JS/TS
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- C/C++
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- read :h vim.lsp.config for changing options of lsp servers 
