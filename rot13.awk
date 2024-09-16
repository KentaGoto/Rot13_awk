BEGIN {
    split("ABCDEFGHIJKLMNOPQRSTUVWXYZ", upper_in, "");
    split("NOPQRSTUVWXYZABCDEFGHIJKLM", upper_out, "");
    split("abcdefghijklmnopqrstuvwxyz", lower_in, "");
    split("nopqrstuvwxyzabcdefghijklm", lower_out, "");

    for (i = 1; i <= 26; i++) {
        map[upper_in[i]] = upper_out[i];
        map[lower_in[i]] = lower_out[i];
    }
}

{
    for (i = 1; i <= length($0); i++) {
        char = substr($0, i, 1);
        if (char in map) {
            printf "%s", map[char];
        } else {
            printf "%s", char;
        }
    }
}