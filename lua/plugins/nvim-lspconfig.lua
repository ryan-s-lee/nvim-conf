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
	--
	-- lua linters and formatters
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- python linters and formatters
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	-- typescript linters and formatters
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")

	-- java

	-- cpp
	local clang_tidy_lint = require("efmls-configs.linters.clang_tidy")
	local clang_format = require("efmls-configs.formatters.clang_format")

	-- bash
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	-- SystemVerilog
	local verible_verilog_format = {
		formatCommand = string.format("%s -", require("efmls-configs.fs").executable("verible-verilog-format")),
		formatStdin = true,
	}

	-- XML
	local xmlformatter = {
		formatCommand = string.format("%s -", require("efmls-configs.fs").executable("xmlformat")),
		formatStdin = true,
	}

    -- Haskell
    local fourmolu = require("efmls-configs.formatters.fourmolu")

    -- Latex
    local latex_indent = require("efmls-configs.formatters.latexindent")

	local handlers = {
		function(server_name)
			lspconfig[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = function()
					return vim.loop.cwd()
				end,
			})
		end,

		["efm"] = function()
			lspconfig.efm.setup({
				filetypes = {
                    "html",
                    "htmldjango",
					"lua",
					"python",
					"typescript",
					"javascript",
					"cpp",
					"c",
					"bash",
					"systemverilog",
					"json",
					"xml",
                    "haskell",
                    "svelte",
                    "css",
                    "latex",
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
                        html = {prettier_d},
                        htmldjango = {prettier_d},
						lua = { luacheck, stylua },
						python = { flake8, black },
						typescript = { eslint_d, prettier_d },
						javascript = { eslint_d, prettier_d },
						cpp = { clang_tidy_lint, clang_format },
						c = { clang_tidy_lint, clang_format },
						bash = { shellcheck, shfmt },
						systemverilog = { verible_verilog_format },
						json = { prettier_d },
						xml = { xmlformatter },
                        haskell = { fourmolu },
                        svelte = {eslint_d, prettier_d },
                        css = {prettier_d},
                        latex = {latex_indent},
					},
				},
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

		["lemminx"] = function()
			lspconfig.lemminx.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				root_dir = function()
					return vim.loop.cwd()
				end,
				settings = {
					xml = {
						server = {
							workDir = "~/.cache/lemminx",
						},
						fileAssocations = {
							{
								systemId = "",
								pattern = "pom.xml",
							},
						},
					},
				},
			})
		end,

        ["hls"] = function()
            lspconfig.hls.setup({
				root_dir = function()
					return vim.loop.cwd()
				end,
            })
        end,

        ["jdtls"] = function()
            lspconfig.jdtls.setup({
				capabilities = capabilities,
                on_attach = on_attach,
            })
        end,
	}

	local mason_lspconfig = require("mason-lspconfig") -- already set up
	mason_lspconfig.setup_handlers(handlers)

	-- configure efm server

	-- Format
	vim.api.nvim_create_user_command("Fmt", function(opts)
		local client = vim.lsp.get_active_clients({ name = "efm" })
		if not vim.tbl_isempty(client) then
			vim.lsp.buf.format({ name = "efm" })
		else
			vim.lsp.buf.format()
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
