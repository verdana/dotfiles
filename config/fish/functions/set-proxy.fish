function set-proxy
    set -gx HTTP_PROXY http://127.0.0.1:8128
    set -gx HTTPS_PROXY https://127.0.0.1:8128
    env
end
