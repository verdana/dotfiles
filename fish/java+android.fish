
# Java & Android
# do not use ANDROID_HOME anymore

# MacOS
if test (uname -s) = "Darwin"
    set -gx JAVA_HOME           "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home"
    set -gx ANDROID_SDK_ROOT    "$HOME/Galerida/Android/SDK"
end

# Arch
if grep -iqs arch /proc/sys/kernel/osrelease
    set -gx JAVA_HOME   "/usr/lib/jvm/java-8-openjdk"
end


