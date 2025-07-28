#/usr/bin/zsh
# Johnny Decimal Directory Navigation Plugin

# Set this to your Johnny Decimal root directory before using the plugin
JD_ROOT="$HOME/docs"

local find_jd() {
	local prefix="$1"

	if [[ -z "$prefix" ]]; then
		echo "$JD_ROOT"
	elif [[ "$prefix" =~ '^[0-9]{2}.[0-9]{2}$' ]]; then
		echo "$JD_ROOT/"*/*"/$prefix "*
	elif [[ "$prefix" =~ '^[0-9][1-9]$' ]]; then
		echo "$JD_ROOT/"*"/$prefix "*
	elif [[ "$prefix" =~ '^[0-9]0?( .*)?$' ]]; then
		echo "$JD_ROOT/$prefix"*
	fi
}

cjd() {
	cd "$(find_jd "${1%% *}")"
}

# Auto-completion function for cjd without GNU find
function _cjd_complete() {
	local prefix="${words[2]}"
	local base="$(find_jd "$prefix")"
	local candidates=()

	if [ ! -z "$prefix" ]; then
		candidates+=("$(basename "$base")")
	fi

	for d in "$base"/*; do
		if [ -d "$d" ]; then
			candidates+=("$(basename "$d")")
		fi
	done

	compadd -- "${candidates[@]}"
}

compdef _cjd_complete cjd
