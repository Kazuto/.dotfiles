local status, harpoon = pcall(require, "harpoon")
if not status then
	return
end

harpoon.setup()

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd to harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Open harpoon" })
