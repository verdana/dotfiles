-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.loaded_python3_provider = 1
vim.g.loaded_node_provider = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

if vim.g.neovide then
  -- Font
  vim.o.guifont = "Sarasa Fixed SC Nerd Font:h16"

  -- Line spacing
  vim.opt.linespace = 4

  -- Scale
  vim.g.neovide_scale_factor = 1.0

  -- Padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- Floating Blur Amount
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  -- Floating Shadow
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 4

  -- Transparency
  vim.g.neovide_transparency = 1.0

  -- Scroll Animation Length
  vim.g.neovide_scroll_animation_length = 0.1

  -- Far scroll lines
  vim.g.neovide_scroll_animation_far_lines = 1

  -- Hiding the mouse when typing
  vim.g.neovide_hide_mouse_when_typing = false

  -- Underline automatic scaling
  vim.g.neovide_underline_stroke_scale = 1.0

  -- Theme
  -- vim.g.neovide_theme = "auto"

  -- Fix border and winbar scrolling glitches
  vim.g.neovide_unlink_border_highlights = true

  -- Refresh Rate
  vim.g.neovide_refresh_rate = 60

  -- Idle Refresh Rate
  vim.g.neovide_refresh_rate_idle = 5

  -- No Idle
  vim.g.neovide_no_idle = true

  -- Confirm Quit
  vim.g.neovide_confirm_quit = true

  -- Fullscreen
  vim.g.neovide_fullscreen = false

  -- Remember Previous Window Size
  vim.g.neovide_remember_window_size = true

  -- Profiler
  vim.g.neovide_profiler = false

  -- macOS Alt is Meta
  vim.g.neovide_input_macos_alt_is_meta = false

  -- IME
  vim.g.neovide_input_ime = true

  -- Animation Length
  vim.g.neovide_cursor_animation_length = 0.13
  -- Animation Trail Size
  vim.g.neovide_cursor_trail_size = 0.7
  -- Antialiasing
  vim.g.neovide_cursor_antialiasing = true
  -- Animate in insert mode
  vim.g.neovide_cursor_animate_in_insert_mode = true
  -- Animate switch to command line
  vim.g.neovide_cursor_animate_command_line = true
  -- Unfocused Outline Width
  vim.g.neovide_cursor_unfocused_outline_width = 0.1
  -- vfx mode
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
