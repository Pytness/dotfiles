lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.width = 0.75
lvim.builtin.telescope.defaults.layout_config.height = 0.75
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"

local telescope_actions = require('telescope.actions')
lvim.builtin.telescope.defaults.mappings = {
	i = {
		["<C-j>"] = telescope_actions.move_selection_next,
		["<C-k>"] = telescope_actions.move_selection_previous,
	},
	n = {
		["<C-j>"] = telescope_actions.move_selection_next,
		["<C-k>"] = telescope_actions.move_selection_previous,
	}
}
