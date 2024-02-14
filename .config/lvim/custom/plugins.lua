lvim.plugins = {
	{ "lunarvim/colorschemes" },
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup {
				input = {
					enabled = true,
					insert_only = false,
					start_in_insert = false,
					border = "rounded",
					win_options = {
						winhighlight = 'FloatBorder:Delimiter'
					}
				},
				select = {
					telescope = require('telescope.themes').get_dropdown()
				}
			}
		end
	},
	-- Using custom instead of  'drewtempelmeyer/palenight.vim'
	-- due to additional custom colors
	{ "pytness/palenight.vim" },
	{
		"ggandor/lightspeed.nvim",
		event = "BufRead",
		config = function()
			require 'lightspeed'.setup {
				ignore_case = true,
				safe_labels = { 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';' },
				labels = { 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';' },
			}
		end
	},
	{
		"gen740/SmoothCursor.nvim",
		event = "WinScrolled",
		config = function()
			require('smoothcursor').setup {
				autostart = true,
				cursor = "", -- cursor shape (need nerd font)
				intervals = 15, -- tick interval
				linehl = nil, -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
				type = "exp", -- define cursor movement calculate function, "default" or "exp" (exponential).
				fancy = {
					enable = true, -- enable fancy mode
					head = { cursor = "", texthl = "SmoothCursor", linehl = nil },
					body = {
						{ cursor = "", texthl = "SmoothCursorRed" },
						{ cursor = "", texthl = "SmoothCursorOrange" },
						{ cursor = "●", texthl = "SmoothCursorYellow" },
						{ cursor = "●", texthl = "SmoothCursorGreen" },
						{ cursor = "•", texthl = "SmoothCursorAqua" },
						{ cursor = ".", texthl = "SmoothCursorBlue" },
						{ cursor = ".", texthl = "SmoothCursorPurple" },
					},
					tail = { cursor = nil, texthl = "SmoothCursor" }
				},
				priority = 10,
				speed = 25,
				texthl = "SmoothCursor", -- highlight group, default is { bg = nil, fg = "#FFD400" }
				threshold = 3,
				timeout = 3000,
			}
		end
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true,
				RRGGBB = true,
				RRGGBBAA = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
			})
		end
	},
	{
		"ziontee113/color-picker.nvim",
		config = function()
			require("color-picker")
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
				},
			})
		end,
	},
	{ 'gptlang/CopilotChat.nvim' },
	{
		"chentoast/marks.nvim",
		event = "BufReadPre",
		config = function()
			require("marks").setup {}
		end,
	},
	{
		'nmac427/guess-indent.nvim',
		config = function() require('guess-indent').setup {} end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup {
				keywords = {
					FIX = {
						icon = " ",
						color = "error",
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "" },
					},
					TODO = { icon = " ", color = "info" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
					TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },

				},
				colors = {
					-- Depends on 'pytness/palenight.vim'
					error = { "DiagnosticError" },
					warning = { "DiagnosticWarning" },
					info = { "DiagnosticInfo" },
					hint = { "DiagnosticHint" },
					default = { "DiagnosticDefault" },
					test = { "DiagnosticTest" }
				},
			}
		end,
	},
	{
		'akinsho/git-conflict.nvim',
		version = "v1.0.0",
		config = function()
			require('git-conflict').setup()
		end,
		lazy = false
	},
	{
		"iamcco/markdown-preview.nvim",
		builds = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},
	{ 'ron-rs/ron.vim' },
	{ 'lambdalisue/suda.vim' },
	{ 'lark-parser/vim-lark-syntax' },
	{ 'pest-parser/pest.vim' },
}
