vim.opt.timeoutlen = 10 -- time to wait for a mapped sequence to complete, fixes slow which-key

lvim.builtin.which_key.mappings["sT"] = {
	"<cmd>TodoTelescope<cr>",
	"+Todo Telescope",
}

lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.presets.g = true
