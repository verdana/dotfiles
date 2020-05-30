function unproxy
    set -e all_proxy
    set -e http_proxy
    set -e https_proxy
    env
end
