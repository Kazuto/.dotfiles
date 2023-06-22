vim.g.mapleader = " "
vim.g.maplocalleader = " "

NMAP("<leader>gs", vim.cmd.Git, "[Git] [S]tatus")

-- split windows
-- NMAP("<leader>sv", "<C-w>v", "[S]plit window [V]ertical")
-- NMAP("<leader>sh", "<C-w>s", "[S]plit window [H]orizontal")
-- NMAP("<leader>se", "<C-w>=", "[S]plit window [E]qual")
-- NMAP("<leader>sx", ":close<CR>", "[S]plit window E[x]it")

-- nvim-tree
NMAP("<C-b>", vim.cmd.NvimTreeToggle, "Toggle Nvim Tree")

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

NMAP("<leader>a", mark.add_file, "[A]dd to harpoon")
NMAP("<C-e>", ui.toggle_quick_menu, "Open harpoon")

-- undotree
NMAP("<leader>u", vim.cmd.UndotreeToggle, "[U]ndo Tree")

-- barbar
NMAP("<Tab>", vim.cmd.BufferNext, "Next Buffer")
NMAP("<S-Tab>", vim.cmd.BufferPrevious, "Previous Buffer")
NMAP("<C-x>", vim.cmd.BufferClose, "Close Buffer")

-- telescope
NMAP("<leader>ff", ":Telescope find_files<CR>", "[F]ind [F]iles")
NMAP("<leader>fs", ":Telescope live_grep<CR>", "[F]ind [W]ord")
NMAP("<leader>fc", ":Telescope grep_string<CR>", "[F]ind [C]ursor")
NMAP("<leader>fb", ":Telescope buffers<CR>", "[F]ind [B]ufffer")
NMAP("<leader>fh", ":Telescope help_tags<CR>", "[F]ind [H]elp")

-- tagbar
NMAP("<C-Return>", ":TagbarToggle<CR>")

NMAP("<C-s>", vim.cmd.w, "[S]ave file")

-- Codium
-- IMAP("<c-;", "<CMD>call codeium#CycleCompletions(1)<CR>" , "[C]odium")
-- IMAP("<c-,", "<CMD>call codeium#CycleCompletions(-1)<CR>" , "[C]odium")
--
-- IMAP('<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
-- IMAP('<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
-- IMAP('<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
-- IMAP('<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

vim.g.codeium_disable_bindings = 1

vim.keymap.set("i", "<C-CR>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, noremap = true })
vim.keymap.set("i", "<C-;>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, noremap = true })
vim.keymap.set("i", "<C-,>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, noremap = true })
vim.keymap.set("i", "<C-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true, noremap = true })
