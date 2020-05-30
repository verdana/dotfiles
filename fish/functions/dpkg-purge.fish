function dpkg-purge
    dpkg -l | grep '^rc' | awk '{print $2}' | xargs sudo apt-get -y purge
end
