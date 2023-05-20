local status, barbar = pcall(require, "barbar")
if not status then
	return
end

vim.g.barbar_auto_setup = false

barbar.setup({
	animation = true,
	auto_hide = false,
	tabpages = true,
	clickable = true,

	hide = {
		extensions = false,
	},

	buffer_index = false,
	buffer_number = false,

	maximum_padding = 2,

	icons = {
		buffer_index = true,
		button = "",

		filetype = {
			custom_colors = false,
			enabled = true,
		},

		gitsigns = {
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},

		separator = { left = "▎", right = "" },

		modified = { button = "●" },
		pinned = { button = "車", filename = true, separator = { right = "" } },
	},

	sidebar_filetypes = {
		NvimTree = true,
		undotree = true,
	},
})
