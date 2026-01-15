-- LazyGit integration
-- Command provided by `kdheepak/lazygit.nvim`: :LazyGit

vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_use_neovim_remote = 1

-- Keymaps
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { silent = true, desc = "LazyGit" })

