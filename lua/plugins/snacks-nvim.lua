return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        picker = {
            win = {
                input = {
                    keys = {
                        ["<a-h>"] = nil,
                        ["<a-d>"] = { "toggle_hidden", mode = { "i", "n" } },
                    }
                }
            },
            ui_select = true,
        },
        dashboard = { enabled = true },
    },

    keys = {
        { "<leader>fp", function() Snacks.picker() end,                                              "Open picker picker" },
        { "<leader>ff", function() Snacks.picker.files() end,                                        "Open file picker" },
        { "<leader>fe", function() Snacks.picker.explorer() end,                                     "Open file picker" },
        { "<leader>fb", function() Snacks.picker.buffers() end,                                      "Open buffer picker" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end,                                  "Open diagnostics picker" },
        { "<leader>fg", function() Snacks.picker.grep() end,                                         "Open grep search" },
        { "<leader>fs", function() Snacks.picker.lsp_symbols() end,                                  "Open file picker" },
        { "<leader>fr", function() Snacks.picker.resume() end,                                       "Resume picker" },
        { "<leader>fw", function() Snacks.picker.lsp_workspace_symbols() end,                                       "Resume picker" },
        { "gri",        function() Snacks.picker.lsp_implementations({ auto_confirm = false }) end,  "Go to implementation" },
        { "grr",        function() Snacks.picker.lsp_references({ auto_confirm = false }) end,       "Go to implementation" },
        { "gd",         function() Snacks.picker.lsp_definitions({ auto_confirm = false }) end,      "Go to definition" },
        { "grt",        function() Snacks.picker.lsp_type_definitions({ auto_confirm = false }) end, "Go to definition" },
    }
}
