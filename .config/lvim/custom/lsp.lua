vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "pylsp"
end, lvim.lsp.automatic_configuration.skipped_servers)
