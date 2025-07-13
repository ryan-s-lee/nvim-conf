-- Even in Neovim 0.11, I decided to install mason-lspconfig because
-- whenever I installed a language server via Mason,
-- I didn't want to have to go back to my neovim configuration to
-- set up configs before I could use the langauge server.
-- mason-lspconfig's primary purpose here is to automatically
-- draw enable and configure an LSP server after a Mason install.
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
