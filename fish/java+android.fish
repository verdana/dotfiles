
# Java & Android
# do not use ANDROID_HOME anymore

# MacOS
if test (uname -s) = Darwin
    set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home"
    set -gx ANDROID_SDK_ROOT /Volumes/Tsukino/Android/SDK
    set -gx GRADLE_USER_HOME /Volumes/Tsukino/Android/Gradle

    set pt /Volumes/Tsukino/Android/SDK/platform-tools/
    if test -d $pt
        fish_add_path -g $pt
    end
end

# Arch
if grep -iqs arch /proc/sys/kernel/osrelease
    set -gx JAVA_HOME /usr/lib/jvm/java-11-openjdk
end
