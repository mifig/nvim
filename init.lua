-- Load my personal keymaps
require("mifig.keymaps")

-- Load my vim options
require("mifig.vim-options")

-- Load lazyvim config:
require("config.lazy")

-- Colorscheme
vim.cmd.colorscheme("catppuccin")

-- Load misc configurations (not related to any particular package)
require("mifig.misc")

-- Autocomplete setup
require("mifig.cmp")

-- Custom hilight groups
require("mifig.highlights")

-- LSP configurations
require("mifig.lsp")
require("core.lsp")
