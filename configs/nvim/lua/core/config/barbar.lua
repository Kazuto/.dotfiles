vim.g.barbar_auto_setup = false

require("barbar").setup({
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,

    hide = {
        extensions = true
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

vim.keymap.set("n", "<Tab>", vim.cmd.BufferNext, { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferPrevious, { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>x", vim.cmd.BufferClose, { desc = "Close Buffer" })
