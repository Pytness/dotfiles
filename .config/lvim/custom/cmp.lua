-- Remove sources from cmp
local sources_to_delete = { "buffer", "luasnip" }

lvim.builtin.cmp.sources = vim.tbl_filter(function(source)
	return not vim.tbl_contains(sources_to_delete, source.name)
end, lvim.builtin.cmp.sources)


-- Estend sources
vim.list_extend(lvim.builtin.cmp.sources, {
	{ name = "crates" },
})

-- Disable autocompletion popup unless I press ctrl-space
local cmp = require 'cmp'
local compare = cmp.config.compare
cmp.setup {
	completion = {
		autocomplete = false,
	},
	sorting = {
		priority_weight = 1.0,
		comparators = {
			-- compare.score_offset, -- not good at all
			compare.locality,
			compare.recently_used,
			compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
			compare.offset,
			compare.order,
			-- compare.scopes, -- what?
			-- compare.sort_text,
			-- compare.exact,
			-- compare.kind,
			-- compare.length, -- useless
		},
	},
}
