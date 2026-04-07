#!/usr/bin/env gawk -f
BEGIN {
	delete match_info
	result = ""
}

{
	result = ""
	delete match_info
	for (i = 2; i <= NF; i++) {
		result = sprintf("%s%s ", result, $i)
	}
	result = gensub(/\s*$/, "", "g", result)
	orig_result = sprintf("%s", result)
	if (match(result, /^"(.*)"$/, match_info)) {
		orig_result = result
		result = match_info[1]
	} else {
		result = sprintf("%s", orig_result)
		printf "<%s>\n", NR
		if (orig_result) {
			printf "    orig_result: %s\n", orig_result
		}
		printf "         result: %s\n", result
		printf "</%s>\n\n", NR
		result = ""
	}
}

END {
	print ("\n")
}

