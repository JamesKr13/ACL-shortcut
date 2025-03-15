#!/bin/bash 

get_permission() {
	local file=$1
	local user=$2
	
	acl_output=$(getfacl "$file")
	if [[ $acl_output == *"# owner: $user"* ]]; then
		permissions=$(echo "$acl_output" | grep "^user::" | cut -d: -f3)
		output_permission "$permissions"
		
	elif [[ $(groups "$user") == *$(echo "$acl_output" | grep "^group: ")* ]]; then
		permissions=$(echo "$acl_output" | grep "^group::" | cut -d: -f3)
		output_permission "$permissions"
	else 
		permissions=$(echo "$acl_output" | grep "^other::" | cut -d: -f3)
		output_permission "$permissions"
	fi
	
}

output_permission() {
	output="$file ->"
	if [[ $1 == *"r"* ]]; then
		output+=" read"
	fi
	if [[ $1 == *"w"* ]]; then
		output+=" write"
	fi
	if [[ $1 == *"x"* ]]; then
		output+=" execute"
	fi
	
	echo "$output"
}

if id "$1" &>/dev/null; then 
	user=$1
	shift
	for arg in "$@";
	do 
		file_path=""
		dir_name=$(dirname "$arg")
		
		if [[  "$dir_name" != "." ]]; then
			file_path+=$(find . -type d -name "$dir_name")
			file_path+="/"
			file_path+=$(basename "$arg")
		else
			file_path+=$(find . -type d -name "$arg")
		fi
		get_permission $file_path $user
	done
else
	echo "Invalid user: User not found"
fi
