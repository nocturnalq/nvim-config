---@brief
--- https://github.com/zigtools/zls
---
--- Zig LSP implementation + Zig Language Server

local shared = require('lsp.shared')
-- don't show parse errors in a separate window
vim.g.zig_fmt_parse_errors = 0
-- disable format-on-save from `ziglang/zig.vim`
vim.g.zig_fmt_autosave = 0
-- enable  format-on-save from vim.lsp + ZLS
--
-- Formatting with ZLS matches `zig fmt`.
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { "*.zig", "*.zon" },
  callback = function(ev)
    vim.lsp.buf.format()
  end
})
vim.lsp.config('zls', {
  on_attach = shared.on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root_markers = { 'zls.json', 'build.zig', '.git' },
  workspace_required = false,
})
