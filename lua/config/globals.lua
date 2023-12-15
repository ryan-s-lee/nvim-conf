-- Use space as leader, removing default behavior
vim.keymap.set({"n", "v"}, "<Space>", "<nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "
