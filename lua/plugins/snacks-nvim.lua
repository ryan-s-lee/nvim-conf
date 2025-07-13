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
        enabled = true,
        win = {
            input = {
                keys = {
                    ["<a-h>"] = nil,
                    ["<a-d>"] = { "toggle_hidden", mode = { "i", "n" } },
                }
            }
        }
    },
    dashboard = { enabled = true },
  },

  keys = {
      { "<leader>fp", function() Snacks.picker() end, "Open picker picker" },
      { "<leader>ff", function() Snacks.picker.files() end, "Open file picker" },
      { "<leader>fb", function() Snacks.picker.buffers() end, "Open buffer picker" },
      { "<leader>fd", function() Snacks.picker.diagnostics() end, "Open diagnostics picker" },
      { "<leader>fg", function() Snacks.picker.grep() end, "Open grep search" },
  }
}
