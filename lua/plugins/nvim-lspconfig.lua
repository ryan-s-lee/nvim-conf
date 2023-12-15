-- Steps to add a new LSP!
-- 1. Run :Mason
-- 2. Pick your LSP, formatter, and linter
-- 3. inside config(), set up your lsp: lspconfig.<your_ls>.setup({}). Add an on_attach and some settings (see Mason)
-- 4. for your linters, add pull in the default configs for efm: local luacheck = require("efmls-configs.linters.luacheck")
-- 5. in lspconfig.efm.setup.filetypes, add your language as a string
-- 6. in lspconfig.efm.setup.settings, add an entry with your language as the key and your formatters/linters as values in a table
-- DONE!

local on_attach = require("util.lsp").on_attach
-- TODO: Consider replacing EFM with more fine-grained plugins (conform.nvim, nvim-lint, etc.)
local config = function()
	-- TODO: Figure out how neoconf works
	require("neoconf").setup({})

	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	-- TODO: Learn what cmp_nvim completion source capabilities are
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- enable keybinds whenever an lsp server is available.

	local handlers = {
		function(server_name)
			lspconfig[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
                root_dir = function() return vim.loop.cwd() end
			})
		end,

		["lua_ls"] = function()
			-- TODO
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,

		["pyright"] = function()
			-- TODO
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				-- root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
				root_dir = function()
					return vim.loop.cwd()
				end,
				settings = {
					pyright = {
						disableLanguageServices = false,
						disableOrganizeImports = false,
						analysis = {
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
							autoSearchPaths = true,
							autoImportCompletions = true,
						},
					},
				},
			})
		end,
		["clangd"] = function()
			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
		end,
	}

	local mason_lspconfig = require("mason-lspconfig") -- already set up
	mason_lspconfig.setup_handlers(handlers)

	-- lua
	-- lspconfig.lua_ls.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	settings = {
	-- 		Lua = {
	-- 			diagnostics = {
	-- 				globals = { "vim" },
	-- 			},
	-- 			workspace = {
	-- 				library = {
	-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- })

	-- lua linters and formatters
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- python
	-- lspconfig.pyright.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	-- root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	-- 	root_dir = function()
	-- 		return vim.loop.cwd()
	-- 	end,
	-- 	settings = {
	-- 		pyright = {
	-- 			disableLanguageServices = false,
	-- 			disableOrganizeImports = false,
	-- 			analysis = {
	-- 				useLibraryCodeForTypes = true,
	-- 				diagnosticMode = "workspace",
	-- 				autoSearchPaths = true,
	-- 				autoImportCompletions = true,
	-- 			},
	-- 		},
	-- 	},
	-- })

	-- python linters and formatters
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	-- typescript
	-- lspconfig.tsserver.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- })

	-- typescript linters and formatters
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")

	-- java
	-- lspconfig.jdtls.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- })
	local google_java_format = require("efmls-configs.formatters.google_java_format")

	-- cpp
	-- lspconfig.clangd.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	cmd = {
	-- 		"clangd",
	-- 		"--offset-encoding=utf-16",
	-- 	},
	-- })
	local clang_tidy_lint = require("efmls-configs.linters.clang_tidy")
	local clang_tidy_format = require("efmls-configs.formatters.clang_tidy")

	-- bash
	-- lspconfig.bashls.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- })
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	-- SystemVerilog
	-- lspconfig.verible.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	root_dir = function()
	-- 		return vim.loop.cwd()
	-- 	end,
	-- })
	local verible_verilog_format = {
		formatCommand = string.format("%s -", require("efmls-configs.fs").executable("verible-verilog-format")),
		formatStdin = true,
	}

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"typescript",
			"javascript",
			"java",
			"cpp",
			"c",
			"bash",
			"systemverilog",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				typescript = { eslint_d, prettier_d },
				javascript = { eslint_d, prettier_d },
				java = { google_java_format },
				cpp = { clang_tidy_lint, clang_tidy_format },
				c = { clang_tidy_format, clang_tidy_lint },
				bash = { shellcheck, shfmt },
				systemverilog = { verible_verilog_format },
			},
		},
	})

	-- Format
	vim.api.nvim_create_user_command("Fmt", function(opts)
		local client = vim.lsp.get_active_clients({ name = "efm" })
		if not vim.tbl_isempty(client) then
			vim.lsp.buf.format({ name = "efm" })
		end
	end, {})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
