local status, gitsigns = pcall(require, "gitsigns")
if not status then
	return
end

gitsigns.setup()

vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", { desc = "[G]o to [P]revious Hunk" })
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "[G]o to [N]ext Hunk" })
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { desc = "[H]unk [P]review" })
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "[H]unk [R]eset" })
vim.keymap.set("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", { desc = "[S]tage [B]uffer" })
