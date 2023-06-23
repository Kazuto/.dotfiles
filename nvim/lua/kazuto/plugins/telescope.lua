local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

telescope.setup()

telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "[F]ind [W]ord" })
vim.keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "[F]ind [C]ursor" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "[F]ind [B]ufffer" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "[F]ind [H]elp" })
