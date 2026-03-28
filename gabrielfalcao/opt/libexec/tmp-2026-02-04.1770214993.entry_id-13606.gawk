


BEGIN {no_echo=1}

(no_echo == 0) || ($1 ~ /^[1-9][0-9]{3,}$/ && $1 == "13606") {
    no_echo=0;
    print $1;
}


