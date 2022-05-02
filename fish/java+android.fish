
# Java & Android
# do not use ANDROID_HOME anymore

# MacOS
if test (uname -s) = "Darwin"
    set -gx JAVA_HOME           "/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home"
    set -gx ANDROID_SDK_ROOT    "/Volumes/Basaltic/Android/SDK"
end

# Arch
if grep -iqs arch /proc/sys/kernel/osrelease
    set -gx JAVA_HOME   "/usr/lib/jvm/java-11-openjdk"
end

