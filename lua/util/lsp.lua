local km = vim.keymap
local M = {}
M.on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    km.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
    km.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
    km.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    km.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    km.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    km.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    km.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    km.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    km.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    km.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    km.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opts)
end

return M
