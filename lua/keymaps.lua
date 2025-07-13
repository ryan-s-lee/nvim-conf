-- default key remaps that I prefer

local keymap = vim.keymap
local silent_opts = {noremap = true, silent = true}

-- in visual line block mode, when indenting lines, keep visual block mode on
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- PLUGINS ---------------------------------------------------------------------

-- netrw
-- keymap.set("n", "<leader>ft", ":Explore<CR>", silent_opts)

-- Telescope (disabled)
-- local builtin = require('telescope.builtin')
-- keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Oil (disabled)
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- mini.files
vim.keymap.set("n", "-", MiniFiles.open, { desc = "Open parent directory" })
-- mini.sessions

--------------------------------------------------------------------------------

