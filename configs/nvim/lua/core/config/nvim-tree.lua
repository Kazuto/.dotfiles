vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = {
        -- width = 30,
        adaptive_size = true
    },
})

vim.keymap.set("n", "<c-n>", vim.cmd.NvimTreeFocus, { desc = "Toggle Nvim Tree"})
-- vim.keymap.set("n", "<C-n>", ':NvimTreeFindFileToggle<CR>', { desc = "Toggle Nvim Tree"})


