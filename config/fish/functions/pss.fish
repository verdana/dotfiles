function pss
    /bin/ps -eo user,pid,ppid,pmem,time,etime,cmd $argv
end
