local status, barbar = pcall(require, "barbar")
if not status then
  return
end

vim.g.barbar_auto_setup = false

barbar.setup({
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,

    hide = {
        extensions = false
    },

    icons = {
        buffer_index = true,
        button = "",

        filetype = {
            custom_colors = false,
            enabled = true,
        },

        separator = { left = "▎", right = "" },

        modified = { button = "●" },
        pinned = { button = "車", filename = true, separator = { right = "" } },
    }
})