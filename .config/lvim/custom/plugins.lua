lvim.plugins = {
	{ "lunarvim/colorschemes" },
	{
		-- Improve the default vim.ui interrfaces
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
		-- Add fast motions for the whole buffer
		"ggandor/lightspeed.nvim",
		event = "BufRead",
		config = function()
			require 'lightspeed'.setup {
				ignore_case = true,
			}
		end
	},
	{
		-- Add animated scrolling
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
		-- Show colors for hex, rgb, hsl and css strings
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
		-- Add copilot support
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
	{
		'crusj/bookmarks.nvim',
		event = "BufRead",
		config = function()
			require("bookmarks").setup({
				storage_dir = "", -- Default path: vim.fn.stdpath("data").."/bookmarks,  if not the default directory, should be absolute path",
				mappings_enabled = true, -- If the value is false, only valid for global keymaps: toggle、add、delete_on_virt、show_desc
				keymap = {
					toggle = "ma", -- Toggle bookmarks(global keymap)
					close = "<esc>", -- close bookmarks (buf keymap)
					add = "mm",
					add_global = "mg",
					delete_on_virt = "md", -- Delete bookmark at virt text line(global keymap)
					delete = "dd", -- Delete bookmarks(buf keymap)
					show_desc = "ms", -- show bookmark desc(global keymap)

					jump = "<CR>", -- Jump from bookmarks(buf keymap)
					order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
					focus_tags = "<c-j>", -- focus tags window
					focus_bookmarks = "<c-k>", -- focus bookmarks window
					toogle_focus = "<C-Tab>", -- toggle window focus (tags-window <-> bookmarks-window)
				},
				width = 0.8, -- Bookmarks window width:  (0, 1]
				height = 0.7, -- Bookmarks window height: (0, 1]
				preview_ratio = 0.45, -- Bookmarks preview window ratio (0, 1]
				tags_ratio = 0.1, -- Bookmarks tags window ratio
				fix_enable = true, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.

				virt_text = "", -- Show virt text at the end of bookmarked lines, if it is empty, use the description of bookmarks instead.
				sign_icon = "󰃃", -- if it is not empty, show icon in signColumn.
				virt_pattern = { "*.go", "*.lua", "*.sh", "*.php", "*.rs" }, -- Show virt text only on matched pattern
				virt_ignore_pattern = {}, -- Ignore showing virt text on matched pattern, this works after virt_pattern
				border_style = "rounded", -- border style: "single", "double", "rounded"
				hl = {
					border = "TelescopeBorder", -- border highlight
					cursorline = "guibg=#3E4452 guifg=#cccce6", -- cursorline highlight
				}
			})
		end
	},

	-- {
	-- 	'tomasky/bookmarks.nvim',
	-- 	-- after = "telescope.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require('bookmarks').setup {
	-- 			-- sign_priority = 8,  --set bookmark sign priority to cover other sign
	-- 			save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
	-- 			keywords = {
	-- 				["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
	-- 				["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
	-- 				["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
	-- 				["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
	-- 			},
	-- 			on_attach = function(bufnr)
	-- 				local bm = require "bookmarks"
	-- 				local map = vim.keymap.set
	-- 				map("n", "ma", bm.bookmark_toggle) -- add or remove bookmark at current line
	-- 				map("n", "mm", bm.bookmark_ann) -- add or edit mark annotation at current line
	-- 				map("n", "md", bm.bookmark_clean) -- clean all marks in local buffer
	-- 				map("n", "mb", bm.bookmark_prev) -- jump to previous mark in local buffer
	-- 				map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
	-- 				map("n", "ml", "<cmd>Telescope bookmarks list<cr>") -- show marked file list in quickfix window
	-- 			end
	-- 		}

	-- 		require('telescope').load_extension('bookmarks')
	-- 	end
	-- },
	{
		-- Follow file indentation
		'nmac427/guess-indent.nvim',
		config = function() require('guess-indent').setup {} end,
	},
	{
		-- Add colors to special comments
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
		-- Visualise and resolve git conflicts
		'akinsho/git-conflict.nvim',
		version = "*",
		config = true
	},
	{
		-- Add support for RON files
		'ron-rs/ron.vim'
	},
	{
		-- Add Sudo Write/Read command
		'lambdalisue/suda.vim'
	},
	{ 'lark-parser/vim-lark-syntax' },
	{ 'pest-parser/pest.vim' },
	{ 'dstein64/vim-startuptime' }
}
