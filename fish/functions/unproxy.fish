function unproxy
    set -e all_proxy
    set -e http_proxy
    set -e https_proxy
    set -e no_proxy

    git config --global --unset http.proxy
    git config --global --unset https.proxy
end
