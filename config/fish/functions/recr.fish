function recr -d "Rename all files in current dir"
    if test (count $argv) -ne 2
        echo "Usage: recr [old ext] [new ext]"
        return 1
    end

    for file in *.$argv[1]
        if test -f $file
            set -l newfile (basename $file .$argv[1]).$argv[2]
            command mv $file $newfile
            echo "->" $newfile
        end
    end
end

