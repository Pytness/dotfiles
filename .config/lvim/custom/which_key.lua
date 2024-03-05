lvim.builtin.which_key.setup.ignore_missing = true
-- lvim.builtin.which_key.opts.noremap = false


lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.presets.g = true
lvim.builtin.which_key.setup.plugins.presets.motions = true
lvim.builtin.which_key.setup.plugins.presets.operators = true

lvim.builtin.which_key.mappings["sT"] = {
	"<cmd>TodoTelescope<cr>",
	"+Todo Telescope",
}

lvim.builtin.which_key.mappings["W"] = { ":SudaWrite<cr>", "Write with sudo" }

lvim.builtin.which_key.setup.triggers_blacklist = {
	n = { "j", "k", "m" },
	v = { "j", "k", "m" },
	i = { "j", "k", "m" },
}
