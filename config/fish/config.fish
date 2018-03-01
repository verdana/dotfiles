
set -gx TERM        xterm-256color
set -gx VISUAL      vim
set -gx EDITOR      vim
set -gx GCC_COLORS  "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

set fish_function_path  $HOME/.config/fish/functions/theme-pure $fish_function_path

if test -d /opt/cmake-3.9.0/bin
    set fish_user_paths $fish_user_paths /opt/cmake-3.9.0/bin
end

if test -d /usr/lib/ccache
    set fish_user_paths $fish_user_paths /usr/lib/ccache
end

if test -d /usr/local/go/bin
    set fish_user_paths $fish_user_paths /usr/local/go/bin
end

if test -d $HOME/go/bin
    set fish_user_paths $fish_user_paths $HOME/go/bin
end

if test -d $HOME/.config/composer/vendor/bin
    set fish_user_paths $fish_user_paths $HOME/.config/composer/vendor/bin
end

if test -d $HOME/.local/bin
    set fish_user_paths $fish_user_paths $HOME/.local/bin
end

if test -d $HOME/.yarn/bin
    set fish_user_paths $fish_user_paths $HOME/.yarn/bin
end

# Change the prompt text
set pure_symbol_prompt         ">"
set pure_symbol_git_up_arrow   "^"
set pure_symbol_git_down_arrow "v"
set pure_symbol_git_dirty      "*"
set pure_symbol_horizontal_bar "_"

# Change the colors
#set pure_color_blue    (set_color "1e00fd")
#set pure_color_cyan    (set_color "1e95fd")
#set pure_color_gray    (set_color "6c6c6c")
#set pure_color_green   (set_color "66ff66")
#set pure_color_normal  (set_color "000000")
#set pure_color_red     (set_color "f820ff")
#set pure_color_yellow  (set_color "1bc8c8")

# Change colors for username and host in SSH
set pure_username_color $pure_color_yellow
set pure_host_color     $pure_color_green
set pure_root_color     $pure_color_red

# Change where the username and host is displayed
# 0 - end of prompt, default
# 1 - start of prompt
# Any other value defaults to the default behaviour
set pure_user_host_location 0

# Max execution time of a process before its run time is shown when it exits
set pure_command_max_exec_time 5

