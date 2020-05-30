function pss
    /bin/ps -eo user,pid,ppid,pmem,rsz,etime,cmd $argv
end
