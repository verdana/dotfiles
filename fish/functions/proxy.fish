function proxy
    # 设定默认的代理服务器
    set host_addr "127.0.0.1"

    # 是不是 wsl 环境
    if grep -iqs microsoft /proc/sys/kernel/osrelease
        set host_addr (/bin/grep -oP '(?<=nameserver\ ).*' /etc/resolv.conf)
    end

    set proxy "$host_addr:7890"

    # 设定全局代理
    export http_proxy="http://$proxy"
    export https_proxy="http://$proxy"
    export all_proxy="socks5://$proxy"
    export no_proxy="localhost,127.0.0.1,*.app,192.168.*.*"
    echo "set global proxy: $proxy"

    # 设定 Git 代理
    git config --global http.proxy  "socks5://$proxy"
    git config --global https.proxy "socks5://$proxy"
    echo "set git proxy: $proxy"

    # 如果是 Debian/Ubuntu，设定 apt 代理
end

