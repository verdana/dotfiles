function proxy
    export all_proxy="socks5://127.0.0.1:1080"
    export http_proxy="socks5://127.0.0.1:1080"
    export https_proxy="socks5://127.0.0.1:1080"
    env
end
