-- vim.keymap.set("n", "<leader>th", vim.cmd("horizontal split term://zsh")

local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end


-- local mappings = {
--    { "<C-s>", vim.cmd.w, "[S]ave file" },
-- }

nmap("<leader>u", vim.cmd.UndotreeToggle, "[U]ndo Tree")
--     vim.keymap.set("n", map[1], map[2], { desc = map[3] })
-- end
