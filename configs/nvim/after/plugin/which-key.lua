local setup, which_key = pcall(require, "which-key")
if not setup then
  return
end

vim.o.timeout = true
vim.o.timeoutlen = 300

which_key.setup {
  keys = { "<leader>", '"', "'", "`", "c", "v" },
}
