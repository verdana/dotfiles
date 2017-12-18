function unset-proxy
    set -e HTTP_PROXY
    set -e HTTPS_PROXY
    env
end
