#!/bin/sh

[[ $EUID != 0 ]] && echo "Please run as root.  Terminating..." && exit 1

export JAIL=/srv/http

## 删除所有文件
remove_all() {
    umount -f $JAIL/run > /dev/null 2>&1
    umount -f $JAIL/tmp > /dev/null 2>&1

    [ -d "$JAIL" ] && rm -rf $JAIL
}

# 建立基本的目录结构
create_dir() {
    mkdir -p $JAIL/etc/nginx
    mkdir -p $JAIL/usr/{bin,lib}
    mkdir -p $JAIL/usr/share/nginx
    mkdir -p $JAIL/var/{lib,log}/nginx
    mkdir -p $JAIL/www
    mkdir -p $JAIL/{run,tmp}
    cd $JAIL
    ln -s usr/bin bin
    ln -s usr/lib lib
    ln -s usr/lib lib64

    cd $JAIL/usr && ln -s lib lib64
    cd $JAIL/var && ln -s ../run run
}

# 创建 nginx 需要的 dev
create_dev() {
    mkdir -p $JAIL/dev
    mknod -m 0666 $JAIL/dev/null    c 1 3
    mknod -m 0666 $JAIL/dev/random  c 1 8
    mknod -m 0444 $JAIL/dev/urandom c 1 9
}

# 复制文件到 JAIL 目录
copy_files() {
    #cp -r /usr/share/nginx/* $JAIL/usr/share/nginx
    #cp -r /etc/nginx/*       $JAIL/etc/nginx
    #cp /usr/bin/nginx        $JAIL/bin

    #cp /lib/ld-linux-x86-64.so.2 $JAIL/lib
    #cp $(ldd /usr/bin/nginx | grep /usr/lib | sed -sre 's/(.+)(\/usr\/lib\/\S+).+/\2/g') $JAIL/lib

    cp /lib/libnss_* $JAIL/lib
    cp -rfL /etc/{services,localtime,nsswitch.conf,nscd.conf,protocols,hosts,ld.so.cache,ld.so.conf,resolv.conf,host.conf} $JAIL/etc
}

remove_all
create_dir
create_dev
copy_files

# Mount run/tmp as tmpfs
mount -t tmpfs none $JAIL/run -o 'noexec,size=1024k'
mount -t tmpfs none $JAIL/tmp -o 'noexec,size=102400k'

cat > $JAIL/etc/group <<EOF
http:x:33:
nobody:x:99:
EOF

cat > $JAIL/etc/passwd <<EOF
http:x:33:33:http:/:/bin/false
nobody:x:99:99:nobody:/:/bin/false
EOF

cat > $JAIL/etc/shadow <<EOF
http:x:14871::::::
nobody:x:14871::::::
EOF

cat > $JAIL/etc/gshadow <<EOF
http:::
nobody:::
EOF

touch $JAIL/etc/shells
#touch $JAIL/run/nginx.pid

# 最后配置文件、目录权限
chown -R root:root $JAIL/
chown -R http:http $JAIL/www
chown -R http:http $JAIL/etc/nginx
chown -R http:http $JAIL/var/{lib,log}/nginx
#chown http:http $JAIL/run/nginx.pid

#find $JAIL/    -gid 0 -uid 0 -type d -print | xargs chmod 111
#find $JAIL/etc -gid 0 -uid 0 -type f -print | xargs chmod 644

chmod 750 $JAIL/www
chmod 777 $JAIL/tmp
chmod 755 $JAIL/run

# vim: set fdm=marker ff=unix sw=4 ts=4 et:

