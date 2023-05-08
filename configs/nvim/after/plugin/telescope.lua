local setup, telescope = pcall(require, "telescope")
if not setup then
  return
end

telescope.setup()

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles"})

vim.keymap.set("n", "<leader>fw", function ()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "[F]ind [W]ord"})

vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld" })

vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })

