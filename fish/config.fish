
# common env variables
set -gx Language    en_US.en
set -gx LANG        en_US.UTF-8
set -gx LC_ALL      en_US.UTF-8
set -gx LC_COLLATE  C
set -gx VISUAL      vim
set -gx EDITOR      vim

# If wsl, go to home directory and setup proxy
if grep -iqs microsoft /proc/sys/kernel/osrelease
    cd $HOME
    source ~/.config/fish/proxy.fish
end

source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish
source ~/.config/fish/prompt.fish
source ~/.config/fish/java+android.fish

# for all things not checked into git
if test -e "$HOME/.local/config.fish"
    source "$HOME/.local/config.fish"
end

# pure prompt
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions $fish_function_path
source $HOME/.config/fish/functions/theme-pure/conf.d/pure.fish

# change the prompt text
set pure_symbol_prompt                  ">"
set pure_symbol_reverse_prompt          "<"
set pure_right_prompt                   " "
set pure_symbol_git_unpulled_commits    "➘"
set pure_symbol_git_unpushed_commits    "➚"
set pure_symbol_git_dirty               "+"
set pure_symbol_title_bar_separator     "-"

#set pure_color_git_branch   red
#set pure_color_git_dirty    red

# Homebrew
if command -sq brew
    set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
    set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
    set -gx HOMEBREW_BOTTLE_DOMAIN   "https://mirrors.ustc.edu.cn/homebrew-bottles"
end

# pyenv init
if type "pyenv" > /dev/null 2>&1
    status is-login; and pyenv init --path | source
    status is-interactive; and pyenv init - | source
end

# rbenv init
if type "rbenv" > /dev/null 2>&1
    # Build ruby with brew openssl
    set -gx RUBY_CONFIGURE_OPTS  "--with-openssl-dir="(brew --prefix openssl@1.1)
    status --is-interactive; and source (rbenv init -|psub)
end

# flutter china mirror
if command -sq flutter
    set -gx PUB_HOSTED_URL           https://pub.flutter-io.cn
    set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
end

# php composer
if command -sq composer
    set -gx COMPOSER_MEMORY_LIMIT -1
end

# ccache
if command -sq ccache
    set -gx CCACHE_PATH /usr/bin
    set -gx CCACHE_DIR  /tmp/ccache
end

