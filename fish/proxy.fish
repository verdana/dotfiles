
# setup proxy
set host_ip     (/bin/grep -oP '(?<=nameserver\ ).*' /etc/resolv.conf)
set proxy_addr  "http://$host_ip:7890"

# recreate ~/.bash_proxy
cp /dev/null ~/.bash_proxy

# system proxy
for k in HTTP_PROXY HTTPS_PROXY
    echo -e "export $k=\"$proxy_addr\"" | tee -a ~/.bash_proxy > /dev/null
end
echo -e "export NO_PROXY=localhost,127.0.0.1,::1,*.app,192.168.*.*"

# create apt proxy
printf "\
Acquire::http::proxy  \"$proxy_addr\";
Acquire::ftp::proxy   \"$proxy_addr\";
Acquire::https::proxy \"$proxy_addr\";
" >  ~/.apt_proxy

# apply proxy
. ~/.bash_proxy

