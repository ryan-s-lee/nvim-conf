require("options")
require("globals")
require("auto")

require("config.lazy")
require("config.mini-nvim")

-- Things that may have to happen after plugin configuration
vim.cmd("colorscheme rose-pine-dawn")
require ("keymaps")
require("nomason-lsp")
