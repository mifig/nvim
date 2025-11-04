-- Load my personal keymaps
require("mifig.keymaps")

-- Load my vim options
require("mifig.vim-options")

-- Load lazyvim config:
require("config.lazy")
require("config.bufferline")

-- Colorscheme
vim.cmd.colorscheme("catppuccin")

-- Autocomplete setup
require("mifig.cmp")

-- Custom hilight groups
require("mifig.highlights")

-- LSP configurations
require("mifig.lsp")
require("core.lsp")
