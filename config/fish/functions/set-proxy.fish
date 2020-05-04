function set-proxy
    set -gx http_proxy  http://127.0.0.1:1080
    set -gx https_proxy https://127.0.0.1:1080
    set -gx all_proxy   socks5://127.0.0.1:1080
    env
end
