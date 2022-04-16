require("bufferline").setup{
	options = {
		numbers = function(opts)
			return string.format('%s|%s.)', opts.id, opts.raise(opts.ordinal))
		end,
		tab_size = 4,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		separator_style = "slant",
		show_close_icon = false,
	}
}
