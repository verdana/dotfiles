
set -gx TERM        xterm-256color
set -gx VISUAL      vim
set -gx EDITOR      vim

set fish_function_path  $HOME/.config/fish/functions/theme-pure $fish_function_path

if test -d /usr/lib/ccache
    set fish_user_paths $fish_user_paths /usr/lib/ccache
end

if test -d /usr/local/go/bin
    set fish_user_paths $fish_user_paths /usr/local/go/bin
end

if test -d $HOME/.config/composer/vendor/bin
    set fish_user_paths $fish_user_paths $HOME/.config/composer/vendor/bin
end

# Change the prompt text
set pure_symbol_prompt         "~>"
set pure_symbol_git_up_arrow   "^"
set pure_symbol_git_down_arrow "v"
set pure_symbol_git_dirty      "!"
set pure_symbol_horizontal_bar "_"

# Change the colors
#set pure_color_blue    (set_color "1e00fd")
#set pure_color_cyan    (set_color "1e95fd")
#set pure_color_gray    (set_color "6c6c6c")
#set pure_color_green   (set_color "66ff66")
#set pure_color_normal  (set_color "000000")
#set pure_color_red     (set_color "f820ff")
#set pure_color_yellow  (set_color "1bc8c8")
# THEME PURE #
set fish_function_path /home/verdana/.config/fish/functions/theme-pure $fish_function_path
