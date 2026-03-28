#!/usr/bin/env gawk -f


function ordinal(n,    s, last_digit, second_last_digit) {
    if (n % 100 >= 11 && n % 100 <= 13) {
        s = "th"
    } else {
        last_digit = n % 10
        if (last_digit == 1) s = "st"
        else if (last_digit == 2) s = "nd"
        else if (last_digit == 3) s = "rd"
        else s = "th"
    }
    return n s
}


BEGIN {
    regexp = "^[[:space:]]*([1-9]+[0-9]*)[[:space:]]+(@([0-9]{9,}):([^[:space:]]+))?([[:space:]]*([^[:space:]]+.*|.*))$"
    delete lines_matching_regexp
    delete line_numbers_matching_regexp
    delete line_numbers_continuation
    delete joined_history_lines_by_entry_id
}


#()(()())(())

{


    if (regexp ~ $0) {
	cid = gensub(regexp, "\\1", "g", $0)
	hist_timestring = gensub(regexp, "\\2", "g", $0)
	hist_timestamp_s = gensub(regexp, "\\3", "g", $0)
	hist_ts = int(hist_timestamp_s)
	cmd = gensub(regexp, "\\5", "g", $0)
	if (! items[cmd]) {
		items[cmd] = cmd
		hist_indexes[cmd] = cid
		hist_timestamps[cmd] = hist_ts
		row_numbers[cmd] = NR
	}
}

END {
	for (cmd in items) {
            pos=hist_indexes[cmd];
            pos_ord=ordinal(pos);
            exec_timestamp=hist_timestamps[cmd];
            exec_datetime=strftime("%Y/%m/%d %H:%M:%S",exec_timestamp);
            printf("\033[0m\033[1;38;5;240m%s command\033[1;38;5;245mexecuted at %s\033[0m\n%s\n",

cmd
	}
}
