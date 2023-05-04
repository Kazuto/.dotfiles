-- vim.keymap.set("n", "<leader>th", vim.cmd("horizontal split term://zsh")

vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "[S]ave file" })
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[Git] [S]tatus"})


-- local mappings = {
--    { "<C-s>", vim.cmd.w, "[S]ave file" },
-- }

-- for _, map in ipairs(mappings) do
--     vim.keymap.set("n", map[1], map[2], { desc = map[3] })
-- end
