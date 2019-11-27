function ll
	switch (uname)
		case Darwin
			/bin/ls -AGhlv $argv
		case '*'
			/bin/ls -Ahlv --color=auto $argv
	end
end
