local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

lspconfig.phpactor.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php", "phtml" },
  root_dir = lspconfig.util.root_pattern("composer.json"),
})

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

lspconfig.qmlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "qml" },
})

