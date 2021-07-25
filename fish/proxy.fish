
# setup proxy
set host_ip     (/bin/grep -oP '(?<=nameserver\ ).*' /etc/resolv.conf)
set proxy_addr  "http://$host_ip:7890"

# recreate ~/.bash_proxy
cp /dev/null ~/.bash_proxy

# system proxy
for k in all_proxy http_proxy https_proxy
    echo -e "export $k=\"$proxy_addr\"" | tee -a ~/.bash_proxy > /dev/null
end

# create apt proxy
printf "\
Acquire::http::proxy  \"$proxy_addr\";
Acquire::ftp::proxy   \"$proxy_addr\";
Acquire::https::proxy \"$proxy_addr\";
" >  ~/.apt_proxy

# apply proxy
. ~/.bash_proxy

