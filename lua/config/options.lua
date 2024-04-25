local opt = vim.opt

-- Tab / Indentation

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
--TODO: set wrap to true on markdown, tex, and txt files
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = '120'
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 5
opt.completeopt = "menuone,noinsert,noselect"

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
-- TODO: customize cursor
-- opt.guicursor = ???
opt.encoding = "UTF-8"
opt.exrc = true
