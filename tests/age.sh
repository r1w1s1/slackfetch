#!/bin/sh

set -eu

root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT HUP INT TERM

mkdir "$tmp/packages" "$tmp/root"
touch -d '10 days ago' "$tmp/packages/devs-2.3.1-noarch-25"
touch -d '1 day ago' "$tmp/packages/aaa_base-16.0-x86_64-1"

output="$(
    SLACKFETCH_PACKAGE_DIR="$tmp/packages" \
    SLACKFETCH_ROOT="$tmp/root" \
    NO_COLOR=1 "$root/slackfetch" -m
)"

printf '%s\n' "$output" | grep 'uptime:.*(age 10d)' >/dev/null
printf '%s\n' 'age test passed'
