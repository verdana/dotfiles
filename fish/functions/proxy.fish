function proxy
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    export all_proxy="socks5://127.0.0.1:7890"
    export no_proxy="localhost,127.0.0.1,*.app,192.168.*.*"
    env
end
