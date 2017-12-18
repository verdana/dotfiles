function set-proxy
    set -lx HTTP_PROXY http://127.0.0.1:8128
    set -lx HTTPS_PROXY https://127.0.0.1:8128
    env
end
