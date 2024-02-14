lvim.colorscheme = "palenight"
lvim.builtin.lualine.options.theme = "auto"
lvim.background = 'black'
lvim.transparent_window = true
vim.opt.cursorline = true

vim.g.palenight_color_overrides = {
	--     -- black = { gui = '#000000', cterm = "0", cterm16 = "0" },
	--     blue = { gui = "#8cb8ff", cterm = "39", cterm16 = "4" },
	--     purple = { gui = "#d67cde", cterm = "170", cterm16 = "5" },
	--     blue_purple = { gui = "#8a87de", cterm = "39", cterm16 = "4" },
	--     cyan = { gui = "#96e1ff", cterm = "38", cterm16 = "6" },
	white = { gui = "#cccce6", cterm = "145", cterm16 = "7" },
	cursor_grey = { gui = "#3E4452", cterm = 236, cterm16 = "8" },
	black = { gui = "#1C1D24", cterm = "235", cterm16 = "0" },

}

vim.g.palenight_terminal_italics = 1;

-- Define custom border colors
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.cmd('highlight FloatBorder guifg=#cccce6')
		vim.cmd('highlight FloatTitle guifg=#cccce6')
	end,
})
vim.cmd("highlight FloatBorder guifg=white")

-- Get palenight colors
local colors = {
	red = "#ff5370",
	light_red = "#ff869a",
	dark_red = "#BE5046",
	green = "#C3E88D",
	yellow = "#ffcb6b",
	dark_yellow = "#F78C6C",
	blue = "#8cb8ff",
	purple = "#d67cde",
	blue_purple = "#8a87de",
	cyan = "#96e1ff",
	white = "#e6efff",
	black = "#292D3E",
	visual_black = "NONE",
	comment_grey = "#697098",
	gutter_fg_grey = "#4B5263",
	cursor_grey = "#2C323C",
	visual_grey = "#3E4452",
	menu_grey = "#3E4452",
	special_grey = "#3B4048",
	vertsplit = "#181A1F",
	white_mask_1 = "#333747",
	white_mask_3 = "#474b59",
	white_mask_11 = "#989aa2"
}


lvim.builtin.lualine.options.theme = {
	normal = {
		a = { fg = colors.black, bg = colors.white, gui = "bold" },
		b = { fg = colors.white, bg = colors.white_mask_3, gui = "bold" },
		c = { fg = colors.white, bg = colors.cursor_grey, gui = "bold" },
	},
	insert = {
		a = { fg = colors.white, bg = colors.blue, gui = "bold" },
		b = { fg = colors.blue, bg = colors.white_mask_3, gui = "bold" },
	},
	visual = {
		a = { fg = colors.white, bg = colors.purple, gui = "bold" },
		b = { fg = colors.purple, bg = colors.white_mask_3, gui = "bold" },
	},
	replace = {
		a = { fg = colors.white, bg = colors.green, gui = "bold" },
		b = { fg = colors.green, bg = colors.white_mask_3, gui = "bold" },
	},
	inactive = {
		a = { fg = colors.black, bg = colors.white_mask_3, gui = "bold" },
		-- b = { fg = colors.white_mask_3, bg = colors.white_mask_3, gui = "bold" },
	},
}
