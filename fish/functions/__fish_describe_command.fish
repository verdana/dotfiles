# Defined in /var/folders/hc/cq25jfh13rz0plzgm3zn4z700000gn/T//fish.l1bqab/__fish_describe_command.fish @ line 2
function __fish_describe_command --description 'Command used to find descriptions for commands'
    # We're going to try to build a regex out of $argv inside awk.
    # Make sure $argv has no special characters.
    # TODO: stop interpolating argv into regex, and remove this hack.
	#string match --quiet --regex '^[a-zA-Z0-9_ ]+$' -- "$argv"
	#or return
	#type -q apropos; or return
	#apropos $argv 2>/dev/null | awk -v FS=" +- +" '{
	#	split($1, names, ", ");
	#	for (name in names)
	#		if (names[name] ~ /^'"$argv"'.* *\([18]\)/ ) {
	#sub( "( |\t)*\\\([18]\\\)", "", names[name] );
	#						sub( " \\\[.*\\\]", "", names[name] );
	#			print names[name] "\t" $2;
	#		}
	#}'
end
