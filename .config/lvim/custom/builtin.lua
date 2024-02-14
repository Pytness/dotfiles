lvim.log.level = "warn"
lvim.format_on_save = true
vim.opt.whichwrap = "b,s"

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.diagnostic.config({
	virtual_text = false,
	underline = true,
})

vim.cmd("set relativenumber")
vim.cmd("set background=dark")
vim.cmd("set termguicolors")
vim.cmd("set autoindent noexpandtab tabstop=8 shiftwidth=8")
vim.cmd("set cmdheight=1")
