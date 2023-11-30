return {
  -- add gruvbox
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
