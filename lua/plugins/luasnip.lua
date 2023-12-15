return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    keys = {
        -- TODO: Figure out purpose of luasnip.expand
        -- { "<C-K>", function() require("luasnip").expand() end, "i", silent = true},
        {"<C-L>", function() require("luasnip").jump( 1) end, mode = "i", silent = true},
        {"<C-J>", function() require("luasnip").jump(-1) end, mode = "i", silent = true},

        {"<C-E>", function()
            local ls = require("luasnip")
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, mode = "i", silent = true},
    }
}
