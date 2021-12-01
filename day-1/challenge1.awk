#! /usr/bin/env sh
# Self execute trick
{ "exec" "awk" "-f" "$0"; }

NR > 1 {
	if ($0 > prev) {
		increased += 1
	}
}

{ prev = $0 }

END {
	print increased
}
