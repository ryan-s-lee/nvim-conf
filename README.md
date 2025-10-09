# Arley's Neovim Config

I keep this repo in ~/.config/nvim on whatever Linux distro I'm using (or WSL).

According to the [Neovim runtimepath docs](https://neovim.io/doc/user/options.html#'runtimepath'),
this repo should contain several different types of files and directories that
the neovim startup process:

    filetype.lua	filetypes new-filetype
    autoload/	automatically loaded scripts autoload-functions
    colors/	color scheme files :colorscheme
    compiler/	compiler files :compiler
    doc/		documentation write-local-help
    ftplugin/	filetype plugins write-filetype-plugin
    indent/	indent scripts indent-expression
    keymap/	key mapping files mbyte-keymap
    lang/		menu translations :menutrans
    lsp/		LSP client configurations lsp-config
    lua/		Lua plugins
    menu.vim	GUI menus menu.vim
    pack/		packages :packadd
    parser/	treesitter syntax parsers
    plugin/	plugin scripts write-plugin
    queries/	treesitter queries
    rplugin/	remote-plugin scripts
    spell/	spell checking files spell
    syntax/	syntax files mysyntaxfile
    tutor/	tutorial files :Tutor

## Important Directories

### lua/

lua/ contains lua plugins, which at their very core are simply lua scripts.
In fact, Neovim only runs init.lua, in the root of the repo; it is the 
responsibility of the user to load other lua scripts using `require()`
within the init.lua directory

### plugin/

Neovim will go through each lua script in `plugin/` automatically and run
each of them.

## TODO
- [ ] Set up [conform](https://github.com/stevearc/conform.nvim)
- [ ] Set up [nvim-lint](https://github.com/mfussenegger/nvim-lint)
