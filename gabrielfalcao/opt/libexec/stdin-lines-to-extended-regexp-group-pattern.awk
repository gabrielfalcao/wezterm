BEGIN {
    global_idx=0;
}

{
    target_plats[global_idx]=$1;
    global_idx+=1;
}

END {
    for (idx=0; idx < global_idx; idx++){
        if (idx==0) {
            printf("(");
        }
        printf("%s", target_plats[idx]); not_last=((idx+1) < global_idx);
        if (not_last) {
            printf("|");
        } else {
            printf(")\n");
        };
    };
}
