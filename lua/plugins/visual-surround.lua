-- Add surround chars in visual mode by just selecting and then typing the char
return {
  "NStefan002/visual-surround.nvim",
  enabled = false,
  opts = {
    use_default_keymaps = true,
    surround_chars = { "{", "}", "[", "]", "(", ")", "'", '"', "`" },
    exit_visual_mode = true,
  },
}
