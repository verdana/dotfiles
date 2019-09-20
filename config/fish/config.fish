# Common env variables
set -gx Language    en_US.en
set -gx LANG        en_US.UTF-8
set -gx LC_ALL      en_US.UTF-8
set -gx LC_COLLATE  C
set -gx VISUAL      vim
set -gx EDITOR      vim

# ccache
set -gx CCACHE_PATH     /usr/bin
set -gx CCACHE_DIR      /tmp/ccache

# Pure prompt
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions $fish_function_path
# THEME PURE #
source $HOME/.config/fish/functions/theme-pure/conf.d/pure.fish

# User paths
set user_paths $user_paths              \
    $HOME/.config/composer/vendor/bin   \
    $HOME/.local/bin                    \
    $HOME/.rbenv/bin                    \
    $HOME/go/bin                        \
    /usr/lib/ccache                     \
    /usr/lib/colorgcc                   \
    /usr/local/go/bin

for path in $user_paths
    if test -d $path
        set -x PATH $path $PATH
    end
end

# rbenv init
if type "rbenv" > /dev/null 2>&1
    status --is-interactive; and source (rbenv init -|psub)
end

# Change the prompt text
set pure_symbol_prompt         ">"
set pure_symbol_git_up_arrow   "^"
set pure_symbol_git_down_arrow "v"
set pure_symbol_git_dirty      "!"
set pure_symbol_horizontal_bar "_"

# Change the colors
#set pure_color_blue     (set_color "6496D2")
#set pure_color_cyan     (set_color "5F7175")
#set pure_color_gray     (set_color "49483E")
#set pure_color_green    (set_color "A5D23C")
#set pure_color_normal   (set_color "F0F0F0")
#set pure_color_red      (set_color "FA2673")
#set pure_color_yellow   (set_color "F5BE78")

# Change colors for username and host in SSH
#set pure_username_color $pure_color_yellow
#set pure_host_color     $pure_color_green
#set pure_root_color     $pure_color_red

# Change where the username and host is displayed
# 0 - end of prompt, default
# 1 - start of prompt
# Any other value defaults to the default behaviour
set pure_user_host_location 0

# Show exit code of last command as a separate prompt character. As described here: https://github.com/sindresorhus/pure/wiki#show-exit-code-of-last-command-as-a-separate-prompt-character
# 0 - single prompt character, default
# 1 - separate prompt character
# Any other value defaults to the default behaviour
set pure_separate_prompt_on_error 1

# Max execution time of a process before its run time is shown when it exits
set pure_command_max_exec_time 5

# Poatage
alias eu='sudo etc-update'
alias es='sudo eix-sync'
alias em='sudo emerge --ask'
# Display package information
alias em-info 'sudo emerge --info'
# Rebuilding your entire system
alias em-update='sudo emerge -uDNav @world'
# Remove package
alias em-remove='sudo emerge --unmerge'
# Removing obsoleted packages
alias em-clean='sudo emerge --depclean'
# Search a package
alias em-search 'sudo emerge --search'
# Running revdep-rebuild
alias rr='sudo revdep-rebuild -p'

# Json pretty
alias pretty='python -mjson.tool | pygmentize -l json'

