local keymap = vim.keymap

silent_opts = {noremap = true, silent = true}
-- Directory Navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", silent_opts)
keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>", silent_opts)

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", silent_opts)
keymap.set("n", "<C-j>", "<C-w>j", silent_opts)
keymap.set("n", "<C-k>", "<C-w>k", silent_opts)
keymap.set("n", "<C-l>", "<C-w>l", silent_opts)

-- Buffer Navigation
keymap.set("n", "<C-PageUp>", ":bp<CR>", silent_opts)
keymap.set("n", "<C-PageDown>", ":bn<CR>", silent_opts)


-- Window management
keymap.set("n", "<leader>sv", ":vsplit<CR>", silent_opts) -- Split vertically
keymap.set("n", "<leader>sh", ":split<CR>", silent_opts) -- Split vertically

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", {noremap = false})
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", {noremap = false})

-- Command Bar
keymap.set("c", "<cr>", 
    function()
        if vim.fn.pumvisible() == 1 then return "<c-y>" end
        return "<cr>"
    end, 
    {expr = true}
)


-- Completion
-- remap ctrl-space to omnifunc
keymap.set("i", "<C-Space>", "<Nop>", {noremap = true})
