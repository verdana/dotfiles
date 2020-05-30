function psmem
    ps aux | grep $argv | sort -k4,4nr | head -n 10
end
