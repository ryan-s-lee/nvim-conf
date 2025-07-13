return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  version = "*",
  lazy = false,  -- we want nvimtree right away
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
        view = {
            float = {
                enable = true,
            },
        },
    }
  end,
}
