-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "lua_ls",
    "eslint",
    "ruby_lsp",
    "tailwindcss",
  },
  handlers = {
    tailwindcss = function()
      require("lspconfig").tailwindcss.setup({
        settings = {
          tailwindCSS = {
            validate = true,
            classAttributes = { "class", "className", ".*Classes.*" },
            experimental = {
              classRegex = {
                { "(?:twMerge|twJoin|tv)\\(([^\\);]*)[\\);]", "[`'\"]([^'\"`,;]*)[`'\"]" },
              },
            },
          },
        },
      })
    end,

    lua_ls = function()
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
        capabilities = capabilities,
      })
    end,

    ts_ls = function()
      require("lspconfig").ts_ls.setup({
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
        capabilities = capabilities,
      })
    end,

    eslint = function()
      require("lspconfig").eslint.setup({ capabilities = capabilities })
    end,

    jsonls = function()
      require("lspconfig").jsonls.setup({ capabilities = capabilities })
    end,

    cssls = function()
      require("lspconfig").cssls.setup({ capabilities = capabilities })
    end,

    ruby_lsp = function()
      require("lspconfig").ruby_lsp.setup({ capabilities = capabilities })
    end,

    rubocop = function()
      require("lspconfig").rubocop.setup({ capabilities = capabilities })
    end,
  },
})

vim.opt.signcolumn = "yes"

-- This is where you enable features that only work if there is a language server active in the
-- file
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("i", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<leader>cn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set({ "n", "x" }, "<leader>cc", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  end,
})

-- Diganostics are not exclusive to LSP servers so these can be flobal keybings
vim.keymap.set("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Open diagnostics" })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
