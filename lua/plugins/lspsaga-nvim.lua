local config = function()
    require("lspsaga").setup({
        -- keybinds for navigation in lspsaga window
        move_in_saga = { prev = "<C-k>", next = "<C-j>" },
        -- use enter to open a file with the finder

        finder_action_keys = {
            open = "<CR>",
        },

        -- use enter to open a file with definition preview
        definition_action_keys = {
            edit = "<CR>",
        },
    })
end

return {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    config = config,
}
