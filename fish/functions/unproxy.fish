function unproxy
    set -e   ALL_PROXY
    set -e  HTTP_PROXY
    set -e HTTPS_PROXY
    set -e RSYNC_PROXY
    set -e    NO_PROXY

    git config --global --unset http.proxy
    git config --global --unset https.proxy

    if command -sq npm
        npm config delete proxy       "http://$proxy"
        npm config delete https-proxy "http://$proxy"
    end
end
