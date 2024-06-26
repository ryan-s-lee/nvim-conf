Config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			-- Default configuration for telescope goes here:
			-- config_key = value,
			mappings = {
				i = {
					-- map actions.which_key to <C-h> (default: <C-/>)
					-- actions.which_key shows the mappings for your picker,
					-- e.g. git_{create, delete, ...}_branch for the git_branches picker
					["<C-h>"] = "which_key",
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			-- Default configuration for builtin pickers goes here:
			-- picker_name = {
			--   picker_config_key = value,
			--   ...
			-- }
			-- Now the picker_config_key will be applied every time you call this
			-- builtin picker
			find_files = {
				theme = "dropdown",
				previewer = false,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = false,
			},
			find_buffers = {
				theme = "dropdown",
				previewer = false,
			},
		},
		extensions = {
			-- Your extension configuration goes here:
			-- extension_name = {
			--   extension_config_key = value,
			-- }
			-- please take a look at the readme of the extension you want to configure
            live_grep_args = {
                theme = "dropdown"
            }
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
	lazy = false,
	config = Config,
	keys = {
		vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>"),
		vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>"),
		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
		vim.keymap.set("n", "<leader>fa", ":Telescope <CR>"),
		vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"),
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
		vim.keymap.set("n", "<leader>fr", ":Telescope resume<CR>"),
		vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>"),
	},
}
