local keymap = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- cmd+s: save file
keymap("n", "<Char-0xAA>", "<cmd>write<cr>", default_opts)
-- cmd+e: scroll downwords
keymap("n", "<Char-0xAB>", "<C-e>", default_opts)
-- cmd+e: scroll upwords
keymap("n", "<Char-0xAC>", "<C-y>", default_opts)
-- cmd+h: next tab
keymap("n", "<Char-0xAD>", "<cmd>BufferPrevious<cr>", default_opts)
-- cmd+l: last tab
keymap("n", "<Char-0xAE>", "<cmd>BufferNext<cr>", default_opts)
-- cmd+w: close current tab
keymap("n", "<Char-0xAF>", "<cmd>BufferClose<cr>", default_opts)
-- cmd+t: find file toogle 
keymap("n", "<Char-0xA1>", "<cmd>NvimTreeFindFile<cr>", default_opts)

-- cmd+1: open left bar  
keymap('n', '<Char-0xA4>', '<cmd>NvimTreeToggle<cr>', default_opts)
