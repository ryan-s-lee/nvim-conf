return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc" },
        install_dir = vim.fn.stdpath('data') .. '/site',
        auto_install = true,
        highlight = {
            enable = true,
            addition_vim_regex_highlighting = true,
        },
    },  -- default
    lazy = false,  -- treesitter does not support lazy loading yet
    branch = "main",  -- treesitter main is the only branch currently being updated
    build = ":TSUpdate",
}
