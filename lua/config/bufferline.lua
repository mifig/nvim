vim.opt.termguicolors = true

require("bufferline").setup({
  options = {
    enabled = false,
    hover = {
      enabled = true,
      delay = 150,
      reveal = { "close" },
    },
    offsets = {
      filetype = "neo-tree",
      text = "File Explorer",
      text_align = "left",
      separator = true,
    },
  },
})
