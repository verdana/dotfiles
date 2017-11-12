function dl --description "Parallel and resumable download with aria2c"
    aria2c -c -x 4 $argv[1]
end
