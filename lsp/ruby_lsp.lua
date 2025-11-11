---@type vim.lsp.Config
return {
  cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
  filetypes = { "ruby", "eruby" },
  root_markers = {
    "Gemfile",
  },
  single_file_support = true,
}
