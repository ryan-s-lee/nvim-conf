-- default key remaps that I prefer

local keymap = vim.keymap
local silent_opts = {noremap = true, silent = true}

-- in visual line block mode, when indenting lines, keep visual block mode on
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("n", "gq", vim.lsp.buf.format, { desc = "Format doc" })
-- keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
local virt_lines_ns = vim.api.nvim_create_namespace 'on_diagnostic_jump'
--- @param diagnostic? vim.Diagnostic
--- @param bufnr integer
local function on_jump(diagnostic, bufnr)
    if not diagnostic then
        print("no diagnostic")
        return
    end
    vim.diagnostic.show(
        virt_lines_ns,
        bufnr,
        { diagnostic },
        { virtual_lines = { current_line = true }, virtual_text = false }
    )
end

keymap.set("n", "<C-w>]s", "<C-w><C-s><C-]>", { desc = 'hsplit and go to tag' })
keymap.set("n", "<C-w><C-]>s", "<C-w><C-s><C-]>", { desc = 'hsplit and go to tag' })
keymap.set("n", "<C-w><C-]><C-s>", "<C-w><C-s><C-]>", { desc = 'hsplit and go to tag' })
keymap.set("n", "<C-w>]v", "<C-w><C-v><C-]>", { desc = 'vsplit and go to tag' })
keymap.set("n", "<C-w><C-]>v", "<C-w><C-v><C-]>", { desc = 'vsplit and go to tag' })
keymap.set("n", "<C-w><C-]><C-v>", "<C-w><C-v><C-]>", { desc = 'vsplit and go to tag' })

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

--------------------------------------------------------------------------------

