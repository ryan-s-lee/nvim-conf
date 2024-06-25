return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = {
        renderer = {
            group_empty = true,
            add_trailing = true,
            highlight_diagnostics = "icon",
        },
        filters = {
            dotfiles = true,
        },
        view = {
            float = {
                enable = true,
            },
            width = {
                min = 30,
                max = -1,
            },
            relativenumber = true,
        },
    },
}
