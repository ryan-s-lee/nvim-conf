local opts = {
    ensure_installed = {
        "efm",
        "lua_ls",
    },
    automatic_installation = true,
}

local on_attach = require("util.lsp").on_attach

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    -- config = config,
    dependencies = "williamboman/mason.nvim",
}
