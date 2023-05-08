vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<leader>th", vim.cmd("horizontal split term://zsh")

local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap("<leader>s", vim.cmd.w, "[S]ave file")
nmap("<leader>gs", vim.cmd.Git, "[Git] [S]tatus")


nmap("<leader>u", vim.cmd.UndotreeToggle, "[U]ndo Tree")

nmap("<leader>sv", "<C-w>v", "[S]plit window [V]ertical")
nmap("<leader>sh", "<C-w>s", "[S]plit window [H]orizontal")
nmap("<leader>se", "<C-w>=", "[S]plit window [E]qual")
nmap("<leader>sx", ":close<CR>", "[S]plit window E[x]it")