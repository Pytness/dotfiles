lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.highlight.enabled = true

-- Disable indent for python
lvim.builtin.treesitter.indent = {
	enable = true,
	disable = { "python" },
}
