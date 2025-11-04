vim.opt.termguicolors = true

require("bufferline").setup({
  options = {
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
