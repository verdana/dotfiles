function proxy
    export all_proxy="http://127.0.0.1:1087"
    export http_proxy="http://127.0.0.1:1087"
    export https_proxy="http://127.0.0.1:1087"
    export no_proxy="localhost,*.app,192.168.*.*"
    env
end
