local setup, nvim_tree = pcall(require, "nvim-tree")
if not setup then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    view = {
        adaptive_size = true
    },
})

vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle, { desc = "Toggle Nvim Tree"})


