local setup, lualine = pcall(require, "lualine")
if not setup then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    component_separators = '|',
  },
})
