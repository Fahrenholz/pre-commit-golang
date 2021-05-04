#!/usr/bin/env bash
#
# Capture and print stdout, since gofumpt doesn't use proper exit codes
# as it is a drop-in replacement for gofmt
#
set -e

exec 5>&1
FILES=$(find . -name '*.go' | grep -v vendor | grep -v infrastructure)
output="$(gofumpt -l -w $FILES | tee /dev/fd/5)"
[[ -z "$output" ]]