function update-time
    systemctl stop ntpd; ntpd -gq; systemctl start ntpd
end
