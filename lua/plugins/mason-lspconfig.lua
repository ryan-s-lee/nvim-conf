local opts = {
}

local on_attach = require("util.lsp").on_attach

local config = function ()
    -- mason.setup() has already been called, as it is a dependency
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
        ensure_installed = {
            "efm",
            "lua_ls",
        },
        automatic_installation = true,
    })
end

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    config = config,
    dependencies = "williamboman/mason.nvim",
}
