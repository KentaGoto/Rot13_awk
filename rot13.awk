# Function to initialize the Rot13 transformation map.
function init_rot13_map() {
    split("ABCDEFGHIJKLMNOPQRSTUVWXYZ", upper_in, "");
    split("NOPQRSTUVWXYZABCDEFGHIJKLM", upper_out, "");
    split("abcdefghijklmnopqrstuvwxyz", lower_in, "");
    split("nopqrstuvwxyzabcdefghijklm", lower_out, "");

    for (i = 1; i <= 26; i++) {
        rot13_map[upper_in[i]] = upper_out[i];
        rot13_map[lower_in[i]] = lower_out[i];
    }
}

# Function to convert a single line of string to Rot13.
function rot13_convert(line) {
    result = "";
    for (i = 1; i <= length(line); i++) {
        char = substr(line, i, 1);
        if (char in rot13_map) {
            result = result rot13_map[char];
        } else {
            result = result char;
        }
    }
    return result;
}

BEGIN {
    init_rot13_map();
}

{
    converted_line = rot13_convert($0);
    print converted_line;
}
