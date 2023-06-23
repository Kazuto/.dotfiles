local status, codium = pcall(require, "codium")
if not status then
	return
end

codium.setup()

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
