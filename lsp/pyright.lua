-- pyright LSP configuration
local shared = require('lsp.shared')

vim.lsp.config('pyright', {
  on_attach = shared.on_attach,
})
