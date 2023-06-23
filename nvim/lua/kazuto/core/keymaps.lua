vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[Git] [S]tatus" })
vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "[S]ave file" })

-- split windows
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertical" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [H]orizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "[S]plit window [E]qual" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "[S]plit window E[x]it" })

