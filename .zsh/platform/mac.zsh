

# coreutils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# gnu-tar
export PATH=/usr/local/opt/gnu-tar/libexec/gnubin:$PATH

# gnu-sed
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH

# CCache
export USE_CCACHE=1
export NDK_CCACHE=/usr/local/bin/ccache

# PHP5.6
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# GO
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Android NDK
export ANDROID_NDK=/usr/local/opt/android-ndk
# Android SDK
export ANDROID_SDK=/usr/local/opt/android-sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=$HOME/youybs-client/cocos2d/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/local/opt/android-ndk-r9d
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/opt/ant/libexec/bin
export PATH=$ANT_ROOT:$PATH

# Alias
alias ls='gls --color=auto'
alias ll='gls --color=auto -lhA'
alias dir='gdir --color=auto'
alias grep='grep --color=auto'

