#!/usr/bin/env bash

# set this to your active development branch
develop_branch="master"
current_branch="$(git rev-parse --abbrev-ref HEAD)"

# only check commit messages on main development branch
[ "$current_branch" != "$develop_branch" ] && exit 0

# regex to validate in commit msg
commit_regex='(bug-fix)'
error_msg="Aborting commit. Your commit message is missing "bug-fix" word"

if ! grep -iqE "$commit_regex" "$1"; then
    echo "$error_msg" >&2
    exit 1
fi
