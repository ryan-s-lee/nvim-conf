config = function()
    require("nvim-treesitter.configs").setup({
        indent = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
        ensure_installed = {
            "arduino",
            "bash",
            "json",
            "javascript",
            "typescript",
            "yaml",
            "html",
            "c",
            "css",
            "markdown",
            "make",
            "bash",
            "lua",
            "dockerfile",
            "solidity",
            "gitignore",
            "python",
            "xml",
            "verilog",
            "vue",
        },

        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config
}
