function dsstore-cleanup -d "Remove .DS_Store"
    find . -type f -name ".DS_Store" -delete
end
