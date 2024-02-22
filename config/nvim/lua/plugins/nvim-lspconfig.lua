return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {} },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    servers = {
      gopls = {
        cmd = { "gopls", "serve" },
        settings = {
          gopls = {
            gofumpt = true,
            analyses = {
              fieldalignment = false,
            },
          },
        },
      },
      volar = {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        formatting = false,
      },
    },
  },
}
