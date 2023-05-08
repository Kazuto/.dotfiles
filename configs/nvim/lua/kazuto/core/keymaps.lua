vim.g.mapleader = " "
vim.g.maplocalleader = " "

local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap("<leader>s", vim.cmd.w, "[S]ave file")
nmap("<leader>gs", vim.cmd.Git, "[Git] [S]tatus")

-- split windows
nmap("<leader>sv", "<C-w>v", "[S]plit window [V]ertical")
nmap("<leader>sh", "<C-w>s", "[S]plit window [H]orizontal")
nmap("<leader>se", "<C-w>=", "[S]plit window [E]qual")
nmap("<leader>sx", ":close<CR>", "[S]plit window E[x]it")

-- nvim-tree
nmap("<C-b>", vim.cmd.NvimTreeToggle, "Toggle Nvim Tree")

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

nmap("<leader>a", mark.add_file, "[A]dd to harpoon")
nmap("<C-e>", ui.toggle_quick_menu, "Open harpoon")

nmap("<C-h>", function() ui.nav_file(1) end)
nmap("<C-t>", function() ui.nav_file(2) end)
nmap("<C-n>", function() ui.nav_file(3) end)
nmap("<C-s>", function() ui.nav_file(4) end)

-- undotree
nmap("<leader>u", vim.cmd.UndotreeToggle, "[U]ndo Tree")

-- barbar
nmap("<Tab>", vim.cmd.BufferNext, "Next Buffer" )
nmap("<S-Tab>", vim.cmd.BufferPrevious, "Previous Buffer" )
nmap("<leader>x", vim.cmd.BufferClose, "Close Buffer" )

-- nvterm
local terminal = require("nvterm.terminal")

local mappings = {
  { {'n', 't'}, '<A-h>', function () terminal.toggle('horizontal') end },
  { {'n', 't'}, '<A-v>', function () terminal.toggle('vertical') end },
}

local opts = { noremap = true, silent = true }

for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end

-- telescope
nmap("<leader>ff", ":Telescope find_files<CR>", "[F]ind [F]iles")
nmap("<leader>fs", ":Telescope live_grep<CR>", "[F]ind [W]ord")
nmap("<leader>fc", ":Telescope grep_string<CR>", "[F]ind [C]ursor")
nmap("<leader>fb", ":Telescope buffers<CR>", "[F]ind [B]ufffer")
nmap("<leader>fh", ":Telescope help_tags<CR>", "[F]ind [H]elp")