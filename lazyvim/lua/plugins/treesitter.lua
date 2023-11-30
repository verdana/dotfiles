return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      ensure_installed = {
        "bash",
        "c",
        "comment",
        "css",
        "go",
        "html",
        "javascript",
        "lua",
        "markdown_inline",
        "regex",
        "rust",
        "scss",
        "typescript",
        "vue",
        "yaml",
      },
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
}
