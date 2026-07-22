#!/usr/bin/env bash
if [[ -z $1 || $1 == -h ]]; then
    cat <<EOF
Usage: mount-sshfs [OPTION] [ARGUMENTS]...

Options:

-h
    show this help output
-m REMOTEDIR TARGETDIR
    mount remote directory to target
-u TARGETDIR
    unmount remote directory from target
EOF

else
    if [[ $1 == -u ]]; then
        target=$2
        fusermount -u "$target"
    elif [[ $1 == -m ]]; then
        remotedir=$2
        target=$3
        sshfs "$remotedir" "$target"
    fi
fi
