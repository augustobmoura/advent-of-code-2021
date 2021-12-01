#! /usr/bin/env sh
# Self execute trick
{ "exec" "awk" "-f" "$0"; }

NR > 3 {
	prev_window = prev[1] + prev[2] + prev[3]
	current_window = $0 + prev[1] + prev[2]

	if (current_window > prev_window) {
		increased += 1
	}
}

{
	prev[3] = prev[2]
	prev[2] = prev[1]
	prev[1] = $0
}

END {
	print increased
}
