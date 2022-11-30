function proxy
    # 设定默认的代理服务器
    set host_addr "127.0.0.1"

    # 是不是 wsl 环境
    if grep -iqs microsoft /proc/sys/kernel/osrelease
        set host_addr (/bin/grep -oP '(?<=nameserver\ ).*' /etc/resolv.conf)
    end

    # 如果指定了代理主机，优先级最高
    if count $argv > /dev/null
        set host_addr $argv[1]
    end

    set proxy "$host_addr:7890"

    # 设定全局代理
    export   all_proxy="socks5://$proxy"
    export rsync_proxy="http://$proxy"
    export  http_proxy="http://$proxy"
    export https_proxy="http://$proxy"
    export    no_proxy="localhost,127.0.0.1,::1,*.app,192.168.*.*"
    echo "set global proxy: $proxy"

    # 设定 git 代理
    git config --global  http.proxy "http://$proxy"
    git config --global https.proxy "http://$proxy"
    echo "set git proxy: $proxy"

    # 设定 npm 代理
    if command -sq node; and command -sq npm
        npm config set proxy       "http://$proxy"
        npm config set https-proxy "http://$proxy"
        echo "set npm proxy: $proxy"
    end

    # sudo apt 默认禁止带入当前用户的环境变量
    # 可以使用 sudo -E apt 即可获取当前的环境变量中的 http_proxy 代理
end

