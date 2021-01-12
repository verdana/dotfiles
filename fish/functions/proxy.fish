function proxy
    export http_proxy="http://$argv"
    export https_proxy="http://$argv"
    export all_proxy="socks5://$argv"
    export no_proxy="localhost,127.0.0.1,*.app,192.168.*.*"
    env
end
