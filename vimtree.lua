-- disalbe netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Горячие клавиши для nvim-tree (добавляем глобально)
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })       -- открыть/закрыть дерево
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { silent = true })   -- фокус на дерево (если уже открыто)
