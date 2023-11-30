return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = true },
    panel = { enabled = true },
    filetypes = {
      bash = true,
      go = true,
      help = true,
      javascript = true,
      lua = true,
      markdown = true,
      rust = true,
      typescript = true,
      vue = true,
    },
  },
}
