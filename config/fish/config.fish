# Common env variables
set -gx LC_COLLATE  C
set -gx TERM        xterm-256color
set -gx VISUAL      vim
set -gx EDITOR      vim

# Hadoop
#set -gx HADOOP_HOME                     $HOME/hadoop-2.7.6
#set -gx HADOOP_COMMON_LIB_NATIVE_DIR    $HADOOP_HOME/lib/native
#set -gx HADOOP_OPTS                     "-Djava.library.path=$HADOOP_HOME/lib:$HADOOP_COMMON_LIB_NATIVE_DIR"
#set -gx JAVA_HOME                       "/usr/lib/jvm/java-8-openjdk"
#set -gx SCALA_HOME                      "/usr/share/scala"
#set -gx LD_LIBRARY_PATH                 "$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH"

# Pure prompt
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions $fish_function_path

# User paths
set user_paths $user_paths              \
    $HOME/.config/composer/vendor/bin   \
    $HOME/.local/bin                    \
    $HOME/.yarn/bin                     \
    $HOME/go/bin                        \
    /usr/lib/ccache                     \
    /usr/local/cmake-3.9.0/bin          \
    /usr/local/go/bin                   \
    /usr/local/php-7.2/bin

for path in $user_paths
    if test -d $path
        set -U fish_user_paths $fish_user_paths $path
    end
end

# Change the prompt text
set pure_symbol_prompt         ">"
set pure_symbol_git_up_arrow   "^"
set pure_symbol_git_down_arrow "v"
set pure_symbol_git_dirty      "!"
set pure_symbol_horizontal_bar "_"

# Change the colors
set pure_color_blue     (set_color "6496D2")
set pure_color_cyan     (set_color "5F7175")
set pure_color_gray     (set_color "49483E")
set pure_color_green    (set_color "A5D23C")
set pure_color_normal   (set_color "F0F0F0")
set pure_color_red      (set_color "FA2673")
set pure_color_yellow   (set_color "F5BE78")

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

