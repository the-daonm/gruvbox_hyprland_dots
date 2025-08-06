#!/usr/bin/env bash

# Set a temporary directory for image previews
tmp_dir="/tmp/cliphist"
# Clean up the directory from previous runs
rm -rf "$tmp_dir"
mkdir -p "$tmp_dir"

# If an entry is selected from the list (passed as $1), copy it back to the clipboard
if [[ -n "$1" ]]; then
  cliphist decode <<<"$1" | wl-copy
  exit
fi

# Define the gawk program to process the cliphist list
read -r -d '' prog <<EOF
# Rule 1: Skip any stray HTML meta entries
/^[0-9]+\s<meta http-equiv=/ { next }

# Rule 2: Handle image entries
match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp)/, grp) {
    # CORRECTED: Echo the *entire line* ($0) to cliphist decode.
    # This provides the full context needed to decode the binary data.
    # The output is redirected to a unique temp file.
    system("echo \"" \$0 "\" | cliphist decode >" tmp_dir "/" grp[1] "." grp[3])

    # Print the line with the path to the generated image as its icon
    print \$0"\0icon\x1f" tmp_dir "/" grp[1] "." grp[3]
    next
}

# Rule 3: Handle all other (non-image) entries
{
    # Print the line with a generic text icon
    print \$0"\0icon\x1faccessories-text-editor"
}
EOF

# CORRECTED: Use the '-v' flag to pass the shell variable $tmp_dir
# into the gawk script as a gawk variable named 'tmp_dir'.
cliphist list | gawk -v tmp_dir="$tmp_dir" "$prog"
