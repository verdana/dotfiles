function pretty
    python -mjson.tool | pygmentize -l json $argv
end

