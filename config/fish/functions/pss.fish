function pss
    /bin/ps -eo user,pid,ppid,pmem,rsz,vsz,time,etime,cmd $argv
end
