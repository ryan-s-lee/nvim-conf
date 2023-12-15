return {
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip/loaders/from_vscode").lazy_load()

        vim.opt.completeopt = "menu,menuone,noselect"

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {},
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-u>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space'] = cmp.mapping.complete(),  -- show completion window
                ['<C-e>'] = cmp.mapping.abort(),         -- close completion window

                -- Safe entry selection with <CR>. If nvim-cmp is not visible, add a newline like usual.
                ['<CR>'] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },  -- lsp
                { name = "luasnip" },   -- snippets
                { name = "buffer" },    -- text within current buffer
                { name = "path" },      -- file system paths
            }),
            formatting = {
                format = lspkind.cmp_format({
                  -- mode = 'symbol', -- show only symbol annotations
                  maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                  ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                  -- The function below will be called before any actual modifications from lspkind
                  -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                  before = function (entry, vim_item)
                    -- ...
                    return vim_item
                  end
                })
            }
        })
    end,
    dependencies = {
        "onsails/lspkind.nvim",
        {
            "L3MON4D3/LuaSnip",
        }
    }
}
