function update-repo
    sudo proxychains4 apt update \
        -o Dir::Etc::sourcelist="sources.list.d/$argv" \
        -o Dir::Etc::sourceparts="-" \
        -o APT::Get::List-Cleanup="0"
end

