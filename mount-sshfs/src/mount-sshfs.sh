#!/usr/bin/env bash
target=$2
if [[ $1 == -u ]]; then
    fusermount -u "$target"
else
    remotedir=$1
    sshfs "$remotedir" "$target"
fi
