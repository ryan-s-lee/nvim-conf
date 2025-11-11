require("options")
require("globals")
require("auto")

require("config.lazy")
require("config.mini-nvim")
require("config.outline-nvim")  -- hmm...

-- Things that may have to happen after plugin configuration
local theme = require('last-color').recall() or 'default'
vim.cmd.colorscheme(theme)
require ("keymaps")
require("nomason-lsp")
