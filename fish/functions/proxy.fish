function proxy
    export http_proxy="http://$argv:7890"
    export https_proxy="http://$argv:7890"
    export all_proxy="socks5://$argv:7890"
    export no_proxy="localhost,127.0.0.1,*.app,192.168.*.*"
    env
end
